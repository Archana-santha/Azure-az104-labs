# Azure Storage Account – SAS Token Lab

## 📌 Lab Overview
This lab demonstrates the creation of a secure Azure Storage Account, private blob container, and generation of a container-level Shared Access Signature (SAS) to provide temporary, limited access. The container was successfully accessed using Azure Storage Explorer without Azure AD login.

---

## 🎯 Objective
- Create a Storage Account with secure configuration
- Create a private blob container
- Upload a test blob
- Generate container-level SAS token
- Access the container using Azure Storage Explorer

---

## 🛠 Environment Details
- Performance: Standard
- Redundancy: Locally-redundant storage (LRS)
- Public Blob Access: Disabled
- Tag Applied: Environment = Lab

---

## 🔹 Step 1 – Storage Account Creation
- Created new Resource Group
- Selected Standard performance
- Selected LRS redundancy
- Disabled public blob access
- Added tag for environment classification

(Screenshot here)

---

## 🔹 Step 2 – Blob Container Creation
- Container Name: testcontainer
- Public Access Level: Private (no anonymous access)

(Screenshot here)

---

## 🔹 Step 3 – Upload Blob
- Uploaded sample file to container

(Screenshot here)

---

## 🔹 Step 4 – Generate Container-Level SAS
- Permissions: Read, List
- Expiry: 1 hour
- Generated SAS URL from container-level settings

⚠️ Note: Account-level SAS does not work for direct container connection in Storage Explorer. Container-level SAS must include the container path.

(Screenshot here – sensitive values masked)

---

## 🔹 Step 5 – Access Using Azure Storage Explorer
- Connected using SAS URL
- Successfully accessed container without Azure AD authentication

(Screenshot here)

---

## 🧠 Key Learnings
- Difference between Account-level and Container-level SAS
- How to provide temporary access without RBAC
- Importance of private containers
- Secure handling of storage credentials
- Practical troubleshooting of SAS URL errors

---

## 🔐 Security Best Practices Followed
- No public blob access
- Limited SAS permissions
- Short expiry time

---

## 📌 Conclusion
This lab demonstrates secure storage configuration and temporary access management using SAS, a common requirement in enterprise Azure environments.
