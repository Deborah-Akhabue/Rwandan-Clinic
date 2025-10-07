# Analyzing Monthly Trends of Flu Cases and Treatment Costs

### Scenario
The financial planning department at a **Rwandan clinic** is working to forecast its budget for the upcoming year.  
They know that flu season significantly impacts patient volume and treatment costs, but they lack a clear, data-driven understanding of when the season peaks and how much it costs.

---

### Objective
Your primary goal is to **clean and analyze** the dataset to uncover monthly trends in flu cases and related treatment expenses.

---

### Data Cleaning Tasks
 **Standardize Date Formats:** Convert multiple date formats (e.g., `September 15, 2025`, `2024/05/12`, `TT:04/22/2025`) into a single, consistent format.  
 **Clean Cost Column:** Remove non-numeric characters and fix data entry errors.  
 **Validate Columns:** Ensure that all fields are standardized and accurate before analysis.

---

### Analysis Steps
- Extract **month** and **year** from the cleaned date column.  
- Filter data to include only records where the **diagnosis = 'Flu'**.  
- Group data by **month and year** to calculate:  
  - Total number of flu cases  
  - Total treatment costs  

---

### Deliverables
1. A **summary table** showing:
   - Month and year  
   - Total flu cases  
   - Total treatment costs  
2. A **brief written insight** answering:  
   > "Which months represent the peak of the flu season in terms of cases and costs?"

---

### Skills Demonstrated
- Advanced **data cleaning** and transformation  
- **Date and time manipulation**  
- **Time-series aggregation** and trend analysis using SQL  
- **Filtering and analytical reasoning** to interpret clinical data patterns  

---

###  File
- `flu_trends_analysis.sql` – contains SQL queries for data cleaning, transformation, and trend analysis.

---

###  Insight Example
> The results indicate that flu cases and treatment costs typically peak between **June and August**, suggesting a need for increased budget allocation and resource planning during this period.

---


