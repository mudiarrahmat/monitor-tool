#!/bin/bash

ACTION=$1
INTERFACE=$2

if [ "$ACTION" = "start" ]; then
    airmon-ng check kill
    airmon-ng start "$INTERFACE"

elif [ "$ACTION" = "stop" ]; then
    if [[ "$INTERFACE" == *"mon" ]]; then
        airmon-ng stop "$INTERFACE"
    else
        airmon-ng stop "${INTERFACE}mon"
    fi
    systemctl restart NetworkManager
fi