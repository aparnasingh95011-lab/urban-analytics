# UrbanStay Analytics

Analyze Airbnb market data using MySQL, Python, and interactive dashboards.

## Stack

- **Python 3.9+**
- **MySQL** – relational store for listings, reviews, calendar
- **Pandas** – ETL and analytics
- **Flask** – REST API for analytics
- **Streamlit** – analytics dashboard

## Quick start (complete working project)

**Prerequisites:** Python 3.9+, Docker (optional, for MySQL).

1. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

2. **Start MySQL** (with Docker)
   ```bash
   docker-compose up -d
   ```
   Wait ~15 seconds for MySQL to be ready.  
   *Or* use an existing MySQL server; set `MYSQL_HOST`, `MYSQL_USER`, `MYSQL_PASSWORD` in `config.py` or environment.

3. **Create database and load schema**
   ```bash
   python scripts/run_schema.py
   ```

4. **Load data** (requires `data/listings.csv`, `data/reviews.csv`, `data/calendar.csv`)
   ```bash
   python etl/load_data.py
   ```

5. **Start API** (terminal 1)
   ```bash
   python3 api/app.py
   ```
   API: http://localhost:5000

6. **Start dashboard** (terminal 2)
   ```bash
   streamlit run dashboard/app.py
   ```
   Dashboard: http://localhost:8501

**One-command run (Linux/macOS):** `bash run.sh` — starts MySQL (Docker), applies schema, loads data, then starts API and dashboard.

**Windows:** Use `run.bat` or run the steps above in order.

## Datasets

Place these files in the `data/` folder:

| File          | Description                    |
|---------------|--------------------------------|
| `listings.csv`| Property listings (id, host, neighbourhood, price, room_type, etc.) |
| `reviews.csv` | Reviews (listing_id, date, reviewer_name, comments) |
| `calendar.csv`| Daily availability and price (listing_id, date, available, price) |

If you have raw files named e.g. `listings (1).csv`, run `python scripts/fill_realistic_data.py` first to generate filled `listings.csv`, `reviews.csv`, `calendar.csv` in `data/`.

## Setup (manual)

### 1. Virtual environment

```bash
python -m venv venv
source venv/bin/activate   # Linux/macOS
# or: venv\Scripts\activate  # Windows
pip install -r requirements.txt
```

### 2. MySQL

**Option A – Docker (recommended)**  
```bash
docker-compose up -d
```
Then run `python scripts/run_schema.py` to create the database and tables.

**Option B – Local MySQL**  
Create database and user, then run schema:

```sql
CREATE DATABASE urbanstay_analytics CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'urbanstay'@'%' IDENTIFIED BY 'urbanstay';
GRANT ALL ON urbanstay_analytics.* TO 'urbanstay'@'%';
FLUSH PRIVILEGES;
```

```bash
python scripts/run_schema.py
```

### 3. Load data (ETL)

```bash
python etl/load_data.py
```

To reload data, run `etl/load_data.py` again (it truncates tables before load).

### 4. Run API and dashboard

```bash
python api/app.py
# In another terminal:
streamlit run dashboard/app.py
```

## API Endpoints

- `GET /api/health` – health check
- `GET /api/analytics/avg-price-by-neighbourhood`
- `GET /api/analytics/price-by-room-type`
- `GET /api/analytics/top-hosts`
- `GET /api/analytics/occupancy-rate`
- `GET /api/analytics/listings-most-reviews`
- `GET /api/analytics/review-trends`
- `GET /api/analytics/availability-trends`
- `GET /api/analytics/most-expensive-listings`
- `GET /api/analytics/neighbourhood-demand`
- `GET /api/analytics/price-distribution`

## Dashboard insights

1. Average price by neighbourhood  
2. Price by room type  
3. Top hosts with most listings  
4. Occupancy rate per listing  
5. Listings with most reviews  
6. Review trends over time  
7. Availability trends  
8. Most expensive listings  
9. Neighbourhood demand ranking  
10. Price distribution  

## Project layout

```
UrbanAnalytics/
├── config.py
├── requirements.txt
├── README.md
├── data/                 # Place listings.csv, reviews.csv, calendar.csv here
├── db/
│   └── schema.sql
├── etl/
│   └── load_data.py
├── api/
│   └── app.py
└── dashboard/
    └── app.py
```
