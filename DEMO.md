# UrbanStay Analytics – Demo / Run for submission

Use this to run the **complete working project** for your demo.

## Prerequisites

- **Python 3.9+** with pip  
- **Docker** (for MySQL), or an existing MySQL 8 server  
- Data files in `data/`: `listings.csv`, `reviews.csv`, `calendar.csv`  
  - If you have `listings (1).csv` etc., run first:  
    `python3 scripts/fill_realistic_data.py`

## 1. Install dependencies

```bash
cd /path/to/UrbanAnalytics
pip install -r requirements.txt
```

## 2. Start MySQL

**With Docker:**

```bash
docker-compose up -d
```

Wait about 15 seconds, then continue.

**Without Docker:**  
Use your own MySQL. Set in `config.py` or environment:

- `MYSQL_HOST`, `MYSQL_PORT`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE=urbanstay_analytics`

## 3. Create database and tables

```bash
python scripts/run_schema.py
```

Expected: `Schema applied successfully.`

## 4. Load data into MySQL

```bash
python etl/load_data.py
```

Expected: lines like  
`Loaded 24xxx listings.`  
`Loaded 9xxxxx reviews.`  
`Loaded 5xxxxx calendar rows.`

## 5. Start the API

In a **first terminal**:

```bash
python api/app.py
```

Leave it running. You should see Flask listening on http://localhost:5000.

## 6. Start the dashboard

In a **second terminal**:

```bash
streamlit run dashboard/app.py
```

Browser should open at http://localhost:8501 with the UrbanStay Analytics dashboard.

## What to show in the demo

1. **API:** Open http://localhost:5000/api/health → `{"status":"ok","database":"connected"}`  
2. **API:** Try e.g. http://localhost:5000/api/analytics/avg-price-by-neighbourhood → JSON list of neighbourhoods and average prices  
3. **Dashboard:** All 10 insight sections with charts and tables (average price by neighbourhood, price by room type, top hosts, occupancy, reviews, trends, availability, most expensive, demand, price distribution)

## One-command run (Linux/macOS)

From the project root:

```bash
chmod +x run.sh
./run.sh
```

This will:

1. Start MySQL with Docker  
2. Apply schema  
3. Load data  
4. Start API in the background  
5. Start the dashboard in the foreground  

Stop with Ctrl+C in the dashboard terminal.

## Troubleshooting

- **“Could not connect to MySQL”**  
  Start MySQL (e.g. `docker-compose up -d`) and wait ~15 seconds, then run `run_schema.py` and `load_data.py` again.

- **“listings.csv not found”**  
  Ensure `data/listings.csv`, `data/reviews.csv`, and `data/calendar.csv` exist. If you only have `listings (1).csv` etc., run `python3 scripts/fill_realistic_data.py` first.

- **Dashboard says “API not reachable”**  
  Start the API in another terminal (`python3 api/app.py`) and keep it running while using the dashboard.

- **Empty charts**  
  Run the ETL again (`python3 etl/load_data.py`) and refresh the dashboard.
