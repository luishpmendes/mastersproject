#!/bin/bash

mkdir -p statistics;
mkdir -p solutions;

timeLimit=3600;

echo "LinearRelaxationSolver";
make LinearRelaxationSolverExec;

for instance in grid-m5V25E24B10D10 grid-m5V49E48B10D10 grid-m5V100E99B10D10 \
    grid-m10V25E24B10D10 grid-m10V49E48B10D10 grid-m10V100E99B10D10 \
    random-m5V25E24B10D10 random-m5V49E48B10D10 random-m5V100E99B10D10 \
    random-m10V25E24B10D10 random-m10V49E48B10D10 random-m10V100E99B10D10
do
    echo "Instance: "$instance;
    echo "Start time: "$(date);
    ./bin/exec/LinearRelaxationSolverExec \
        --instance "instances/"$instance".in" --time-limit $timeLimit \
        --statistics "statistics/"$instance"LinearRelaxationSolver.stat" \
        --solution "solutions/"$instance"LinearRelaxationSolver.sol";
    echo "End time: "$(date);
done

echo "BnBSolver";
make BnBSolverExec;

for instance in grid-m5V25E24B10D10 grid-m5V49E48B10D10 grid-m5V100E99B10D10 \
    grid-m10V25E24B10D10 grid-m10V49E48B10D10 grid-m10V100E99B10D10 \
    random-m5V25E24B10D10 random-m5V49E48B10D10 random-m5V100E99B10D10 \
    random-m10V25E24B10D10 random-m10V49E48B10D10 random-m10V100E99B10D10
do
    echo "Instance: "$instance;
    echo "Start time: "$(date);
    ./bin/exec/BnBSolverExec --instance "instances/"$instance".in" \
        --time-limit $timeLimit \
        --statistics "statistics/"$instance"BnBSolver.stat" \
        --solution "solutions/"$instance"BnBSolver.sol";
    echo "End time: "$(date);
done

echo "BnCSolver";
make BnCSolverExec;

for instance in grid-m5V25E24B10D10 grid-m5V49E48B10D10 grid-m5V100E99B10D10 \
    grid-m10V25E24B10D10 grid-m10V49E48B10D10 grid-m10V100E99B10D10 \
    random-m5V25E24B10D10 random-m5V49E48B10D10 random-m5V100E99B10D10 \
    random-m10V25E24B10D10 random-m10V49E48B10D10 random-m10V100E99B10D10
do
    echo "Instance: "$instance;
    echo "Start time: "$(date);
    ./bin/exec/BnCSolverExec --instance "instances/"$instance".in" \
        --time-limit $timeLimit \
        --statistics "statistics/"$instance"BnCSolver.stat" \
        --solution "solutions/"$instance"BnCSolver.sol";
    echo "End time: "$(date);
done

echo "GRASPSolver";
make GRASPSolverExec;
alpha=0.05;
echo "alpha="$alpha;

for instance in grid-m5V25E24B10D10 grid-m5V49E48B10D10 grid-m5V100E99B10D10 \
    grid-m10V25E24B10D10 grid-m10V49E48B10D10 grid-m10V100E99B10D10 \
    random-m5V25E24B10D10 random-m5V49E48B10D10 random-m5V100E99B10D10 \
    random-m10V25E24B10D10 random-m10V49E48B10D10 random-m10V100E99B10D10
do
    echo "Instance: "$instance;
    echo "Start time: "$(date);
    ./bin/exec/GRASPSolverExec --instance "instances/"$instance".in" \
        --time-limit $timeLimit --alpha $alpha \
        --statistics "statistics/"$instance"GRASPSolverAlpha"${alpha//.}".stat" \
        --solution "solutions/"$instance"GRASPSolverAlpha"${alpha//.}".sol";
    echo "End time: "$(date);
done

echo "LagrangianHeuristicSolver2";
make LagrangianHeuristicSolver2Exec;
N=30;
echo "N="$N;

for instance in grid-m5V25E24B10D10 grid-m5V49E48B10D10 grid-m5V100E99B10D10 \
    grid-m10V25E24B10D10 grid-m10V49E48B10D10 grid-m10V100E99B10D10 \
    random-m5V25E24B10D10 random-m5V49E48B10D10 random-m5V100E99B10D10 \
    random-m10V25E24B10D10 random-m10V49E48B10D10 random-m10V100E99B10D10
do
    echo "Instance: "$instance;
    echo "Start time: "$(date);
    ./bin/exec/LagrangianHeuristicSolver2Exec \
        --instance "instances/"$instance".in" --time-limit $timeLimit -N $N \
        --statistics "statistics/"$instance"LagrangianHeuristicSolver2N"$N".stat" \
        --solution "solutions/"$instance"LagrangianHeuristicSolver2N"$N".sol";
    echo "End time: "$(date);
done

echo "Finished";

