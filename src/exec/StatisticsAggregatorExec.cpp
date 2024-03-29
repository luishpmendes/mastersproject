#include "ArgumentParser.hpp"
#include <cstdio>
#include <iostream>
#include <string>

int main (int argc, char * argv[]) {
    ArgumentParser argParser (argc, argv);

    if (argParser.cmdOptionExists("--solver")) {
        std::string solver = argParser.getCmdOption("--solver");
        unsigned int m, D, V, E, U, A, UPrime, APrime, timeLimit, seed, 
                     solvingTime, solutionsFound, bestPrimalBound, 
                     isSolutionFeasible, totalIterations, 
                     bestSolutionIteration, bestSolutionTime, notPartition, 
                     notConnected, dontRespectCapacity, notBalanced, 
                     notFeasible, fixed;
        double B, bestDualBound;

        scanf("m: %u\n", &m);
        scanf("D: %u\n", &D);
        scanf("B: %lf\n", &B);
        scanf("|V|: %u\n", &V);
        scanf("|E|: %u\n", &E);
        scanf("|U|: %u\n", &U);
        scanf("|A|: %u\n", &A);
        scanf("|U'|: %u\n", &UPrime);
        scanf("|A'|: %u\n", &APrime);
        scanf("Time limit: %us\n", &timeLimit);
        scanf("Seed: %u\n", &seed);
        scanf("Solving time: %us\n", &solvingTime);
        scanf("Solutions found: %u\n", &solutionsFound);
        scanf("Best primal bound: %u\n", &bestPrimalBound);
        scanf("Best dual bound: %lf\n", &bestDualBound);
        scanf("Is solution feasible: %u\n", &isSolutionFeasible);

        if (solver.compare("GRASPSolver") == 0 || 
                solver.compare("LagrangianHeuristicSolver1") == 0 || 
                solver.compare("LagrangianHeuristicSolver2") == 0) {
            scanf("Total iterations: %u\n", &totalIterations);
            scanf("Best solution iteration: %u\n", &bestSolutionIteration);
            scanf("Best solution time: %u\n", &bestSolutionTime);
            scanf("Solutions that are not partition: %u\n", &notPartition);
            scanf("Solutions that are not connected: %u\n", &notConnected);
            scanf("Solutions that do not respects the capacity: %u\n", &dontRespectCapacity);
            scanf("Solutions that are not balanced: %u\n", &notBalanced);
            scanf("Solutions that are not feasible: %u\n", &notFeasible);
            scanf("Solutions that were fixed: %u\n", &fixed);
        }

        std::cout << solver << " " << m << " " << D << " " << B << " " << V << 
            " " << E << " " << U << " " << A << " " << UPrime << " " << APrime 
            << " " << timeLimit << " " << seed << " " << solvingTime << " " << 
            solutionsFound << " " << bestPrimalBound << " " << bestDualBound 
            << " " << isSolutionFeasible;

        if (solver.compare("GRASPSolver") == 0 || 
                solver.compare("LagrangianHeuristicSolver1") == 0 || 
                solver.compare("LagrangianHeuristicSolver2") == 0) {
            std::cout << " " << totalIterations << " " << 
                bestSolutionIteration << " " << bestSolutionTime << " " << 
                notPartition << " " << notConnected << " " << 
                dontRespectCapacity << " " << notBalanced << " " << 
                notFeasible << " " << fixed;
        }

        std::cout << std::endl;
    }
}

