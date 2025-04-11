# Data Science TA Assignment – Cuvette

This repository contains the solutions for all sections of the Data Science TA Hiring Assignment, including Python + Machine Learning, SQL, Excel, Tableau, Bonus reflections, and AI Tools & LLMs prompt engineering.

---

## Section 1: Python + Machine Learning

- **Dataset**: Student Performance (Math, Reading, Writing scores)
- **Data Cleaning**: Computed `average_score`, created binary `pass/fail` target (1 if avg ≥ 40), label-encoded categorical features.
- **EDA**: Plotted distribution of average scores, pass/fail counts, boxplots by gender, and a correlation heatmap of features.
- **Modeling**: Trained Logistic Regression and Random Forest classifiers with `class_weight='balanced'` to address class imbalance, using only non-score features.
- **Evaluation**: Compared accuracy, confusion matrices, and classification reports. Logistic Regression achieved 69% accuracy with 60% recall on failures; Random Forest achieved 85.5% accuracy but low minority recall.

---

## Section 2: SQL Queries (Chinook Database)

1. **Top 5 Customers**: Summed `Invoice.Total` per customer, ordered descending, limited to five.
2. **Most Popular Genre**: Counted tracks sold per genre via `InvoiceLine` → `Track` → `Genre`, selected top.
3. **Managers & Subordinates**: Self-joined `Employee` on `ReportsTo` to list each manager with their direct reports.
4. **Top Album per Artist**: Aggregated sales per album, used `ROW_NUMBER() OVER (PARTITION BY ArtistId ORDER BY COUNT DESC)` to pick the best-selling album.
5. **Monthly Sales Trend (MySQL)**: Filtered `InvoiceDate` to 2013, grouped by `DATE_FORMAT('%Y-%m')`, summed `Total`, and ordered by month.

---

## Section 3: Tableau Dashboard (Airbnb NYC)

- **Data Preparation**: Removed nulls and negative quantities, created `TotalSales` = `Quantity * UnitPrice`, extracted `Month` via `=TEXT(InvoiceDate,"yyyy-mm")`.
- **Views**:
  - *Listings by Neighborhood*: Bar chart of distinct listing counts.
  - *Price Distribution*: Box plot of median prices by room type.
  - *Availability Trends*: Line chart of average availability over time using `DATETRUNC('month',[Last_Review])`.
- **Dashboard**: Combined three views, added filters for `Room Type` and `Neighborhood`, published to Tableau Public as **"NYC Airbnb Trends"**.
- **Dashboard Link**: https://public.tableau.com/views/NYCAirbnb_17443613963210/NYCAirbnbTrends?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

---

## Section 4: Excel Analysis (Online Retail)

- **Cleaning**: Removed rows with blank descriptions and negative quantities, removed duplicates.
- **TotalSales Column**: Created `=Quantity*UnitPrice` for each transaction.
- **Pivot Table**: Summed `TotalSales` by `Country` (rows) and `Month` (columns).
- **Formulas**:
  - *Average Order Value*: Total sales divided by distinct order count (`COUNTA(UNIQUE(InvoiceNo))`).
  - *% Contribution*: Each country’s sales divided by grand total, formatted as percent.
- **Conditional Formatting**: Highlighted top 5 countries by revenue.
- **Chart**: Generated a line chart of monthly total sales trends.

---

## Section 5: Bonus Reflections

### Supporting Students

I create a supportive environment, break tasks into manageable milestones, and adapt explanations to each learner’s style. For conceptual struggles, I use analogies and interactive examples. For deadline pressure, I help with prioritization, time management techniques, and regular check-ins to keep students on track.

### Explaining Gradient Descent

I start with a relatable analogy: finding the lowest point in a valley while blindfolded, taking steps based on the slope. I then introduce the loss function and the gradient, explain the learning rate as step size, and use visualizations and code snippets to show how iterative updates optimize model parameters.

---

## Section 6: AI Tools & LLMs

- **Prompt Used**: "Write a SQL query to get monthly sales trends in the year 2013 from the Chinook database."
- **Initial Response**: Provided SQLite `strftime()` solution.
- **Clarification**: Noted use of MySQL, prompting correction.
- **Final Query**:
  ```sql
  SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS YearMonth,
         SUM(Total) AS MonthlySales
  FROM Invoice
  WHERE YEAR(InvoiceDate) = 2013
  GROUP BY YearMonth
  ORDER BY YearMonth;
  ```
- **Reflection**: The AI generated a clear query and explanations. I had to specify the SQL engine (MySQL) so the syntax would use `DATE_FORMAT()` and `YEAR()` instead of SQLite functions.

---

### Author: Kunal
### Date: 2025-04-11

