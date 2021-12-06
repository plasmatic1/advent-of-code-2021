#!/bin/bash
# Format: ./run.sh <day> <task num>
# Note: does not work on day 1
cd $1

rm -f t$2
ghc --make t$2

if [[ -f t$2 ]]; then
    ./t$2
else
    echo "Compile Failed!"
fi

cd ..