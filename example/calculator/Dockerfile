FROM filleduchaos/musl_nix_arm:latest

RUN mkdir -p /app
COPY . /app
WORKDIR /app

VOLUME ["/app"]

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
