# Stage 1: Build the Quartz site
FROM node:22 AS builder

WORKDIR /app

# Copy everything into the container
COPY . .

# Install Quartz CLI globally
RUN npm install -g quartz

# Build the site to /app/html
RUN npx quartz build -o "./html"

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy built HTML from builder stage
COPY --from=builder /app/html /usr/share/nginx/html
