#  Azure Resource Locks – Hands-On Lab

## Overview

In this lab, I implemented Azure Resource Locks to understand how Azure protects critical resources from accidental deletion or modification.

Resource Locks are especially important in production environments where accidental deletion can cause downtime or data loss.

---

## Objective

The goal of this lab was to:

- Apply a Delete Lock (CanNotDelete) to a resource
- Test whether the lock prevents deletion
- Remove the lock and verify normal operation

---

## Resource Used

- Azure Storage Account (used as test resource)
- Azure Portal

---

## Implementation

### Step 1 – Applied Delete Lock

1. Navigated to the Storage Account.
2. Selected **Locks** from the left-side menu.
3. Clicked **+ Add**.
4. Entered lock name: `Production-Delete-Lock`.
5. Selected lock type: **Delete (CanNotDelete)**.
6. Clicked OK to create the lock.

The lock was successfully applied.

---

### Step 2 – Tested the Lock

After applying the lock, I attempted to delete the Storage Account.

Azure prevented the deletion and displayed an error stating that the resource is locked.

This confirmed that the lock was functioning correctly.

---

### Step 3 – Removed the Lock

1. Returned to the **Locks** section.
2. Selected the lock.
3. Deleted the lock.
4. Attempted deletion again (which succeeded after removing the lock).

---

## Key Observations

- A Delete Lock prevents the resource from being deleted.
- Even users with Owner role cannot delete a locked resource.
- Locks can be applied at:
  - Subscription level
  - Resource Group level
  - Individual Resource level
- Locks are inherited by child resources.

---
## Conclusion

This lab helped me understand how Azure Resource Locks provide an additional layer of protection beyond role-based access control. It reinforced the importance of implementing protective measures in production environments.
