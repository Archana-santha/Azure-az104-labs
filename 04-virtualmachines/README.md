# 🔹 Azure Virtual Machines Lab

## 📌 Objective

To deploy and manage Windows and Linux Virtual Machines in Azure and understand authentication, networking, and OS-level management.

---

## 🏗 Lab Architecture

- 1 Windows VM (RDP access)
- 1 Linux VM (SSH key authentication)
- Deployed inside Azure Virtual Network
- NSG configured for:
  - Port 3389 (RDP)
  - Port 22 (SSH)

---

## 💻 Windows VM Deployment

- OS: Windows Server
- Authentication: Username & Password
- Connected via RDP
- Verified private and public IP configuration

### Key Learning:
- RDP uses port 3389
- Public IP allows remote connectivity
- NSG must allow inbound RDP

---

## 🐧 Linux VM Deployment

- OS: Ubuntu Server 22.04 LTS (Canonical)
- Authentication: SSH Key (Public/Private Key Pair)
- Connected using:

```bash
ssh -i privatekey.pem username@public-ip
```

### Issues Faced:

- Selected wrong marketplace image (paid offer)
- Fixed by selecting official Canonical image
- Faced "Permission denied (publickey)" error
- Resolved by using correct admin username

---

## 🔐 Security Concepts Practiced

- SSH key-based authentication
- NSG inbound rule configuration
- Public vs Private IP understanding
- Host fingerprint verification

---

## 🎓 Key Learnings

- Linux VMs use SSH (port 22)
- Windows VMs use RDP (port 3389)
- SSH key authentication is more secure than passwords
- Marketplace images may require paid subscription
- Correct username is critical for SSH login
- NSG rules must explicitly allow inbound traffic

---

## 🚀 Skills Demonstrated

- VM deployment
- OS selection & configuration
- SSH connectivity troubleshooting
- RDP connectivity
- Basic Linux command usage
- Network security configuration
