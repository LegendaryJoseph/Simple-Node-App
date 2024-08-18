# Use a lightweight version of the Node.js image as the base image
FROM node:22-alpine3.19
# Set the working directory in the container to /app
WORKDIR /app
# Copy the application code into the newly created container
COPY . .  
# Install dependencies
RUN npm install  
# Expose port 3000 (The app will be running here)
EXPOSE 3000  
# Start the app with the following commands
CMD [ "npm", "start" ]