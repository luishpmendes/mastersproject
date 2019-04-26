#include "../solver/metaheuristic/linear-relaxation/LinearRelaxationSolver.hpp"
#include <cassert>
#include <cfloat>

int main () {
    unsigned int timeLimit = 10;
    Instance instance;
    LinearRelaxationSolver solver;

    for (unsigned int seed = 0; seed < 10; seed ++) {
        instance = Instance("instances/exampleA.in");

        solver = LinearRelaxationSolver(instance, timeLimit, seed);

        assert(solver.getSolutionsCounter() == 0);
        assert(solver.getSolvingTime() == 0);
        assert(solver.getBestPrimalBound() == 0);
        assert(solver.getBestDualBound() == DBL_MAX);

        solver.solve();

        if (solver.getSolutionsCounter() > 0) {
            assert(solver.getBestPrimalBound() >= 2);
            assert(solver.getBestPrimalSolution().isFeasible());
            assert(solver.getBestPrimalSolution().getValue() == solver.getBestPrimalBound());
        }

        assert(solver.getBestDualBound() < DBL_MAX);
        assert(solver.getBestPrimalBound() <= solver.getBestDualBound());

        instance = Instance("instances/exampleB.in");

        solver = LinearRelaxationSolver(instance, timeLimit, seed);

        assert(solver.getSolutionsCounter() == 0);
        assert(solver.getSolvingTime() == 0);
        assert(solver.getBestPrimalBound() == 0);
        assert(solver.getBestDualBound() == DBL_MAX);

        solver.solve();

        if (solver.getSolutionsCounter() > 0) {
            assert(solver.getBestPrimalBound() >= 3);
            assert(solver.getBestPrimalSolution().isFeasible());
            assert(solver.getBestPrimalSolution().getValue() == solver.getBestPrimalBound());
        }

        assert(solver.getBestDualBound() < DBL_MAX);
        assert(solver.getBestPrimalBound() <= solver.getBestDualBound());

        instance = Instance("instances/exampleC.in");

        solver = LinearRelaxationSolver(instance, timeLimit, seed);

        assert(solver.getSolutionsCounter() == 0);
        assert(solver.getSolvingTime() == 0);
        assert(solver.getBestPrimalBound() == 0);
        assert(solver.getBestDualBound() == DBL_MAX);

        solver.solve();

        if (solver.getSolutionsCounter() > 0) {
            assert(solver.getBestPrimalBound() >= 12);
            assert(solver.getBestPrimalSolution().isFeasible());
            assert(solver.getBestPrimalSolution().getValue() == solver.getBestPrimalBound());
        }

        assert(solver.getBestDualBound() < DBL_MAX);
        assert(solver.getBestPrimalBound() <= solver.getBestDualBound());

        instance = Instance("instances/exampleD.in");

        solver = LinearRelaxationSolver(instance, timeLimit, seed);

        assert(solver.getSolutionsCounter() == 0);
        assert(solver.getSolvingTime() == 0);
        assert(solver.getBestPrimalBound() == 0);
        assert(solver.getBestDualBound() == DBL_MAX);

        solver.solve();

        if (solver.getSolutionsCounter() > 0) {
            assert(solver.getBestPrimalBound() >= 12);
            assert(solver.getBestPrimalSolution().isFeasible());
            assert(solver.getBestPrimalSolution().getValue() == solver.getBestPrimalBound());
        }

        assert(solver.getBestDualBound() < DBL_MAX);
        assert(solver.getBestPrimalBound() <= solver.getBestDualBound());

        instance = Instance("instances/exampleE.in");

        solver = LinearRelaxationSolver(instance, timeLimit, seed);

        assert(solver.getSolutionsCounter() == 0);
        assert(solver.getSolvingTime() == 0);
        assert(solver.getBestPrimalBound() == 0);
        assert(solver.getBestDualBound() == DBL_MAX);

        solver.solve();

        if (solver.getSolutionsCounter() > 0) {
            assert(solver.getBestPrimalBound() >= 200);
            assert(solver.getBestPrimalSolution().isFeasible());
            assert(solver.getBestPrimalSolution().getValue() == solver.getBestPrimalBound());
        }

        assert(solver.getBestDualBound() < DBL_MAX);
        assert(solver.getBestPrimalBound() <= solver.getBestDualBound());

        instance = Instance("instances/exampleF.in");

        solver = LinearRelaxationSolver(instance, timeLimit, seed);

        assert(solver.getSolutionsCounter() == 0);
        assert(solver.getSolvingTime() == 0);
        assert(solver.getBestPrimalBound() == 0);
        assert(solver.getBestDualBound() == DBL_MAX);

        solver.solve();

        if (solver.getSolutionsCounter() > 0) {
            assert(solver.getBestPrimalBound() >= 84);
            assert(solver.getBestPrimalSolution().isFeasible());
            assert(solver.getBestPrimalSolution().getValue() == solver.getBestPrimalBound());
        }

        assert(solver.getBestDualBound() < DBL_MAX);
        assert(solver.getBestPrimalBound() <= solver.getBestDualBound());
    }

    return 0;
}

