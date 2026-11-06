FROM python:3.12-slim
ENV PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=1
WORKDIR /srv
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg ca-certificates xz-utils && rm -rf /var/lib/apt/lists/*
COPY deploy.tar.xz /tmp/deploy.tar.xz
RUN tar -xJf /tmp/deploy.tar.xz -C /srv && rm -f /tmp/deploy.tar.xz && pip install -r requirements.txt
EXPOSE 10000
CMD ["sh", "-c", "uvicorn linkdrop.server:app --host 0.0.0.0 --port ${PORT:-10000}"]
