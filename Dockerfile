FROM debian:bullseye-slim as bullseye-slim
RUN apt update && apt install procps tmux smenu curl  -y
WORKDIR /app
COPY . .
RUN curl -L https://github.com/vchain-us/immudb/releases/download/v1.2.2/immudb-v1.2.2-linux-amd64-static -o immudb && chmod +x immudb
RUN curl -L https://github.com/vchain-us/immudb/releases/download/v1.2.2/immuclient-v1.2.2-linux-amd64-static -o immuclient && chmod +x immuclient

ENTRYPOINT ["bash", "start.sh"]
