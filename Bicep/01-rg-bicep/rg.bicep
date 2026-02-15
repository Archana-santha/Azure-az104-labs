param rgName string = 'rg-bicep-lab'
param location string = 'westus2'

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName
  location: location
}
