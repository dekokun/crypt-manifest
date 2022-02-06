#!/bin/bash

err_dirs=()
for dir in charts/*
do
    echo "$dir"
    if ! helm template test "${dir}" | kubeconform  --ignore-missing-schemas --strict --summary -schema-location default -schema-location 'schemas/{{ .ResourceKind }}.json'; then
        n=${#err_dirs[@]}
        err_dirs[$n]=${dir}
    fi
    echo
done

if [ ${#err_dirs[@]} -gt 0 ] ;then
    echo failed manifest directories:
    for dir in "${err_dirs[@]}"
    do
        echo "    - ${dir}"
    done
    exit 1;
fi
