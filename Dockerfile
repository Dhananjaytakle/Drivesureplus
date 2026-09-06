FROM node:20-slim
RUN apt-get update && apt-get install -y --no-install-recommends unzip ffmpeg ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY dsp-renderer.zip .
RUN unzip -o dsp-renderer.zip && rm dsp-renderer.zip
WORKDIR /app/dsp-renderer
RUN npm install --omit=dev
ENV PORT=3000
EXPOSE 3000
CMD node server.js
