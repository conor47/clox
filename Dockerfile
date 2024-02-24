FROM debian:stable-slim

RUN apt-get update && apt-get install -y gcc make libc6-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN make standard

CMD ["./build/program"]
