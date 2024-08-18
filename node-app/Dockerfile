# Use a lightweight version of the Node.js image as the base image
FROM node:22-alpine3.19
# Set the working directory in the container to /app
WORKDIR /app

COPY . .  

RUN npm install  

EXPOSE 3000  

CMD [ "npm", "start" ]