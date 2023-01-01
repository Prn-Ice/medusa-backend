# Set the base image to Node 17.1.0-alpine
FROM node:17.1.0-alpine

# Set the working directory
WORKDIR /app/medusa

# Copy the necessary files
COPY package.json .
COPY develop.sh .
COPY yarn.* .

# Install dependencies and the medusa-cli
RUN apk update && yarn && yarn global add @medusajs/medusa-cli@latest

# Add the remaining files
COPY . .

# Set the default command to run when the container starts
ENTRYPOINT ["sh", "develop.sh"]