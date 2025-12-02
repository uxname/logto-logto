#!/bin/sh
set -e

echo "Starting Logto initialization..."
npm run cli db seed -- --swe
echo "Seeding completed. Starting application..."
npm start