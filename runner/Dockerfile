ARG DOCKER_IMAGE_PREFIX=
FROM ${DOCKER_IMAGE_PREFIX}node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jdk-headless \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY server.mjs ./

RUN useradd --create-home --uid 10001 runner && chown -R runner:runner /app
USER runner
EXPOSE 8090
CMD ["npm", "start"]
