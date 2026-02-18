# Azure Blob Storage – Lifecycle Management Policy

## 📌 Objective
To configure automated lifecycle management rules to optimize storage cost by transitioning and deleting blobs based on inactivity.

---

## 🛠 Configuration Steps

1. Login to Azure Portal.
2. Open the Storage Account.
3. Navigate to **Lifecycle management** under Data management.
4. Click **Add a rule**.
5. Provide a rule name.
6. Set rule scope to apply to all blobs.

---

## 📊 Rule Configuration

### Rule Name:
Move-to-Cool-and-Delete

---

### Policy Conditions

#### Rule 1:
- If blob **Last Modified > 30 days**
- Then ➝ Move to **Cool tier**

#### Rule 2:
- If blob **Last Modified > 90 days**
- Then ➝ Delete the blob

---

## ✅ Result

Blobs automatically move to the Cool tier after 30 days of inactivity and are permanently deleted after 90 days.

---

## 💰 Cost Optimization Strategy

This configuration helps:

- Reduce storage cost for inactive data
- Automatically clean up unused data
- Prevent long-term unnecessary storage charges
- Enforce data retention policies

---

