FROM node:24.11.1-alpine3.22

RUN addgroup -S app && adduser -S app -G app
WORKDIR /app

COPY ./src/package.json .
COPY ./src/package-lock.json .
ENV NODE_ENV=production
RUN npm ci --omit=dev

COPY --chown=app:app src ./
USER app

EXPOSE 8080

ENTRYPOINT ["node", "server.js"]
