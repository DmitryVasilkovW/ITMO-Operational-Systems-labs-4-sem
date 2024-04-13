#!/bin/bash

for i in {1..4}
do
  echo "Море теплое" >> pipe
  echo "Море теплое"
  sleep 1
done

for i in {1..3}
do
  echo "Акулы приближаются" >> pipe
  echo "Акулы приближаются"
  sleep 1
done

echo "Они здесь" >> pipe
echo "Они здесь"

exit 2
