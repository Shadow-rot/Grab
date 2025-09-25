FROM python:3.8-slim-bullseye

ENV PIP_NO_CACHE_DIR=1

# Update repos and install required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    debian-keyring \
    debian-archive-keyring \
    bash \
    bzip2 \
    curl \
    figlet \
    git \
    util-linux \
    libffi-dev \
    libjpeg-dev \
    libwebp-dev \
    python3-lxml \
    postgresql \
    postgresql-client \
    python3-psycopg2 \
    libpq-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python3-requests \
    python3-sqlalchemy \
    python3-tz \
    python3-aiohttp \
    openssl \
    pv \
    jq \
    wget \
    libreadline-dev \
    libyaml-dev \
    gcc \
    sqlite3 \
    libsqlite3-dev \
    sudo \
    zlib1g \
    ffmpeg \
    libssl-dev \
    unzip \
    libopus0 \
    libopus-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/*

# Upgrade pip & setuptools
RUN pip install --upgrade pip setuptools

# Clone the bot repo
RUN git clone https://github.com/Shadow-rot/Grab /root/Grab
WORKDIR /root/Grab

# Install Python dependencies
RUN pip install -U -r requirements.txt

# Set PATH (if needed)
ENV PATH="/home/bot/bin:$PATH"

# Start the bot
CMD ["python3", "-m", "Grabber"]