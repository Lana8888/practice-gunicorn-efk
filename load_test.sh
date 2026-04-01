#!/bin/bash

echo "Starting load test..."

for i in {1..15}; do curl -s -o /dev/null http://localhost:8000/one; done
echo "Done /one"

for i in {1..10}; do curl -s -o /dev/null http://localhost:8000/two; done
echo "Done /two"

for i in {1..12}; do curl -s -o /dev/null http://localhost:8000/three; done
echo "Done /three"

for i in {1..7}; do curl -s -o /dev/null http://localhost:8000/four; done
echo "Done /four"

for i in {1..10}; do curl -s -o /dev/null http://localhost:8000/five; done
echo "Done /five"

for i in {1..5}; do curl -s -o /dev/null http://localhost:8000/error; done
echo "Done /error"

for i in {1..3}; do curl -s -o /dev/null http://localhost:8000/non-existent; done
echo "Done /non-existent"

echo "All requests sent! Check Kibana."
