#!/usr/bin/env bash

set -e  # exit on error

n=""
if [[ $* == *--no_plots* ]]; then
    n="--no_plots"
fi

./test_trajectory.py
./test_filters.py
./test_lie_algebra.py
./test_metrics.APE.py
./test_metrics.RPE.py
./test_executables.py

# run all demo scripts to get cheap app tests
yes | ./demos/traj_demo.sh "$n"
yes | ./demos/ape_demo.sh "$n"
yes | ./demos/rpe_demo.sh "$n"
yes | ./demos/rpe-for-each_demo.sh "$n"
yes | ./demos/res_demo.sh "$n"
yes | ./demos/latex_demo.sh "$n"

echo "enter 'y' to clean, any other key to exit"
read input
if [[ $input == y ]]; then
    ./demos/clean.sh
    exit 0
fi
