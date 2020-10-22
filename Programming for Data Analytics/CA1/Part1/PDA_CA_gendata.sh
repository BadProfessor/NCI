#!/bin/bash

echo "Generating CA data."
echo -n "Output to $2 "

count=1

> $2

while [ $count -le $1 ]
do
    randomnumber=`od -A n -t d -N 1 /dev/urandom`

    randomtext=`cat /dev/urandom | tr -cd "[:alnum:]" | head -c $randomnumber`

    randomnumber=`od -A n -t d -N 1 /dev/urandom`
    randomnumbermod=$(($randomnumber % 4))
    randomnumber110=$(( $RANDOM % 10 ))
    username="testname"


    if [ $randomnumbermod -eq 0 ]
    then
        msgtype="Oh freddled gruntbuggly"
    elif [ $randomnumbermod -eq 1 ]
    then
        msgtype="Thy micturations are to me"
    elif [ $randomnumbermod -eq 2 ]
    then
        msgtype="As plurdled gabbleblochits"
    elif [ $randomnumbermod -eq 3 ]
    then
        msgtype="On a lurgid bee"
    fi

    randomletter=`cat /dev/urandom | tr -dc 'A-Z0-9' | head -c 1`

    now=`date`
    randomnumber=`echo $randomnumber | sed -e "s: *::g"`

    randomnumberForUserName=$(( $RANDOM % 5 ))
    if [ $randomnumberForUserName -eq 0 ]
    then
        username="alice"
    elif [ $randomnumberForUserName -eq 1 ]
    then
          username="humptydumpy"
    elif [ $randomnumberForUserName -eq 2 ]
    then
              username="jedai"
    elif [ $randomnumberForUserName -eq 3 ]
    then
        username="tom"
    elif [ $randomnumberForUserName -eq 4 ]
      then
          username="avengers"
    fi

    randomnumberForUserGroup=$(( $RANDOM % 3 ))
    if [ $randomnumberForUserGroup -eq 0 ]
    then
        usergroup="group1"
    elif [ $randomnumberForUserGroup -eq 1 ]
    then
          usergroup="group2"
    elif [ $randomnumberForUserGroup -eq 2 ]
    then
        usergroup="group3"
    fi

    echo "$count,$now,$msgtype,$randomletter,$randomnumber,$randomtext,$randomnumber110,$username,$usergroup" >> $2

    count=$(($count + 1))
    if [ $(($count % 500)) -eq 0 ]
    then
        echo -n "."
    fi
done
echo " Output complete."
