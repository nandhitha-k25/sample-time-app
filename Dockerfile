# Use a modern, lightweight Python image
FROM python:3.11-slim

# Install system dependencies (minimal set; add more if needed)
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     build-essential \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create group/user (matching your original IDs)
RUN groupadd -g 799 nyu && \
    useradd -r -u 999 -g nyu nyu

# Set working directory
WORKDIR /app

# Install Flask
RUN pip install --no-cache-dir Flask

# Switch to non-root user
USER nyu

# Copy app files into container, giving ownership to nyu
COPY --chown=nyu:nyu . .

# Run your app
CMD ["python", "./run.py"]
