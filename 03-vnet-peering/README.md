# VNet Peering & VM Connectivity Testing

## 📌 Objective

To design and configure two separate virtual networks (Prod and Dev), deploy virtual machines inside each network, establish VNet peering between them, and verify private connectivity.

---

## Step 1: Virtual Network Creation

### 🔹 vnet-prod
- Address Space: 10.0.0.0/16
- Subnet: subnet-prod (10.0.1.0/24)
- Region: Same region as vnet-dev

### 🔹 vnet-dev
- Address Space: 10.1.0.0/16
- Subnet: subnet-dev (10.1.1.0/24)
- Region: Same region as vnet-prod

✔️ Ensured address spaces were not overlapping.  
✔️ Both VNets created successfully.

---

## Step 2: Virtual Machine Creation

### 🔹 vm-prod
- Deployed inside: vnet-prod
- Subnet: subnet-prod
- OS: Windows Server
- Public IP: Enabled (for RDP access)

### 🔹 vm-dev
- Deployed inside: vnet-dev
- Subnet: subnet-dev
- OS: Windows Server
- Public IP: Enabled (for RDP access)

✔️ Successfully connected to both VMs using RDP.  
✔️ Verified private IP addresses assigned correctly.

---

## Step 3: VNet Peering Configuration

Configured bidirectional peering:

- vnet-prod ➝ vnet-dev
- vnet-dev ➝ vnet-prod

### Peering Settings:
- Allow virtual network access: Enabled
- Allow forwarded traffic: Disabled
- Allow gateway transit: Disabled
- Use remote gateways: Disabled

✔️ Peering status showed **Connected**.

---

##  Step 4: Connectivity Test (Issue Encountered)

From vm-dev, attempted to ping the private IP of vm-prod.

###  Result:
Request timed out...
Even though peering status showed **Connected**.

---

## 🔍 Problem Analysis

I learned that:

- VNet peering allows routing between networks.
- Peering does NOT automatically allow traffic.
- Network Security Groups (NSGs) block ICMP by default.
- Windows Firewall inside the VM blocks ICMP by default.
- Security rules must explicitly allow required traffic.


## Step 5: Troubleshooting & Fix

### 1️. Enabled ICMP in Windows Firewall

Executed the following PowerShell command inside both VMs:

```powershell
New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Protocol ICMPv4 -Action Allow**

---

## 2. Updated NSG Rules

To resolve the connectivity issue, I configured an inbound security rule in the Network Security Group (NSG).

### Rule Configuration:
- **Source:** Other VNet address range
- **Protocol:** ICMP
- **Action:** Allow

This rule enabled ICMP traffic between the peered virtual networks.

---

## ✅ Final Result

- Successfully pinged from **vm-dev** to **vm-prod** using private IP address.
- Verified that **VNet peering is functioning correctly**.
- Confirmed private communication between VNets over the Azure backbone network.

---

## 🎓 Key Learnings

- VNet Peering enables private connectivity but does **not** override security configurations.
- Network Security Groups (NSGs) and operating system firewalls must explicitly allow required traffic.
- ICMP traffic is blocked by default in Azure for security reasons.
- Effective troubleshooting requires validating:

  - ✔️ Peering status  
  - ✔️ Address space overlap  
  - ✔️ NSG rules  
  - ✔️ Operating system firewall rules  

---
