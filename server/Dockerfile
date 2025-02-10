# Use official Golang image as build stage
FROM golang:1.24-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum files first to leverage Docker caching
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o ratify /app/server/main.go

# Use a minimal base image for the final stage
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/ratify .

# Expose port if your application listens on a specific port (e.g., 8080)
EXPOSE 6001

# Run the binary
ENTRYPOINT ["./ratify"]