#include "../instance/Instance.hpp"
#include "ArgumentParser.hpp"
#include <chrono>

int main (int argc, char * argv[]) {
    ArgumentParser argParser (argc, argv);

    if (argParser.cmdOptionExists("-V") && (argParser.cmdOptionExists("-E") 
                || argParser.cmdOptionExists("-d")) && 
            argParser.cmdOptionExists("-m")) {
        unsigned int V = std::stoul(argParser.getCmdOption("-V"));
        unsigned int E = V - 1;
        double d = 0.0;
        unsigned int m = std::stoul(argParser.getCmdOption("-m"));
        bool isGrid = argParser.cmdOptionExists("--grid");
        bool isEuclidean = argParser.cmdOptionExists("--euclidean");
        unsigned int maxDemand = 100;
        double B = 0.2;
        double D = 0.5;
        unsigned int seed = std::chrono::system_clock::now().time_since_epoch().count();

        if (argParser.cmdOptionExists("-E")) {
            E = std::stoul(argParser.getCmdOption("-E"));
        }

        if (argParser.cmdOptionExists("-d")) {
            d = std::stod(argParser.getCmdOption("-d"));
        }

        if (argParser.cmdOptionExists("--max-demand")) {
            maxDemand = std::stoul(argParser.getCmdOption("--max-demand"));
        }

        if (argParser.cmdOptionExists("-B")) {
            B = std::stod(argParser.getCmdOption("-B"));
        }

        if (argParser.cmdOptionExists("-D")) {
            D = std::stod(argParser.getCmdOption("-D"));
        }

        if (argParser.cmdOptionExists("--seed")) {
            seed = std::stoul(argParser.getCmdOption("--seed"));
        }

        Graph G;

        if (argParser.cmdOptionExists("-E")) {
            if (!isGrid) {
                G = Graph::generateRandomConnectedGraph(V, E, maxDemand, isEuclidean, seed);
            } else {
                unsigned int r, c;
                r = c = round(sqrt(V));
                G = Graph::generateRandomConnectedGridGraph(r, c, E, maxDemand, isEuclidean, seed);
            }
        } else if (argParser.cmdOptionExists("-d")) {
            if (!isGrid) {
                G = Graph::generateRandomConnectedGraph(V, d, maxDemand, isEuclidean, seed);
            } else {
                unsigned int r, c;
                r = c = round(sqrt(V));
                G = Graph::generateRandomConnectedGridGraph(r, c, d, maxDemand, isEuclidean, seed);
            }
        }

        double dE = G.getEdgesWeight();
        unsigned int maxD = round(((2.0 * (1.0 + (D * B))) / ((double) m)) * ((double) dE));

        Instance instance (m, maxD, B, G);

        instance.write();
    } else {
        std::cerr << "./ArtificialInstanceGenerator -V <V> -E <E> --grid " << 
            "--euclidean --max-demand <maxDemand> -m <m> -B <B> -D <D> " << 
            "--seed <seed>" << std::endl;
    }

    return 0;
}

