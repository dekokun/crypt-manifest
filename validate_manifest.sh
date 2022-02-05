#!/bin/bash

err_dirs=()
for dir in charts/*
do
    if ! helm template test "${dir}" | kubeval  --ignore-missing-schemas --strict; then
        n=${#err_dirs[@]}
        err_dirs[$n]=${dir}
    fi
done

if [ ${#err_dirs[@]} -gt 0 ] ;then
    echo failed manifest directories:
    for dir in "${err_dirs[@]}"
    do
        echo "    - ${dir}"
    done
    exit 1;
fi
