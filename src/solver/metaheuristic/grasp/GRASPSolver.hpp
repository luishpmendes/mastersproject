#pragma once

#include "../../CEDPSolver.hpp"

/*
 * The GRASPSolver class represents a solver for the CEDP using the Greedy 
 * Randomized Adaptive Search Procedure method.
 */
class GRASPSolver : public CEDPSolver {
    private:
        /*
         * This solver's iterations counter.
         */
        unsigned int iterationsCounter;

        /*
         * The iteration when this solver found the best solution.
         */
        unsigned int bestSolutionIteration;

        /*
         * The time in seconds when this solver found the best solution.
         */
        unsigned int bestSolutionTime;

        /*
         * This solver's counter of solutions that are not edge partition.
         */
        unsigned int notPartitionSolutionsCounter;

        /*
         * This solver's counter of solutions that are not connected.
         */
        unsigned int notConnectedSolutionsCounter;

        /*
         * This solver's counter of solutions that do not respects the capacity.
         */
        unsigned int notRespectsCapacitySolutionsCounter;

        /*
         * This solver's counter of solutions that are not balanced.
         */
        unsigned int notBalancedSolutionsCounter;

        /*
         * This solver's counter of solutions that are not feasible.
         */
        unsigned int notFeasibleSolutionsCounter;

        /*
         * This solver's counter of solutions that were fixed.
         */
        unsigned int fixedSolutionsCounter;

    public:
        /*
         * Constructs a new solver.
         *
         * @param instance  the new solver's instance.
         * @param timeLimit the new solver's time limit.
         * @param seed      the seed for the new solver's pseudo-random numbers generator.
         * @param alpha     the new solver's threshold parameter.
         */
        GRASPSolver(const Instance & instance, unsigned int timeLimit, 
                unsigned int seed, double alpha);

        /*
         * Constructs a new empty solver.
         */
        GRASPSolver();

        /*
         * Returns this solver's threshold parameter for the restricted candidate list.
         *
         * @return this solver's threshold parameter for the restricted candidate list.
         */
        double getAlpha();

        /*
         * Solve this solver's instance.
         */
        void solve();

        /*
         * Write this solver's statistics into the specified output stream.
         *
         * @param os the output stream to write into.
         */
        void write(std::ostream & os) const;

        /*
         * Write this solver's statistics into the specified file.
         *
         * @param filename the file to write into.
         */
        void write(const char * filename) const;

        /*
         * Write this solver's statistics into the specified file.
         *
         * @param filename the file to write into.
         */
        void write(const std::string & filename) const;

        /*
         * Write this solver's statistics into the standard output stream.
         */
        void write() const;
};

