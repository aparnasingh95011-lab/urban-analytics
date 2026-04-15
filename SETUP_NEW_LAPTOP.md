# Running the project on a new laptop

Use this checklist to set up and run **UrbanStay Analytics** on another machine.

---

## 1. Tools to install

| Tool | Version | Purpose | How to get it |
|------|---------|---------|----------------|
| **Python** | 3.9 or higher | Run the app, API, and dashboard | [python.org](https://www.python.org/downloads/) or `sudo apt install python3 python3-pip` (Linux) |
| **pip** | (comes with Python) | Install Python packages | Usually included; if not: `python -m ensurepip` |
| **MySQL** | 8.x (or 5.7+) | Database | **Option A:** [MySQL installer](https://dev.mysql.com/downloads/installer/) (Windows) or `sudo apt install mysql-server` (Linux) or [MySQL on Mac](https://dev.mysql.com/doc/refman/8.0/en/osx-installation.html)  
**Option B:** **Docker** — [Docker Desktop](https://www.docker.com/products/docker-desktop/) then use `docker-compose` for MySQL (no local MySQL install needed) |
| **Git** (optional) | any | Clone/copy the project | [git-scm.com](https://git-scm.com/) |

You **must** have **Python 3.9+** and **either MySQL installed** or **Docker** (for `docker-compose`). Nothing else is required at the OS level.

---

## 2. Python dependencies (required)

From the project folder:

```bash
# Create and activate a virtual environment (recommended)
python3 -m venv venv

# Linux/macOS:
source venv/bin/activate

# Windows (Command Prompt):
venv\Scripts\activate

# Windows (PowerShell):
.\venv\Scripts\Activate.ps1

# Install all Python packages
pip install -r requirements.txt
```

This installs: **pandas**, **mysql-connector-python**, **sqlalchemy**, **flask**, **flask-cors**, **requests**, **streamlit**, **plotly**, **altair**, **python-dotenv**, **numpy**.

---

## 3. Copy the project and data

- Copy the whole **UrbanAnalytics** folder to the new laptop (USB, cloud, or `git clone`).
- Ensure the **data** folder contains:
  - `listings.csv`
  - `reviews.csv`
  - `calendar.csv`  
  If not, either copy them from the old laptop or generate sample data:  
  `python scripts/generate_sample_data.py` (then move CSVs into `data/` if the script puts them elsewhere) or run `python scripts/fill_realistic_data.py` if you have raw CSVs.

---

## 4. Database: choose one option

### Option A – MySQL with Docker (easiest on a new laptop)

1. Install **Docker Desktop** and start it.
2. In the project folder:
   ```bash
   docker-compose up -d
   ```
3. Wait ~15 seconds for MySQL to start.
4. Default DB user/password are set in `docker-compose.yml`; the project’s `config.py` can use `MYSQL_USER=urbanstay`, `MYSQL_PASSWORD=urbanstay`, or the root user — see `config.py`.

No need to install MySQL on the laptop.

### Option B – MySQL installed on the laptop

1. Install and start the MySQL server.
2. Create the database and user (or use root):
   ```sql
   CREATE DATABASE urbanstay_analytics CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   CREATE USER 'urbanstay'@'localhost' IDENTIFIED BY 'urbanstay';
   GRANT ALL ON urbanstay_analytics.* TO 'urbanstay'@'localhost';
   FLUSH PRIVILEGES;
   ```
3. In the project folder, edit **`config.py`** and set:
   - `MYSQL_HOST` (e.g. `127.0.0.1` or `localhost`)
   - `MYSQL_USER`
   - `MYSQL_PASSWORD`
   - `MYSQL_DATABASE` = `urbanstay_analytics`

---

## 5. Run the project (first time on this laptop)

Run these in order, from the **project root** (where `config.py` and `requirements.txt` are).

```bash
# 1. Apply database schema
python scripts/run_schema.py

# 2. Load data into MySQL
python etl/load_data.py

# 3. Start the API (leave this terminal open)
python api/app.py
```

In a **second terminal** (same folder, venv activated):

```bash
# 4. Start the dashboard
streamlit run dashboard/app.py
```

- **API:** http://localhost:5000  
- **Dashboard:** http://localhost:8501  

---

## Quick checklist

- [ ] Python 3.9+ installed (`python3 --version`)
- [ ] pip available (`pip --version`)
- [ ] Virtual environment created and activated
- [ ] `pip install -r requirements.txt` run
- [ ] MySQL running (Docker or local) and `config.py` set if not using Docker defaults
- [ ] Project folder copied with `data/listings.csv`, `reviews.csv`, `calendar.csv`
- [ ] `python scripts/run_schema.py` run once
- [ ] `python etl/load_data.py` run once
- [ ] `python api/app.py` in one terminal
- [ ] `streamlit run dashboard/app.py` in another terminal

If anything fails, check **README.md** and **DEMO.md** for more detail.
