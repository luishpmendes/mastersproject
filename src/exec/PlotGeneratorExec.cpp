#include "../solution/Solution.hpp"
#include "ArgumentParser.hpp"
#include <fstream>
#include <string>

int main (int argc, char * argv[]) {
    ArgumentParser argParser (argc, argv);

    if (argParser.cmdOptionExists("-m") && argParser.cmdOptionExists("-V") && 
            argParser.cmdOptionExists("-E") && argParser.cmdOptionExists("-B") 
            && argParser.cmdOptionExists("-D") && 
            argParser.cmdOptionExists("--solver")) {
        std::string m = argParser.getCmdOption("-m");
        std::string V = argParser.getCmdOption("-V");
        std::string E = argParser.getCmdOption("-E");
        std::string B = argParser.getCmdOption("-B");
        std::string D = argParser.getCmdOption("-D");
        std::string solver = argParser.getCmdOption("--solver");
        std::string alpha ("005");
        std::string N ("30");

        if (argParser.cmdOptionExists("--alpha")) {
            alpha = argParser.getCmdOption("--alpha");
        }

        if (argParser.cmdOptionExists("-N")) {
            N = argParser.getCmdOption("-N");
        }

        std::string instanceFilename ("instances/grid-m" + m + "V" + V + "E" 
                + E + "B" + B + "D" + D + ".in");

        std::string solutionFilename ("solutions/grid-m" + m + "V" + V + "E" 
                + E + "B" + B + "D" + D + solver);

        if (solver.compare("GRASPSolver") == 0) {
            solutionFilename += "Alpha" + alpha;
        } else if (solver.compare("LagrangianHeuristicSolver2") == 0) {
            solutionFilename += "N" + N;
        }

        solutionFilename += ".sol";

        try {
            Instance instance (instanceFilename);
            Solution solution (instance, solutionFilename);

            std::string verticesFilename ("plots/grid-m" + m + "V" + V + "E" 
                    + E + "B" + B + "D" + D + solver);

            if (solver.compare("GRASPSolver") == 0) {
                verticesFilename += "Alpha" + alpha;
            } else if (solver.compare("LagrangianHeuristicSolver2") == 0) {
                verticesFilename += "N" + N;
            }

            verticesFilename += ".txt";

            std::ofstream verticesFile (verticesFilename);

            for (const Vertex & v : instance.getG().getVertices()) {
                verticesFile << v.x << ' ' << v.y << std::endl;
            }

            verticesFile.close();

            for (unsigned int j = 0; j < instance.getM(); j++) {
                std::string districtFilename ("plots/grid-m" + m + "V" + V + 
                        "E" + E + "B" + B + "D" + D + solver);

                if (solver.compare("GRASPSolver") == 0) {
                    districtFilename += "Alpha" + alpha;
                } else if (solver.compare("LagrangianHeuristicSolver2") == 0) {
                    districtFilename += "N" + N;
                }

                districtFilename += "District" + std::to_string(j) + ".txt";

                std::ofstream districtFile (districtFilename);

                for (const Edge & e : solution.getDistrict(j)) {
                    districtFile << e.u.x << ' ' << e.u.y << std::endl << 
                        e.v.x << ' ' << e.v.y << std::endl << std::endl;
                }

                districtFile.close();
            }
        } catch (...) {
        }
    }
}

