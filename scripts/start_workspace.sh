#!/bin/bash

# Start the Watchdog
bash ./scripts/db_watchdog.sh &

# Start Backend API
cd backend && npm run dev &

# Start Frontend Client
cd frontend && npm run dev &

wait
