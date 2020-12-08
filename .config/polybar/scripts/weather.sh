#!/usr/bin/env bash

function get_location {
    local remote_ip
    remote_ip="$(dig +short \
        myip.opendns.com @resolver1.opendns.com)"
    latitude="$(geoiplookup "${remote_ip}" \
        | awk 'BEGIN{FS=", "} NR==2{print $7}')"
    longitude="$(geoiplookup "${remote_ip}" \
        | awk 'BEGIN{FS=", "} NR==2{print $8}')"
}

function main {
    local api_key
    local weather
    local temp
    local response
    local icon

    while ! ping -q -c1 8.8.8.8; do
        :
    done &> /dev/null

    get_location
    api_key=""
    response=$(curl -sL \
        "api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${api_key}&units=metric")

    weather=$(echo "${response}" | jq '.weather[0].icon')
    temp=$(echo "${response}" | jq '.main.temp')

    if [[ "${weather}" =~ 01* ]]; then
        icon=" "
    elif [[ "${weather}" =~ 02* ]]; then
        icon=" "
    elif [[ "${weather}" =~ 03* ]]; then
        icon=" "
    elif [[ "${weather}" =~ 04* ]]; then
        icon=" "
    elif [[ "${weather}" =~ 09* ]]; then
        icon="殺 "
    elif [[ "${weather}" =~ 10* ]]; then
        icon=" "
    elif [[ "${weather}" =~ 11* ]]; then
        icon=" "
    elif [[ "${weather}" =~ 13* ]];then
        icon=" "
    elif [[ "${weather}" =~ 50* ]];then
        icon=" "
    else
        icon=" "
    fi

     LC_NUMERIC=C printf "%s %.1fºC\\n" "${icon}" "${temp}"
}

main
