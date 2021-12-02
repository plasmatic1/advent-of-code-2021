#!/bin/bash
# Format: ./run.sh <day> <task num>
# Note: does not work on day 1
cd $1

ghc --make t$2
./t$2

cd ..