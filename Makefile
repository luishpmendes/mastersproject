CPP=g++
CARGS=-std=c++14 -Wall -Werror -O0 -g3 -m64
DLIBINC=/opt/dlib-19.17/
DLIB=-lpthread -lX11
CXXFILES=/opt/dlib-19.17/dlib/all/source.cpp
GRBINC=/opt/gurobi811/linux64/include/
GRBLIB=-L/opt/gurobi811/linux64/lib -lgurobi_c++ -lgurobi81 -lm
MKDIR=mkdir -p
RM=rm -rf
SRC=$(PWD)/src
BIN=$(PWD)/bin

clean:
	$(RM) $(BIN)

$(BIN)/%.o: $(SRC)/%.cpp
	$(MKDIR) $(@D)
	$(CPP) $(CARGS) -c $< -o $@ -I$(DLIBINC) -I$(GRBINC) $(GRBLIB)

$(BIN)/test/InstanceTest: $(BIN)/disjoint-sets/DisjointSets.o \
                          $(BIN)/graph/Vertex.o \
                          $(BIN)/graph/Edge.o \
                          $(BIN)/graph/Graph.o \
                          $(BIN)/instance/Instance.o \
                          $(BIN)/test/InstanceTest.o
	$(MKDIR) $(@D)
	$(CPP) -o $@ $^ $(CARGS)

$(BIN)/exec/ArtificialInstanceGeneratorExec: $(BIN)/disjoint-sets/DisjointSets.o \
                                             $(BIN)/graph/Vertex.o \
                                             $(BIN)/graph/Edge.o \
                                             $(BIN)/graph/Graph.o \
                                             $(BIN)/instance/Instance.o \
                                             $(BIN)/exec/ArgumentParser.o \
                                             $(BIN)/exec/ArtificialInstanceGeneratorExec.o
	$(MKDIR) $(@D)
	$(CPP) -o $@ $^ $(CARGS)

$(BIN)/test/SolutionTest: $(BIN)/disjoint-sets/DisjointSets.o \
                          $(BIN)/graph/Vertex.o \
                          $(BIN)/graph/Edge.o \
                          $(BIN)/graph/Graph.o \
                          $(BIN)/instance/Instance.o \
                          $(BIN)/solution/Solution.o \
                          $(BIN)/test/SolutionTest.o
	$(MKDIR) $(@D)
	$(CPP) -o $@ $^ $(CARGS)

$(BIN)/test/HeuristicTest: $(BIN)/disjoint-sets/DisjointSets.o \
                           $(BIN)/graph/Vertex.o \
                           $(BIN)/graph/Edge.o \
                           $(BIN)/graph/Graph.o \
                           $(BIN)/instance/Instance.o \
                           $(BIN)/solution/Solution.o \
                           $(BIN)/solver/heuristic/Heuristic.o \
                           $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                           $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                           $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                           $(BIN)/test/HeuristicTest.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB)

$(BIN)/test/LinearRelaxationSolverTest: $(BIN)/disjoint-sets/DisjointSets.o \
                                        $(BIN)/graph/Vertex.o \
                                        $(BIN)/graph/Edge.o \
                                        $(BIN)/graph/Graph.o \
                                        $(BIN)/instance/Instance.o \
                                        $(BIN)/solution/Solution.o \
                                        $(BIN)/solver/heuristic/Heuristic.o \
                                        $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                                        $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                                        $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                                        $(BIN)/solver/CEDPSolver.o \
                                        $(BIN)/solver/metaheuristic/linear-relaxation/LinearRelaxationSolver.o \
                                        $(BIN)/test/LinearRelaxationSolverTest.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/exec/LinearRelaxationSolverExec: $(BIN)/disjoint-sets/DisjointSets.o \
                                        $(BIN)/graph/Vertex.o \
                                        $(BIN)/graph/Edge.o \
                                        $(BIN)/graph/Graph.o \
                                        $(BIN)/instance/Instance.o \
                                        $(BIN)/solution/Solution.o \
                                        $(BIN)/solver/heuristic/Heuristic.o \
                                        $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                                        $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                                        $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                                        $(BIN)/solver/CEDPSolver.o \
                                        $(BIN)/solver/metaheuristic/linear-relaxation/LinearRelaxationSolver.o \
                                        $(BIN)/exec/ArgumentParser.o \
                                        $(BIN)/exec/LinearRelaxationSolverExec.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/test/BnBSolverTest: $(BIN)/disjoint-sets/DisjointSets.o \
                           $(BIN)/graph/Vertex.o \
                           $(BIN)/graph/Edge.o \
                           $(BIN)/graph/Graph.o \
                           $(BIN)/instance/Instance.o \
                           $(BIN)/solution/Solution.o \
                           $(BIN)/solver/heuristic/Heuristic.o \
                           $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                           $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                           $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                           $(BIN)/solver/CEDPSolver.o \
                           $(BIN)/solver/exact/branch-and-bound/BnBSolver.o \
                           $(BIN)/test/BnBSolverTest.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/exec/BnBSolverExec: $(BIN)/disjoint-sets/DisjointSets.o \
                           $(BIN)/graph/Vertex.o \
                           $(BIN)/graph/Edge.o \
                           $(BIN)/graph/Graph.o \
                           $(BIN)/instance/Instance.o \
                           $(BIN)/solution/Solution.o \
                           $(BIN)/solver/heuristic/Heuristic.o \
                           $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                           $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                           $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                           $(BIN)/solver/CEDPSolver.o \
                           $(BIN)/solver/exact/branch-and-bound/BnBSolver.o \
                           $(BIN)/exec/ArgumentParser.o \
                           $(BIN)/exec/BnBSolverExec.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/test/BnCSolverTest: $(BIN)/disjoint-sets/DisjointSets.o \
                           $(BIN)/graph/Vertex.o \
                           $(BIN)/graph/Edge.o \
                           $(BIN)/graph/Graph.o \
                           $(BIN)/instance/Instance.o \
                           $(BIN)/solution/Solution.o \
                           $(BIN)/solver/heuristic/Heuristic.o \
                           $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                           $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                           $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                           $(BIN)/solver/CEDPSolver.o \
                           $(BIN)/solver/exact/branch-and-cut/BnCSolverCallback.o \
                           $(BIN)/solver/exact/branch-and-cut/BnCSolver.o \
                           $(BIN)/test/BnCSolverTest.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/exec/BnCSolverExec: $(BIN)/disjoint-sets/DisjointSets.o \
                           $(BIN)/graph/Vertex.o \
                           $(BIN)/graph/Edge.o \
                           $(BIN)/graph/Graph.o \
                           $(BIN)/instance/Instance.o \
                           $(BIN)/solution/Solution.o \
                           $(BIN)/solver/heuristic/Heuristic.o \
                           $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                           $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                           $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                           $(BIN)/solver/CEDPSolver.o \
                           $(BIN)/solver/exact/branch-and-cut/BnCSolverCallback.o \
                           $(BIN)/solver/exact/branch-and-cut/BnCSolver.o \
                           $(BIN)/exec/ArgumentParser.o \
                           $(BIN)/exec/BnCSolverExec.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/test/GRASPSolverTest: $(BIN)/disjoint-sets/DisjointSets.o \
                             $(BIN)/graph/Vertex.o \
                             $(BIN)/graph/Edge.o \
                             $(BIN)/graph/Graph.o \
                             $(BIN)/instance/Instance.o \
                             $(BIN)/solution/Solution.o \
                             $(BIN)/solver/heuristic/Heuristic.o \
                             $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                             $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                             $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                             $(BIN)/solver/CEDPSolver.o \
                             $(BIN)/solver/metaheuristic/grasp/GRASPSolver.o \
                             $(BIN)/test/GRASPSolverTest.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB)

$(BIN)/exec/GRASPSolverExec: $(BIN)/disjoint-sets/DisjointSets.o \
                             $(BIN)/graph/Vertex.o \
                             $(BIN)/graph/Edge.o \
                             $(BIN)/graph/Graph.o \
                             $(BIN)/instance/Instance.o \
                             $(BIN)/solution/Solution.o \
                             $(BIN)/solver/heuristic/Heuristic.o \
                             $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                             $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                             $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                             $(BIN)/solver/CEDPSolver.o \
                             $(BIN)/solver/metaheuristic/grasp/GRASPSolver.o \
                             $(BIN)/exec/ArgumentParser.o \
                             $(BIN)/exec/GRASPSolverExec.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB)

$(BIN)/test/LagrangianHeuristicSolver1Test: $(BIN)/disjoint-sets/DisjointSets.o \
                                            $(BIN)/graph/Vertex.o \
                                            $(BIN)/graph/Edge.o \
                                            $(BIN)/graph/Graph.o \
                                            $(BIN)/instance/Instance.o \
                                            $(BIN)/solution/Solution.o \
                                            $(BIN)/solver/heuristic/Heuristic.o \
                                            $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                                            $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                                            $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                                            $(BIN)/solver/CEDPSolver.o \
                                            $(BIN)/solver/metaheuristic/lagrangian-heuristic/LagrangianHeuristicSolver1.o \
                                            $(BIN)/test/LagrangianHeuristicSolver1Test.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB)

$(BIN)/exec/LagrangianHeuristicSolver1Exec: $(BIN)/disjoint-sets/DisjointSets.o \
                                            $(BIN)/graph/Vertex.o \
                                            $(BIN)/graph/Edge.o \
                                            $(BIN)/graph/Graph.o \
                                            $(BIN)/instance/Instance.o \
                                            $(BIN)/solution/Solution.o \
                                            $(BIN)/solver/heuristic/Heuristic.o \
                                            $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                                            $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                                            $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                                            $(BIN)/solver/CEDPSolver.o \
                                            $(BIN)/solver/metaheuristic/lagrangian-heuristic/LagrangianHeuristicSolver1.o \
                                            $(BIN)/exec/ArgumentParser.o \
                                            $(BIN)/exec/LagrangianHeuristicSolver1Exec.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB)

$(BIN)/test/LagrangianHeuristicSolver2Test: $(BIN)/disjoint-sets/DisjointSets.o \
                                            $(BIN)/graph/Vertex.o \
                                            $(BIN)/graph/Edge.o \
                                            $(BIN)/graph/Graph.o \
                                            $(BIN)/instance/Instance.o \
                                            $(BIN)/solution/Solution.o \
                                            $(BIN)/solver/heuristic/Heuristic.o \
                                            $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                                            $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                                            $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                                            $(BIN)/solver/CEDPSolver.o \
                                            $(BIN)/solver/metaheuristic/lagrangian-heuristic/LagrangianHeuristicSolver2.o \
                                            $(BIN)/test/LagrangianHeuristicSolver2Test.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/exec/LagrangianHeuristicSolver2Exec: $(BIN)/disjoint-sets/DisjointSets.o \
                                            $(BIN)/graph/Vertex.o \
                                            $(BIN)/graph/Edge.o \
                                            $(BIN)/graph/Graph.o \
                                            $(BIN)/instance/Instance.o \
                                            $(BIN)/solution/Solution.o \
                                            $(BIN)/solver/heuristic/Heuristic.o \
                                            $(BIN)/solver/heuristic/constructive/GreedyConstructiveHeuristic.o \
                                            $(BIN)/solver/heuristic/fixer/SolutionFixer.o \
                                            $(BIN)/solver/heuristic/localsearch/LocalSearchHeuristic.o \
                                            $(BIN)/solver/CEDPSolver.o \
                                            $(BIN)/solver/metaheuristic/lagrangian-heuristic/LagrangianHeuristicSolver2.o \
                                            $(BIN)/exec/ArgumentParser.o \
                                            $(BIN)/exec/LagrangianHeuristicSolver2Exec.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB) -I$(GRBINC) $(GRBLIB)

$(BIN)/exec/StatisticsAggregatorExec: $(BIN)/exec/ArgumentParser.o \
                                      $(BIN)/exec/StatisticsAggregatorExec.o
	$(MKDIR) $(@D)
	$(CPP) $(CXXFILES) -o $@ $^ $(CARGS) $(DLIB)

$(BIN)/exec/PlotGeneratorExec: $(BIN)/disjoint-sets/DisjointSets.o \
                               $(BIN)/graph/Vertex.o \
                               $(BIN)/graph/Edge.o \
                               $(BIN)/graph/Graph.o \
                               $(BIN)/instance/Instance.o \
							   $(BIN)/solution/Solution.o \
                               $(BIN)/exec/ArgumentParser.o \
                               $(BIN)/exec/PlotGeneratorExec.o
	$(MKDIR) $(@D)
	$(CPP) -o $@ $^ $(CARGS)

InstanceTest: $(BIN)/test/InstanceTest

ArtificialInstanceGeneratorExec: $(BIN)/exec/ArtificialInstanceGeneratorExec

SolutionTest: $(BIN)/test/SolutionTest

HeuristicTest: $(BIN)/test/HeuristicTest

LinearRelaxationSolverTest: $(BIN)/test/LinearRelaxationSolverTest

LinearRelaxationSolverExec: $(BIN)/exec/LinearRelaxationSolverExec

BnBSolverTest: $(BIN)/test/BnBSolverTest

BnBSolverExec: $(BIN)/exec/BnBSolverExec

BnCSolverTest: $(BIN)/test/BnCSolverTest

BnCSolverExec: $(BIN)/exec/BnCSolverExec

GRASPSolverTest: $(BIN)/test/GRASPSolverTest

GRASPSolverExec: $(BIN)/exec/GRASPSolverExec

LagrangianHeuristicSolver1Test: $(BIN)/test/LagrangianHeuristicSolver1Test

LagrangianHeuristicSolver1Exec: $(BIN)/exec/LagrangianHeuristicSolver1Exec

LagrangianHeuristicSolver2Test: $(BIN)/test/LagrangianHeuristicSolver2Test

LagrangianHeuristicSolver2Exec: $(BIN)/exec/LagrangianHeuristicSolver2Exec

StatisticsAggregatorExec: $(BIN)/exec/StatisticsAggregatorExec

PlotGeneratorExec: $(BIN)/exec/PlotGeneratorExec

