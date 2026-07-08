# Use an exact, digest-pinned official Python base image to ensure perfect reproducibility
FROM python:3.11-slim@sha256:9c85d1d49df54abca1c5db3b4016400e198e9e9bb699f32f1ef8e5c0c2149ccf

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install remaining system tools and database dependencies (including tmux and asciinema to prevent silent run failures)
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    tmux \
    asciinema \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /workspace

# Create the required system log directory explicitly
RUN mkdir -p /logs/verifier

# Copy and install exact version-pinned python libraries
COPY environment/requirements.txt /workspace/environment/requirements.txt
RUN pip3 install --no-cache-dir -r /workspace/environment/requirements.txt

# Copy the rest of the application files
COPY . /workspace

# Open shell entry point for the agent evaluation loop
CMD ["/bin/bash"]