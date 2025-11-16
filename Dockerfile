FROM ubuntu

RUN groupadd -r app && useradd -r -g app app

RUN apt update && apt install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install -y nodejs

WORKDIR /app
COPY --chown=app:app src ./
USER app

RUN npm install
EXPOSE 8080

ENTRYPOINT ["node", "server.js"]
