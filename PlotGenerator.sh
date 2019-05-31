#!/bin/bash

mkdir -p plots;

IFS=",";

echo "PlotGenerator";
make PlotGeneratorExec;

alpha=0.05;
N=30;

for solver in LinearRelaxationSolver BnBSolver BnCSolver GRASPSolver LagrangianHeuristicSolver2
do
    echo "solver="$solver;
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

                    solutionFilename="solutions/grid-m"$m"V"$V"E"$E"B"${B//.}"D"${D//.}$solver;

                    if [ "$solver" == "GRASPSolver" ]; then
                        solutionFilename=$solutionFilename"Alpha"${alpha//.};
                    else
                        if [ "$solver" == "LagrangianHeuristicSolver2" ]; then
                            solutionFilename=$solutionFilename"N"$N;
                        fi
                    fi

                    solutionFilename=$solutionFilename".sol";

                    echo $solutionFilename;

                    if [ -f $solutionFilename ]; then

                        ./bin/exec/PlotGeneratorExec --solver $solver -m $m -V $V -E $E -B ${B//.} -D ${D//.} --alpha ${alpha//.} --N $N;

                        gnuplot -e "solver = '$solver'; m = '$m'; V = '$V'; E = '$E'; B = '${B//.}'; D = '${D//.}'; alpha = '${alpha//.}'; N = '$N'" PlotGenerator.plt;
                    fi
                done
            done
        done
    done
done

make clean;

