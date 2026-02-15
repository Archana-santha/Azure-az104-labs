// -----------------------------
// Parameters
// -----------------------------
param location string = 'westus2'
param vmName string = 'vmbicep'
param adminUsername string = 'vmbicepadmin'
@secure()
param adminPassword string = 'Az@vmbicepdemo2026'
param vmSize string = 'Standard_B2as_v2'

// -----------------------------
// Existing VNet/Subnet
// -----------------------------
param vnetName string = 'vnet-bicep-lab'
param subnetName string = 'subnet-web'

resource vnet 'Microsoft.Network/virtualNetworks@2022-07-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-07-01' existing = {
  parent: vnet
  name: subnetName
}

// -----------------------------
// Network Security Group for SSH
// -----------------------------
resource nsg 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
  name: '${vmName}-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowSSH'
        properties: {
          priority: 1000
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

// -----------------------------
// Standard Public IP
// -----------------------------
resource publicIp 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: '${vmName}-pip'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

// -----------------------------
// Network Interface
// -----------------------------
resource nic 'Microsoft.Network/networkInterfaces@2022-07-01' = {
  name: '${vmName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnet.id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

// -----------------------------
// Linux VM
// -----------------------------
resource vm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
      linuxConfiguration: {
        disablePasswordAuthentication: false
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '16_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
  }
}

