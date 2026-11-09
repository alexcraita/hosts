#!/bin/bash

cat /etc/hosts | while read ip nume
do
    real=$(nslookup -type=A $nume | grep "Address:" | tail -1 | cut -d' ' -f2)

    if [ "$ip" != "$real" ]; then
        echo "Bogus IP for $nume in /etc/hosts!"
    fi
done
