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
age=25
# if [ "${age}" -gt 18 -a "${age}" -lt 30 ]; then
# if [[ "${age}" -gt 18 && "${age}" -lt 30 ]]; then
if [ "${age}" -gt 18 ] && [ "${age}" -lt 30 ]; then
        echo "valid age"
else
        echo "age not valid"
fi

#or operator:] || [,  -o,  [[ || ]] 

######################################
# 1:26:35 10 - Perform arithmetic operations
num1=20
num2=5

echo $(( num1 + num2 ))
#expr comand
echo $(expr $num1 + $num2 )
#only for multiplication use
echo $(expr $num1 \* $num2)

#---- operations on decimals -------
#we have to use BC
# see: man BC
num1=20.5
num2=5.1

echo "20.5+5" | bc
echo "20.5-5" | bc
echo "20.5*5" | bc
echo "scale=2;20.5/5" | bc
echo "20.5%5" | bc
#scale is used with division
# two decimal points

echo "$num1+$num2" | bc
# square root
num=27
echo "scale=2;sqrt($num)" | bc -l
#-l is calling liblary of functions.
#power
echo "scale=2;3^3" | bc -l


############################
# 01:46:06 12 - The case statement
#$1 value taken from console
vechicle=$1
case $vechicle in
        "car" )
                echo "Rent of $vechicle is 100$" ;;
        [vV][aA][nN])
                echo "Rent of $vechicle is 150$" ;;
        "bike" )
                echo "Rent of $vechicle is 15$" ;;
        * )
                echo "Unknown vechicle" ;;
esac

############################
# 02:02:26 14 - Array variables

os=('ubuntu' 'windows' 'kali')

echo "${os[@]}"
echo "${os[1]}"
echo[3]='mac' #add to array
echo "${!os[@]}" #prints indexes
echo "${#os[@]}" #print lenght
unset os[2] #remove 
#gaps in array are ok
############################
#02:12:51 15 - WHILE Loops
counter=1
for x in ${os[*]}
do
        echo "$counter) $x."
        #((counter++))  arithmetic expansion
        let "counter++"
done

n=1
#while (( $n <= 10 ))
while [ "$n" -le 4 ]; do
        echo "$n"
        n=$(( n+1 )) #$(( n++ ))
        sleep 0.5
        gmome-terminal & # it opens terminal
done
############################
#02:23:59 17 - Read a file content in Bash
#there ate several ways to do it
# 1]
#p is variable where you save the content
while read p
do
        echo $p
done < hello.txt
# 2]
cat hello.txt | while read p
do
        echo $p
done
#if special caracters above methods is cosing problems
# 3]
