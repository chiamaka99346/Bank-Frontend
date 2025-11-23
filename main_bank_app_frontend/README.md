# Digital Witch Cloud Security / DevOps Project On Bank Managmenet App
## This is the frontend app which is coded and  Create React App comprising CSS, Html, js. 

## Note this app highly depend on the backend to run. ensure the backend is running fine. 

## Also note that it is also containerized to run on port 3000

### This is the architecture of the project
![App Preview](architecture-HIPPAA.drawio.svg)



## The Dockerfile runs the following to bring the app up

In the project directory, you can see the Dockerfile:


## Stage 1: Build the React application 
### `FROM node:18 AS build`

## Set the working directory
### `WORKDIR /app`

## Copy package.json and package-lock.json to the container
### `COPY package.json package-lock.json ./`

## Install dependencies
### `RUN npm install`

### Copy the rest of the app's source code
### `COPY . .`

## Build the application
### `RUN npm run build#

## Stage 2: Serve the built application with a lightweight web server
### `FROM nginx:stable-alpine`

## Copy the build output to the nginx HTML folder
### `COPY --from=build /app/build /usr/share/nginx/html`

## Copy custom nginx configuration, if any (optional)
### `COPY nginx.conf /etc/nginx/conf.d/default.conf`

## Expose the default nginx port
### `EXPOSE 3000`

## Start nginx server
## `CMD ["nginx", "-g", "daemon off;"]`

