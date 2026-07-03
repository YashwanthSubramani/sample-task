FROM public.ecr.aws/docker/library/python:3.11-slim-bookworm@sha256:c221e8783454477b78f0945cb57bb15bfbb9687e35b719006093414902b78d65

RUN apt-get update && apt-get install -y --no-install-recommends \
    tmux \
    asciinema \
    postgresql-client \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY environment/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

CMD ["/bin/bash"]