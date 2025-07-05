#!/bin/bash

# Create local bin path
mkdir -p /tmp/chrome
mkdir -p /tmp/chromedriver

# Install Chrome to /tmp/chrome
wget -q https://storage.googleapis.com/chrome-for-testing-public/136.0.7103.113/linux64/chrome-linux64.zip
unzip -q chrome-linux64.zip -d /tmp/chrome

# Install Chromedriver to /tmp/chromedriver
wget -q -O chromedriver.zip https://storage.googleapis.com/chrome-for-testing-public/136.0.7103.113/linux64/chromedriver-linux64.zip
unzip -q chromedriver.zip -d /tmp/chromedriver

# Export correct paths
export PATH="/tmp/chromedriver/chromedriver-linux64:$PATH"
export GOOGLE_CHROME_BIN="/tmp/chrome/chrome-linux64/chrome"

# ✅ Start FastAPI bot via Uvicorn
uvicorn render_fastapi_bot:app --host 0.0.0.0 --port $PORT
