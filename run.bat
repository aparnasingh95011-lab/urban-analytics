@echo off
REM UrbanStay Analytics - Windows: start MySQL (Docker), load schema, load data, start API and Dashboard
cd /d "%~dp0"

echo === UrbanStay Analytics ===
echo.

REM Start MySQL if Docker available
where docker-compose >nul 2>nul && (
  echo Starting MySQL...
  docker-compose up -d
  timeout /t 15 /nobreak >nul
) || echo Using existing MySQL. Ensure it is running.

echo.
echo Applying schema...
python scripts\run_schema.py
if errorlevel 1 exit /b 1

echo.
echo Loading data...
python etl\load_data.py
if errorlevel 1 exit /b 1

echo.
echo Starting Flask API on http://localhost:5000
start /b python api\app.py
timeout /t 3 /nobreak >nul

echo.
echo Starting Dashboard on http://localhost:8501
streamlit run dashboard\app.py --server.headless true
