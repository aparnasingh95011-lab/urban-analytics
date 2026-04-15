"""
UrbanStay Analytics - Configuration
"""
import os
from pathlib import Path

# Paths
PROJECT_ROOT = Path(__file__).resolve().parent
DATA_DIR = PROJECT_ROOT / "data"

# CSV file names
LISTINGS_CSV = DATA_DIR / "listings.csv"
REVIEWS_CSV = DATA_DIR / "reviews.csv"
CALENDAR_CSV = DATA_DIR / "calendar.csv"

# MySQL (override via environment)
MYSQL_HOST = os.getenv("MYSQL_HOST", "127.0.0.1")
MYSQL_PORT = int(os.getenv("MYSQL_PORT", "3306"))
MYSQL_USER = os.getenv("MYSQL_USER", "root")
MYSQL_PASSWORD = os.getenv("MYSQL_PASSWORD", "Aparna456")
MYSQL_DATABASE = os.getenv("MYSQL_DATABASE", "urbanstay_analytics")

# SQLAlchemy connection string
DATABASE_URL = (
    f"mysql+mysqlconnector://{MYSQL_USER}:{MYSQL_PASSWORD}"
    f"@{MYSQL_HOST}:{MYSQL_PORT}/{MYSQL_DATABASE}"
)

# Flask
FLASK_HOST = os.getenv("FLASK_HOST", "0.0.0.0")
FLASK_PORT = int(os.getenv("FLASK_PORT", "5000"))
API_BASE_URL = os.getenv("API_BASE_URL", f"http://localhost:{FLASK_PORT}")

# Streamlit
STREAMLIT_PORT = int(os.getenv("STREAMLIT_PORT", "8501"))
