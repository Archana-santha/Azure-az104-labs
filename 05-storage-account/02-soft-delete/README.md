# Azure Blob Storage – Soft Delete Configuration

## 📌 Objective
To enable Blob Soft Delete and test restoration of deleted blobs to ensure data protection against accidental deletion.

---

## 🛠 Configuration Steps

1. Login to Azure Portal.
2. Navigate to the Storage Account.
3. Go to **Data protection** under Settings.
4. Enable:
   - ✅ Blob soft delete
5. Set retention period to **7 days**.
6. Click **Save**.

---

## 🧪 Restore Test Procedure

1. Upload a sample blob to the container.
2. Delete the blob.
3. Navigate to the container.
4. Click **Show deleted blobs**.
5. Select the deleted blob.
6. Click **Restore**.

---

## ✅ Result

The deleted blob was successfully restored within the retention period.

---

## 💡 Why Soft Delete Is Important

- Protects against accidental deletion
- Allows recovery within retention window
- Enhances data reliability
- No need for immediate backup restoration

---


