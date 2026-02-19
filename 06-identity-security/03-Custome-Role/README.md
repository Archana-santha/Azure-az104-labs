# 🧱 Azure Custom Role – VM Start/Stop Operator

## 🎯 Objective

To create a custom RBAC role that allows starting and stopping virtual machines only.

---

## 🛠 Services Used

- Azure Subscription
- Access Control (IAM)

---

## 🚀 Implementation Steps

### Step 1: Created Custom Role
Role Name:
VM-Start-Stop-Operator

Permissions Added:
- Microsoft.Compute/virtualMachines/start/action
- Microsoft.Compute/virtualMachines/deallocate/action
- Microsoft.Compute/virtualMachines/read

Assignable Scope:
Subscription

### Step 2: Assigned Custom Role
- Assigned VM-Start-Stop-Operator role to labuser1

---

## 🧠 Key Learnings

- Custom roles allow implementation of least privilege
- Built-in roles may grant more access than required
- Custom roles are stored at subscription level

---

## 📌 Conclusion

Successfully created and assigned a custom role to restrict VM access to start/stop operations only.
