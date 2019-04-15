#!/bin/bash

IFS=",";

echo "ArtificialInstanceGenerator";
make ArtificialInstanceGeneratorExec;

maxDemand=100;

echo "Grid"

for m in 5 10
do
    echo "m="$m;
    for VE in 25,24 25,32 25,40 49,48 49,66 49,84 100,99 100,140 100,180
    do
        set $VE;
        V=$1;
        echo "V="$V;
        E=$2;
        echo "E="$E;
        for B in 0.5 1.0
        do
            echo "B="$B;
            for D in 0.5 1.0
            do
                echo "D="$D;

                ./bin/exec/ArtificialInstanceGeneratorExec --grid --euclidean \
                    --max-demand $maxDemand -m $m -V $V -E $E -B $B -D $D > \
                    "instances/grid-m"$m"V"$V"E"${E}"B"${B//.}"D"${D//.}".in";
            done
        done
    done
done

echo "Random"

for m in 5 10
do
    echo "m="$m;
    for VE in 25,24 25,32 25,40 49,48 49,66 49,84 100,99 100,140 100,180
    do
        set $VE;
        V=$1;
        echo "V="$V;
        E=$2;
        echo "E="$E;
        for B in 0.5 1.0
        do
            echo "B="$B;
            for D in 0.5 1.0
            do
                echo "D="$D;

                ./bin/exec/ArtificialInstanceGeneratorExec --euclidean \
                    --max-demand $maxDemand -m $m -V $V -E $E -B $B -D $D > \
                    "instances/random-m"$m"V"$V"E"${E}"B"${B//.}"D"${D//.}".in";
            done
        done
    done
done

make clean;

