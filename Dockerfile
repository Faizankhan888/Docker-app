FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app's code
COPY . .

# Build the React app
RUN npm run build

# Serve the app with a simple HTTP server
RUN npm install -g serve
CMD ["serve", "-s", "dist"]

# Expose the port
EXPOSE 3000
