# 🛡️ Cybersecurity Web Traffic Anomaly Detection

## 📌 Overview
This project focuses on detecting **suspicious and potentially malicious web traffic behavior** using **unsupervised machine learning and ensemble anomaly detection techniques**.  
In the absence of labeled attack data, multiple anomaly detection models are combined to identify high-confidence abnormal patterns in web interactions.

The project demonstrates an **end-to-end cybersecurity analytics workflow**, covering data cleaning, feature engineering, exploratory analysis, unsupervised machine learning, ensemble modeling, and security interpretation.

---

## 🎯 Objectives
- Detect anomalous web traffic behavior indicative of potential cyber threats
- Apply and compare multiple unsupervised anomaly detection techniques
- Reduce false positives using an ensemble consensus approach
- Analyze suspicious behavior from a cybersecurity perspective
- Demonstrate SQL, Excel, Python, ML, and security analytics skills in a single project


---

## 📊 Dataset Description
The dataset contains **aggregated web interaction behavior**, including:
- Inbound and outbound traffic volumes
- Traffic ratios
- Time-based activity features
- Repeated source IP indicators
- Geographic metadata

📌 *The data is aggregated over fixed time windows, which influenced feature selection and interpretation.*

---

## 🧹 Data Cleaning & Feature Engineering
Data preparation was performed using **Excel and Python**:

- **Excel**
  - Initial data inspection and cleaning
  - Validation of missing values and data consistency
  - Creation and verification of derived features
  - Exploratory aggregation and sanity checks

- **Python (pandas)**
  - Feature refinement and selection
  - Creation of security-relevant features such as:
    - Outbound-to-inbound traffic ratio
    - Repeated source IP flag
    - Time-based behavioral indicators
  - Preparation of ML-ready datasets

---

## 🧠 Methodology

### 1️⃣ Exploratory Data Analysis (EDA)
- Examined traffic volume distributions
- Identified behavioral outliers
- Focused on security-relevant patterns rather than generic statistics

---

### 2️⃣ Feature Scaling
Selected numerical features were standardized to ensure fair contribution to distance-based and anomaly detection models.

---

### 3️⃣ Unsupervised Machine Learning Models
The following models were applied:

| Model | Purpose |
|------|--------|
| K-Means | Behavioral clustering and rare traffic groups |
| Isolation Forest | Global anomaly detection |
| Local Outlier Factor (LOF) | Local density-based anomalies |
| DBSCAN | Density-based noise detection |

Each model captures **different anomaly characteristics**, making them suitable for ensemble analysis.

---

### 4️⃣ Ensemble Anomaly Detection
A **consensus-based ensemble approach** was used:
- Each model generates a binary anomaly signal
- An anomaly vote count is calculated per record
- Traffic is flagged as suspicious only when **two or more models agree**

This approach:
- Reduces false positives
- Improves robustness
- Reflects real-world SOC detection strategies

---

## 🔍 Model Comparison & Agreement
- Individual models detected anomalies at varying rates
- No single model dominated the results
- Majority of traffic received zero anomaly votes
- A small subset showed multi-model consensus, indicating high-confidence anomalies

---

## 🔐 Security Analysis & Findings
Key observations from suspicious traffic:
- Significantly higher inbound, outbound, and total traffic volumes
- Elevated outbound-to-inbound traffic ratios
- Repeated source IP behavior indicating persistence or automation
- Time-based clustering consistent with non-random activity

---

## 🌍 Geographic & Temporal Patterns
- Suspicious activity concentrated during specific hours, suggesting automated behavior
- All suspicious traffic originated from U.S.-based IPs, highlighting that **geolocation alone is not a reliable indicator of malicious intent**
- Likely reflects the use of domestic cloud or compromised infrastructure

---

## 🧩 SQL Analysis
The project includes a dedicated SQL script:
**`cybersecurity_web_attack_sql_analysis.sql`**

This demonstrates:
- Backend data exploration
- Traffic aggregation and filtering
- Feature extraction using SQL
- Complementary analytical skills beyond Python

---

## ⚠️ Limitations
- Aggregated data limits session-level granularity
- Absence of labeled attack data prevents supervised learning
- Detected anomalies indicate **suspicious behavior**, not confirmed attacks

---

## 🚀 Future Improvements
- Incorporate raw request-level logs
- Add supervised classification with labeled attack data
- Include user-agent and endpoint metadata
- Extend analysis to real-time or streaming detection
- Map findings more explicitly to MITRE ATT&CK techniques

---

## 🛠️ Tech Stack
- **Excel** – Data cleaning and preliminary feature engineering  
- **Python** – pandas, NumPy, scikit-learn  
- **Machine Learning** – Isolation Forest, LOF, DBSCAN, K-Means  
- **SQL** – Analytical querying and aggregation  
- **Visualization** – Matplotlib  
- **Domain** – Cybersecurity & Web Traffic Analysis

---

## 👤 Author
**Rahul**  
Aspiring Data Analyst  

---

## ⭐ Final Note
This project demonstrates how **unsupervised machine learning and ensemble techniques** can be applied to real-world cybersecurity monitoring, emphasizing interpretability, robustness, and practical security insights.

