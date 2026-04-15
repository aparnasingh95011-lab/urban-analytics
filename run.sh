#!/usr/bin/env bash
# UrbanStay Analytics - Start MySQL, load schema, load data, then start API and Dashboard
# Usage: ./run.sh   (or: bash run.sh)
set -e
cd "$(dirname "$0")"

echo "=== UrbanStay Analytics ==="
echo ""

# 1. Start MySQL (Docker) if docker-compose exists
if command -v docker-compose &>/dev/null && [ -f docker-compose.yml ]; then
  echo "Starting MySQL (Docker)..."
  docker-compose up -d
  echo "Waiting for MySQL to be ready..."
  sleep 15
else
  echo "Docker not found or no docker-compose.yml. Using existing MySQL (ensure it's running)."
fi

# 2. Run schema
echo ""
echo "Applying database schema..."
python3 scripts/run_schema.py || { echo "Schema failed. Is MySQL running and credentials correct?"; exit 1; }

# 3. Load data
echo ""
echo "Loading data (listings, reviews, calendar)..."
python3 etl/load_data.py || { echo "ETL failed. Check data/listings.csv, reviews.csv, calendar.csv exist."; exit 1; }

# 4. Start API in background
echo ""
echo "Starting Flask API on http://localhost:5000 ..."
python3 api/app.py &
API_PID=$!
sleep 3

# 5. Start Dashboard (foreground)
echo ""
echo "Starting Streamlit Dashboard on http://localhost:8501 ..."
echo "Press Ctrl+C to stop the dashboard (and API)."
streamlit run dashboard/app.py --server.headless true

# When streamlit exits, kill API
kill $API_PID 2>/dev/null || true
