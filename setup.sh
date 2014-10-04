#!/usr/bin/env bash

TEMPLATE_NAME="jubatemplate.txt"
JUBAMETHODS=(
    "jubaanomaly"
    "jubaclassifier"
    "jubaclustering"
    "jubagraph"
    "jubanearest_neighbor"
    "jubarecommender"
    "jubaregression"
    "jubastat"
)

for name in ${JUBAMETHODS[@]}; do
    export JUBATUS_METHOD_NAME=${name}
    perl -p -i -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' < ${TEMPLATE_NAME} > ${name}
done
