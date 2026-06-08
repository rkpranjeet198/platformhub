FROM node:22.22-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 make g++ git sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Enable Corepack
RUN corepack enable

# FORCE stable Yarn version (NO prompts, NO downloads at runtime)
RUN corepack prepare yarn@4.4.1 --activate

# Copy project
COPY . .

# IMPORTANT: ensure yarn state is consistent
RUN yarn install --immutable

EXPOSE 3000 7007

ENV NODE_ENV=development

CMD ["yarn", "start"]