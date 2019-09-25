#!/usr/bin/env bash

sysctl -w net.ipv4.conf.all.route_localnet=1

POSTGRES=$(ping -c 1 ark-testnet-postgres | awk -F'[()]' '/PING/{print $2}')
CORE=$(ping -c 1 ark-testnet-core | awk -F'[()]' '/PING/{print $2}')

iptables -I OUTPUT -t nat -o lo -d localhost -p tcp --dport 5432 -j DNAT --to-destination ${POSTGRES}:5432
iptables -I POSTROUTING -t nat -p tcp --dport 5432 -d ${POSTGRES} -j SNAT --to ${CORE}

bash
