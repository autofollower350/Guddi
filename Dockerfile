FROM python:3.11-slim

# Install required packages
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg2 ca-certificates \
    chromium chromium-driver && \
    apt-get clean

# Set environment variables for Chrome
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x /app/start.sh

CMD ["bash", "start.sh"]
