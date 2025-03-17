#!/bin/sh

# Wait for PostgreSQL to be ready
/wait-for-it.sh db:5432 -t 60

## Create schema and run migrations
#npm run schema:create
#npm run migration:up

# Start the application
#npm run start:prod

if [ -f package-lock.json ]; then npm run start:dev; \
elif [ -f yarn.lock ]; then yarn start:dev; \
elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm start:dev; \
else echo "Lockfile not found." && exit 1; \
fi
