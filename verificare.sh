#!/bin/bash

verifica_ip() {
    nume=$1
    ip=$2
    dns=$3

    real=$(nslookup -type=A "$nume" "$dns" | grep "Address:" | tail -1 | awk '{print $2}')

    if [ "$ip" != "$real" ]; then
        echo "Bogus IP for $nume in /etc/hosts!"
    fi
}

cat /etc/hosts | while read ip nume
do
    verifica_ip "$nume" "$ip" "8.8.8.8"
done
