#!/usr/bin/env bash

function main {
    local api_key
    local weather
    local temp
    local response
    local icon
    local city_name

    while ! ping -q -c1 8.8.8.8; do
        :
    done &> /dev/null

    city_name="São Carlos"
    city_name="${city_name/ /+}"
    api_key=""
    response=$(curl -sL \
        "api.openweathermap.org/data/2.5/weather?q=${city_name}&appid=${api_key}&units=metric")

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
