# BASE IMAGE
FROM ubuntu as murthy

RUN apt-get update && apt-get install -y golang-go
ENV GO111MODULE=off

COPY . .

RUN CGO_ENABLED=0 go build -o /app .

#MULTISTAGE USING DISTROLEES IMAGE
FROM scratch

COPY --from=murthy /app /app

ENTRYPOINT ["/app"]
