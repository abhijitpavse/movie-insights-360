# 🎬 Movie Insights 360

<p align="center">

**End-to-End Movie Analytics using Python, MySQL, Excel & Power BI**

</p>

<p align="center">

🐍 Python • 🗄️ MySQL • 📗 Excel • 📊 Power BI • 📈 Data Analytics

</p>

---

## 📌 Project Overview

**Movie Insights 360** is an end-to-end data analytics and business intelligence project focused on analyzing movie data to discover meaningful patterns related to:

- 🎬 Movie genres and categories
- ⭐ Movie ratings
- 🔥 Movie popularity and audience interest
- 📅 Release-year trends
- 👥 Audience engagement
- 📊 Data quality
- 📈 Relationships between ratings and popularity

The project uses four major analytics tools:

- 🐍 Python
- 🗄️ MySQL
- 📗 Microsoft Excel
- 📊 Power BI

The same cleaned dataset is used across all four tools to maintain consistency between the analysis, calculations, SQL queries, Excel reports and Power BI dashboard.

---

# 🎯 Business Problem

MovieScope Analytics is an entertainment analytics company that helps streaming platforms understand movie trends and audience preferences.

The objective of this project is to answer:

> **"What can the available movie data tell us about movie popularity, ratings, genres, release trends and audience interest?"**

The project focuses on:

- Data cleaning
- Exploratory Data Analysis
- Statistical analysis
- SQL analysis
- Spreadsheet analysis
- Business intelligence
- Dashboard storytelling
- Cross-tool validation
- Business insight generation

No machine-learning model is used because the primary objective is descriptive analytics and business intelligence.

---

# 🎯 Project Objectives

The main objectives of this project are:

1. Load and understand the movie dataset.
2. Perform data-quality checks.
3. Handle missing values appropriately.
4. Identify duplicate records.
5. Convert columns into appropriate data types.
6. Perform exploratory data analysis using Python.
7. Analyze movie genres and categories.
8. Analyze movie ratings.
9. Identify highest-rated movies.
10. Analyze movie popularity and audience interest.
11. Analyze movie release trends.
12. Store the cleaned dataset in MySQL.
13. Perform business-oriented SQL queries.
14. Analyze the dataset using Excel.
15. Create PivotTables and charts in Excel.
16. Build an interactive Power BI dashboard.
17. Compare findings across Python, SQL, Excel and Power BI.
18. Generate management-ready business insights.

---

# 📂 Dataset

## Dataset Name

**MOVIES DATASET FOR FEATURE EXTRACTION, PREDICTION**

## Dataset Source

Kaggle

## Dataset URL

https://www.kaggle.com/datasets/bharatnatrayn/movies-dataset-for-feature-extracion-prediction/data

The project uses the `movies.csv` dataset for movie analysis, feature extraction and exploratory analytics.

> The exact columns, data types and available analytical fields are determined from the downloaded dataset.

---

# 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| 🐍 Python | Data cleaning, EDA, statistics and visualization |
| 🐼 Pandas | Data manipulation and analysis |
| 🔢 NumPy | Numerical operations |
| 📊 Matplotlib | Data visualization |
| 🗄️ MySQL | Database storage and SQL analysis |
| 📗 Microsoft Excel | Spreadsheet analysis and PivotTables |
| 📊 Power BI | Interactive dashboard and business intelligence |
| 📝 GitHub | Version control and project documentation |

---

# 🏗️ End-to-End Project Workflow

```text
                    ┌─────────────────────┐
                    │     Raw Dataset     │
                    │     movies.csv      │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Data Inspection   │
                    │  & Quality Checks   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │    Data Cleaning    │
                    │   & Transformation  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Cleaned Dataset   │
                    └──────────┬──────────┘
                               │
             ┌─────────────────┼─────────────────┐
             │                 │                 │
             ▼                 ▼                 ▼
       ┌──────────┐      ┌──────────┐      ┌──────────┐
       │  Python  │      │  MySQL   │      │  Excel   │
       │   EDA    │      │   SQL    │      │ Analysis │
       └────┬─────┘      └────┬─────┘      └────┬─────┘
            │                 │                 │
            └─────────────────┼─────────────────┘
                              │
                              ▼
                       ┌─────────────┐
                       │  Power BI   │
                       │  Dashboard  │
                       └──────┬──────┘
                              │
                              ▼
                    ┌─────────────────────┐
                    │ Business Insights   │
                    │ & Recommendations   │
                    └─────────────────────┘
---
## 🧹 Data Cleaning & Preparation
Raw data cleaning and standardization steps applied across all analytical tools:
1. **Inspection:** Checked dataset shape, data types, and initial records.
2. **Missing Values:** Identified incomplete fields using `df.isnull().sum()`.
3. **Duplicates:** Removed exact duplicate rows using `df.drop_duplicates()`.
4. **Data Type Casting:** Converted `VOTES`, `RATING`, and `RUNTIME` to numeric types.
5. **Year Extraction:** Extracted 4-digit release years:
   ```python
   df["Release_Year"] = df["YEAR"].astype(str).str.extract(r"(\d{4})")[0].astype(float)
Genre Explosions: Separated multi-value genre strings into individual records for accurate aggregation.

🐍 Part 1 — Python Analysis
Libraries Used
pandas — Cleaning, filtering, grouping, and aggregations.

numpy — Statistical operations.

matplotlib — Visualizations (histograms, bar charts, scatter plots).

Core Analysis Snippets
Highest Rated & Popularity:

Python
# Top 10 Rated
top_rated = df.dropna(subset=["RATING"]).sort_values("RATING", ascending=False).head(10)

# Top 10 Popular (Proxy: VOTES)
top_popular = df.dropna(subset=["VOTES"]).sort_values("VOTES", ascending=False).head(10)
Genre Explosions:

Python
genre_df["GENRE"] = genre_df["GENRE"].str.split(",")
genre_df = genre_df.explode("GENRE")
genre_df["GENRE"] = genre_df["GENRE"].str.strip()
🗄️ Part 2 — MySQL Analysis
Database: movie_analytics

SQL
CREATE DATABASE movie_analytics;
USE movie_analytics;

-- Derive Rating Categories
SELECT 
    title, 
    rating,
    CASE
        WHEN rating >= 8 THEN 'Excellent'
        WHEN rating >= 7 THEN 'Good'
        WHEN rating >= 6 THEN 'Average'
        ELSE 'Low'
    END AS Rating_Category
FROM movies;
📗 Part 3 — Microsoft Excel Analysis
Structure: Raw_Data, Cleaned_Data, Data_Quality, Pivot_Genre, Pivot_Rating, Pivot_Release_Year, Dashboard, Insights.

Calculated Rating Category Column:

Excel
=IF([@Rating]>=8, "Excellent", IF([@Rating]>=7, "Good", IF([@Rating]>=6, "Average", "Low")))
Pivot Tables & Charts: Aggregated genre counts, average ratings, and release trends.

📊 Part 4 — Power BI Dashboard
Visual Features:

KPI Cards: Total Movies, Average Rating, Highest Rating, Number of Rated Titles.

Charts: Genre Distribution (Bar), Average Rating by Genre (Horizontal Bar), Release Year Trend (Line), Rating vs. Popularity (Scatter).

Slicers: Genre, Release Year, Rating Category.

💡 Key Business Findings
Genre Concentration: Drama dominates catalogue representation (4,115 entries), followed by Comedy (2,736) and Action (2,110).

Quality vs. Quantity: Highly populated genres do not guarantee top ratings; Animation, History, and Adventure hold the strongest average ratings.

Popularity Bias: High ratings do not automatically correlate with high audience engagement (VOTES). Both metrics must be analyzed together.

Data Hygiene Impact: Uncleaned multi-value genres and unparsed dates distort business reporting if not transformed prior to loading.

📁 Repository Structure
Plaintext
movie-insights-360/
├── data/
│   ├── raw/movies.csv
│   └── cleaned/movies_cleaned.csv
├── python/
│   └── 01_movie_analysis.ipynb
├── sql/
│   └── 02_movie_analytics.sql
├── excel/
│   └── 03_movie_analysis.xlsx
├── powerbi/
│   └── 04_movie_analytics.pbix
└── README.md
👨‍💻 Author
Abhijit Pavse — Data Engineering • AI • Analytics

LinkedIn: linkedin.com/in/abhijitpavse

GitHub: github.com/abhijitpavse

Dataset Source: Kaggle Movies Dataset
