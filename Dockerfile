FROM node:14-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "yarn.lock", ".yarnrc.yml", "./"]
COPY [".yarn", "./.yarn"]
RUN yarn install --inline-builds
COPY . .
RUN yarn build
EXPOSE 3000
CMD ["yarn", "start:prod"]