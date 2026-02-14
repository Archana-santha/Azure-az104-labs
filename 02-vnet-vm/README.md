## Virtual Network (VNet)

Name: vnet_lab  
Region: West US 2  
Resource Group: rg-demo-lab  

### Description
This Virtual Network was created to host the virtual machines for testing and learning purposes.

### Configuration
- Address space: 10.0.0.0/16  
- Subnet: default (10.0.0.0/24)

### Screenshot
vnetlab.jpg

---

## Virtual Machine (VM)

Name: vmdemo1  
Region: West US 2  
Resource Group: rg-demo-lab  
Image: Windows Server 2025 Datacenter (x64 Gen2)  
Size: Standard B2as v2 (2 vcpus, 8 GiB memory) 

### Description
This Windows virtual machine is used for lab/testing purposes.

### Access
- Access method: RDP  
- Inbound port: 3389  
- Authentication: Username/Password  

### Screenshot

### Notes
- VM is deployed inside the above VNet.
- Remember to stop/deallocate the VM when not in use to save credits.

