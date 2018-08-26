#!/bin/bash

#https://www.youtube.com/watch?v=zWVV31NYi1U

echo "Hi there"
# ==== read user input ====
echo "Enter names "
read name1 name2 name3
echo "Names are: ${name1}, ${name2}, ${name3}"

read -p "Enter name: "
read -sp "Enter Password: "
# --- read an array ---
echo "Enter names:"
read -a names
echo "Names are: ${names[0], $names[1]}"
# --- build in variable REPLY -- 
echo "Enter name: "
read
echo "Name: $REPLY"

# === pas argument to a script ===