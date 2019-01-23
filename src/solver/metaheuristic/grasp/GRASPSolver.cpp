#include "GRASPSolver.hpp"
#include <fstream>

/*
 * Constructs a new solver.
 *
 * @param instance  the new solver's instance.
 * @param timeLimit the new solver's time limit.
 * @param seed      the seed for the new solver's pseudo-random numbers generator.
 * @param alpha     the new solver's threshold parameter.
 */
GRASPSolver::GRASPSolver(const Instance & instance, unsigned int timeLimit, 
        unsigned int seed, double alpha) : CEDPSolver::CEDPSolver(instance, 
            timeLimit, seed) {
    this->gcHeuristic = GreedyConstructiveHeuristic(this->instance, seed, alpha);
}

/*
 * Constructs a new empty solver.
 */
GRASPSolver::GRASPSolver() : CEDPSolver::CEDPSolver() {}

/*
 * Returns this solver's threshold parameter for the restricted candidate list.
 *
 * @return this solver's threshold parameter for the restricted candidate list.
 */
double GRASPSolver::getAlpha() {
    return this->gcHeuristic.getAlpha();
}

/*
 * Solve this solver's instance.
 */
void GRASPSolver::solve() {
    this->startTime = std::chrono::steady_clock::now();

    this->bestSolutionIteration = 0;
    this->bestSolutionTime = 0;
    this->notPartitionSolutionsCounter = 0;
    this->notConnectedSolutionsCounter = 0;
    this->notRespectsCapacitySolutionsCounter = 0;
    this->notBalancedSolutionsCounter = 0;
    this->notFeasibleSolutionsCounter = 0;
    this->fixedSolutionsCounter = 0;

    /* while termination criteria are not met */
    for (this->iterationsCounter = 1; !this->areTerminationCriteriaMet(); 
            this->iterationsCounter++) {
        unsigned int elapsedTime = this->getElapsedTime();
        unsigned int remainingTime = 0;

        if (this->timeLimit > elapsedTime) {
            remainingTime = this->timeLimit - elapsedTime;
        }

        /* ℰ' ← Constructive-Heuristic(m, D, B, G, d, c) */
        Solution solution = this->gcHeuristic.constructSolution(remainingTime);

        bool isFeasible = true;

        if (!solution.isPartition()) {
            isFeasible = false;
            this->notPartitionSolutionsCounter++;
        }

        if (!solution.isConnected()) {
            isFeasible = false;
            this->notConnectedSolutionsCounter++;
        }

        if (!solution.respectsCapacity()) {
            isFeasible = false;
            this->notRespectsCapacitySolutionsCounter++;
        }

        if (!solution.isBalanced()) {
            isFeasible = false;
            this->notBalancedSolutionsCounter++;
        }

        /* if ℰ' is not a feasible solution */
        if (!isFeasible) {
            this->notFeasibleSolutionsCounter++;
            elapsedTime = this->getElapsedTime();
            remainingTime = 0;

            if (this->timeLimit > elapsedTime) {
                remainingTime = this->timeLimit - elapsedTime;
            }

            /* ℰ' ← Fix-Solution(m, D, B, G, d, c, ℰ') */
            solution = SolutionFixer::fixSolution(solution, remainingTime);
        }

        /* if ℰ' is a feasible solution */
        if (solution.isFeasible()) {
            this->solutionsCounter++;

            if (!isFeasible) {
                this->fixedSolutionsCounter++;
            }

            elapsedTime = this->getElapsedTime();
            remainingTime = 0;

            if (this->timeLimit > elapsedTime) {
                remainingTime = this->timeLimit - elapsedTime;
            }

            /* ℰ' ← Local-Search-Heuristic(m, D, B, G, d, c, ℰ') */
            solution = this->lsHeuristic.improveSolution(solution, remainingTime);

            double primalBound = solution.getValue();

            /* 
             * if ℰ = ∅ 
             * || ∑_{j = 1}^{m}{∑_{e ∈ E_{j}}{c_{e, j}}} 
             * < ∑_{j = 1}^{m}{∑_{e ∈ E'_{j}}{c_{e, j}}} 
             */
            if (this->bestPrimalBound < primalBound) {
                /* ℰ ← ℰ' */
                this->bestPrimalBound = primalBound;
                this->bestPrimalSolution = solution;
                this->bestSolutionIteration = this->iterationsCounter;
                this->bestSolutionTime = this->getElapsedTime();
            }
        }
    }

    this->solvingTime = this->getElapsedTime();
}

/*
 * Write this solver's statistics into the specified output stream.
 *
 * @param os the output stream to write into.
 */
void GRASPSolver::write(std::ostream & os) const {
    CEDPSolver::write(os);
    os << "Total iterations: " << this->iterationsCounter << std::endl;
    os << "Best solution iteration: " << this->bestSolutionIteration << std::endl;
    os << "Best solution time: " << this->bestSolutionTime << std::endl;
    os << "Solutions that are not partition: " << 
        this->notPartitionSolutionsCounter << std::endl;
    os << "Solutions that are not connected: " << 
        this->notConnectedSolutionsCounter << std::endl;
    os << "Solutions that do not respects the capacity: " << 
        this->notRespectsCapacitySolutionsCounter << std::endl;
    os << "Solutions that are not balanced: " << this->notBalancedSolutionsCounter << std::endl;
    os << "Solutions that are not feasible: " << this->notFeasibleSolutionsCounter << std::endl;
    os << "Solutions that were fixed: " << this->fixedSolutionsCounter << std::endl;
}

/*
 * Write this solver's statistics into the specified file.
 *
 * @param filename the file to write into.
 */
void GRASPSolver::write(const char * filename) const {
    std::ofstream ofs;
    ofs.open(filename);

    if (ofs.is_open()) {
        this->write(ofs);
        ofs.close();
    } else {
        throw "File not created.";
    }
}

/*
 * Write this solver's statistics into the specified file.
 *
 * @param filename the file to write into.
 */
void GRASPSolver::write(const std::string & filename) const {
    this->write(filename.c_str());
}

/*
 * Write this solver's statistics into the standard output stream.
 */
void GRASPSolver::write() const {
    this->write(std::cout);
}

