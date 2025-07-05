FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg2 ca-certificates \
    chromium chromium-driver && \
    apt-get clean

# Set environment variables for Chrome
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

# Set working directory
WORKDIR /app

# Copy files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Give execute permission to startup script
RUN chmod +x /app/start.sh

# Run app
CMD ["bash", "./start.sh"]
