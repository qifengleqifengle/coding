ARG DOCKER_IMAGE_PREFIX=
FROM ${DOCKER_IMAGE_PREFIX}node:22-bookworm-slim
WORKDIR /app
COPY package*.json .npmrc ./
RUN npm ci
COPY . .
ARG NEXT_PUBLIC_API_URL=http://localhost:8080
ENV NEXT_PUBLIC_API_URL=$NEXT_PUBLIC_API_URL
RUN npm run build
ENV NODE_ENV=production
EXPOSE 3000
CMD ["npm", "start", "--", "--host", "0.0.0.0"]
