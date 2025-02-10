FROM golang:1.24-alpine@sha256:7772cb5322baa875edd74705556d08f0eeca7b9c4b5367754ce3f2f00041ccee AS builder

WORKDIR /app

COPY . .

RUN go build -o /app/out/ratify /app/server

FROM gcr.io/distroless/static:nonroot@sha256:c0f429e16b13e583da7e5a6ec20dd656d325d88e6819cafe0adb0828976529dc

WORKDIR /app

COPY --from=builder /app/out/ratify ./

EXPOSE 6001

USER 65532:65532

ENTRYPOINT ["/app/ratify"]