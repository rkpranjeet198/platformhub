FROM node:22-bookworm-slim AS builder

WORKDIR /app

COPY . .

RUN corepack enable

RUN yarn install
RUN yarn tsc
RUN yarn build:backend

FROM node:22-bookworm-slim

WORKDIR /app

COPY --from=builder /app .

ENV NODE_ENV=production

EXPOSE 7007

CMD ["yarn", "start-backend"]