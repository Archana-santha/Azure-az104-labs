# 🔄 Azure VM Resize 

## 📌 Objective

To resize Azure Virtual Machines by changing their SKU (size), understand downtime requirements, and compare burstable vs general-purpose VM families.

---

## 🏗 Lab Environment

### Before Resize

| VM Name | Original Size | vCPU | RAM | Series |
|----------|--------------|------|------|--------|
| linux-vm | Standard_B2as_v2 | 2 | 8 GiB | B-Series (AMD) |
| windows-vm | Standard_B2as_v2 | 2 | 8 GiB | B-Series (AMD) |

---

## 🟢 Step 1 – Deallocate the VM

Azure requires VM deallocation before resizing in most cases.

Steps:
1. Navigate to **Azure Portal → Virtual Machine → Overview**
2. Click **Stop**
3. Wait until status shows:
   ```
   Stopped (Deallocated)
   ```

⚠️ Important:
- Deallocation releases compute resources.
- Dynamic Public IP may change after deallocation.
- OS and data disks remain intact.

---

## 🟢 Step 2 – Resize Linux VM

1. Navigate to **linux-vm → Size**
2. Selected:
   ```
   Standard_B2s_v2
   ```
3. Clicked **Resize**
4. Started the VM

### 🔎 New Configuration

| VM | New Size | vCPU | RAM | Series |
|----|----------|------|------|--------|
| linux-vm | Standard_B2s_v2 | 2 | 8 GiB | B-Series (Intel) |

### 📘 Learning

- B2as_v2 → AMD processor
- B2s_v2 → Intel processor
- B-Series uses burstable CPU credit model
- Suitable for dev/test and low-to-medium workloads

---

## 🟢 Step 3 – Resize Windows VM

1. Navigated to **windows-vm → Size**
2. Selected:
   ```
   Standard_D2ls_v5
   ```
3. Clicked **Resize**
4. Started the VM

### 🔎 New Configuration

| VM | New Size | vCPU | RAM | Series |
|----|----------|------|------|--------|
| windows-vm | Standard_D2ls_v5 | 2 | 8 GiB | D-Series (v5) |

### 📘 Learning

- D-Series provides consistent CPU performance
- No burstable credit system
- Suitable for production workloads
- v5 indicates newer generation hardware
- "s" supports Premium SSD
- "l" indicates low memory optimized variant

---

## 🧠 B-Series vs D-Series Comparison

| Feature | B-Series | D-Series |
|----------|----------|----------|
| CPU Model | Burstable | Dedicated |
| CPU Credits | Yes | No |
| Performance | Variable | Consistent |
| Use Case | Dev/Test | Production |
| Cost | Lower | Higher |

---

## ⚠️ Important Resize Considerations

- VM must be deallocated before resizing (in most cases)
- Not all sizes are available in all regions
- Resize may fail due to:
  - Region capacity
  - SKU availability
  - Subscription quota limits
- Public IP may change if dynamic
- Disks remain unaffected

---

## 🎓 Key Learnings

- Azure VM resizing changes underlying hardware allocation
- SKU families determine workload suitability
- Understanding burstable vs dedicated compute is critical
- Always verify VM status after resize
- Deallocation is mandatory for hardware change

---

