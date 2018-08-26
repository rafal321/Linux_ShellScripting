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

# === pass argument to a script ===
echo $1 $2 $3 ' > echo $1 $2 $3'
#---store in array - 36:00 - 
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]}
#---read array, output array
args=("$@")
echo $@
echo $# # outputs no of arguments we've passed

######################################
# === if statement 40:10 ===
#Arithmetic operators ----------
#-lt [ "$a" -lt "$b" ]  
#(<) (("$a" < "$b"))
#-gt (>)
#-le (<=)
#-ge (>=)
#-eq (==)
#-ne (!=)
#string comparison -------------
# ==, !=, = if [ "$a" = "$b" ], [
# <,  >,  -z (string is null) [["$a" > "$b"]]
#use double angle bracket if with string you use >< ...

count=10
if [ $count -eq 9 ]; then
    echo "it is alse"
    else
    echo "it is true"
fi

word=a
if [[ $word == "b" ]]
then
    echo "it is false"
elif [[ $word == "a" ]]
then
    echo "it is true"
else
    echo "something"
fi
####################################
# === file test operators 53:20 ===
#    if file exists -e 
# there are two types of files
# text -c ;blob (binary, pic, video) -b
#if directory exist -d
# if file is empty -s
# e enable iterpret \
echo -e "Enter file name: \c"
read file_name

if [ -e $file_name ]; then
        echo "$file_name found"
else
        echo "$file_name not found"
fi
##########################################
#01:03:45 - How to append output to the end of text file
echo -e "Enter file name: \c"
read file_name

if [ -e $file_name ]; then
        if [ -w $file_name ]; then
                echo "Type some data. ctr+d to quit"
                cat >> $file_name
        else
                echo "File do not have write premissions"
        fi
else
        echo "$file_name not exists"
fi
######################################
#01:14:26 - Logical 'AND' Operator

