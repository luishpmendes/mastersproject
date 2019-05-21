#!/bin/bash

make StatisticsAggregatorExec;

IFS=",";
alpha=0.05;
N=30;

for type in "grid" "random"
do
    for solver in "LinearRelaxationSolver" "BnBSolver" "BnCSolver" "GRASPSolver" "LagrangianHeuristicSolver2"
    do
        for m in 5 10
        do
            for VE in 25,24 25,32 25,40 49,48 49,66 49,84 100,99 100,140 100,180
            do
                set $VE;
                V=$1;
                E=$2;
                for B in 0.5 1.0
                do
                    for D in 0.5 1.0
                    do
                        if [ $solver = "GRASPSolver" ]
                        then
                            ./bin/exec/StatisticsAggregatorExec --solver $solver < "statistics/"$type"-m"$m"V"$V"E"$E"B"${B//.}"D"${D//.}$solver"Alpha"${alpha//.}".stat" >> statistics/statistics.txt;
                        else
                            if [ $solver = "LagrangianHeuristicSolver2" ]
                            then
                                ./bin/exec/StatisticsAggregatorExec --solver $solver < "statistics/"$type"-m"$m"V"$V"E"$E"B"${B//.}"D"${D//.}$solver"N"$N".stat" >> statistics/statistics.txt;
                            else
                                ./bin/exec/StatisticsAggregatorExec --solver $solver < "statistics/"$type"-m"$m"V"$V"E"$E"B"${B//.}"D"${D//.}$solver".stat" >> statistics/statistics.txt;
                            fi
                        fi
                    done;
                done;
            done;
        done;
    done;
done;

