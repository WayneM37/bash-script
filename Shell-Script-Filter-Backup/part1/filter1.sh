#!/bin/bash

# Filter and find EC2 instance IDs, which was terminated by the user Serdar. 
# Sorted the result lines and saved in a file. 

cat event_history.csv | grep -i "serdar" | grep -i "terminate" | grep -Eo "i-.{17}" | sort | uniq > result.txt

