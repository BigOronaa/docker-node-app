# Stage 1: Build
FROM node:20-slim AS build

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy app source
COPY . .

# Expose the port
EXPOSE 3000

# Run the app
CMD ["node", "app.js"]
