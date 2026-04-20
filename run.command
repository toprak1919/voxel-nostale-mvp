#!/bin/bash
cd "$(dirname "$0")"
PORT=8765
(python3 -m http.server $PORT >/dev/null 2>&1) &
SERVER_PID=$!
sleep 0.4
open "http://localhost:$PORT/"
trap "kill $SERVER_PID 2>/dev/null" INT TERM EXIT
wait $SERVER_PID
