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

InstanceTest: $(BIN)/test/InstanceTest

ArtificialInstanceGeneratorExec: $(BIN)/exec/ArtificialInstanceGeneratorExec

SolutionTest: $(BIN)/test/SolutionTest

HeuristicTest: $(BIN)/test/HeuristicTest

LinearRelaxationSolverTest: $(BIN)/test/LinearRelaxationSolverTest

