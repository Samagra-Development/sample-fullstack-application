# Stage 1: Build Stage
FROM node:22-alpine AS build

WORKDIR /app

COPY package.json .
RUN yarn install

# Copy the rest of the application code
COPY . .

RUN npx prisma generate

# Build the application
RUN yarn build

# Stage 2: Production Stage
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy built artifacts from the previous stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/prisma ./prisma
COPY --from=build /app/package.json .
COPY ./entrypoint.sh .


# Expose the port the app runs on
EXPOSE 3000

# Command to run your Nest.js application using production mode
CMD ["node", "dist/main"]

