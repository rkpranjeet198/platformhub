FROM node:22-bookworm-slim

WORKDIR /app

COPY . .

RUN corepack enable

RUN yarn install

EXPOSE 7007

CMD ["yarn", "start"]