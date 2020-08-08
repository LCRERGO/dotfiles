#!/usr/bin/env sh

main() {
    num_pack=$(aptitude search '~U' | wc -l)

    if [ "${num_pack}" -eq 0 ]; then
        res=""
    else
        res=${num_pack}
    fi

    printf " %s\\n" "${res}"
}

main
