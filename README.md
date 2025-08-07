# Climate-Change-SQL-Project
This project explores weekly climate change trends using SQL (PostgreSQL) and pgAdmin.   It focuses on analyzing air quality, temperature variations, population exposure, and extreme weather events across multiple countries.
## 📌 Project Goals

- Analyze air quality (AQI) across countries and cities.
- Identify days with extreme pollution (AQI > 200).
- Calculate average temperatures and total population exposure.
- Categorize temperatures into climate ranges (e.g., Cold, Warm, Hot).
- Summarize extreme weather events by temperature categories.

---

## 🛠 Tools Used

- **PostgreSQL**
- **pgAdmin**
- **Excel** (for CSV exports)
- **Git & GitHub** (for version control and portfolio)

---

## 📁 Folder Structure

climate-sql-project/
├── climate_analysis.sql # All the SQL queries
├── summary_report.csv # Exported results (optional)
├── README.md # Project documentation
└── screenshots/ # pgAdmin screenshots (optional)
└── result_preview.png

yaml
Copy
Edit

---

## 🔍 Key Queries

- Identify top 5 cities with highest average AQI
- Count number of days with AQI > 200
- Aggregate extreme weather events by temperature ranges
- Group climate data by country and city for comparative analysis

---

## 📊 Example Output

| Country | City        | Avg AQI | Days > 200 AQI | Total Pop Exposure |
|---------|-------------|---------|----------------|---------------------|
| India   | New Delhi   | 240     | 6              | 1,500,000           |
| USA     | Los Angeles | 180     | 2              | 800,000             |

---

## 🚀 How to Use This Project

1. Clone or download this repository.
2. Open `climate_analysis.sql` in pgAdmin.
3. Make sure your database includes the `Combine Data` table.
4. Run the queries one by one and review the output.
5. Export results to Excel if needed for visualization or reporting.

---

## 🙋‍♀️ Author

**Ebber Priscilla**  
Data Analyst in training | SQL Enthusiast | Google Data Analytics Certified

---

## 📎 License

This project is open-source and free to use for learning or showcasing SQL skills.
