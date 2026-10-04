FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --no-cache-dir \
    fastapi>=0.115.0 \
    uvicorn>=0.30.0 \
    pydantic>=2.8.0 \
    openai>=1.54.0 \
    pytest>=8.0.0 \
    flake8>=7.0.0

COPY codex_cloud_runner.py .
COPY microvm_sandbox_pool.py .

CMD ["python3", "codex_cloud_runner.py"]
