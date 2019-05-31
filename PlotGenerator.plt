#! /usr/bin/gnuplot
set key outside
set terminal pngcairo size 800,600
set xrange [0:sqrt(V)]
set yrange [0:sqrt(V)]

titulo = "grid-m".m."V".V."E".E."B".B."D".D." - "

if (solver eq "LinearRelaxationSolver") {
    titulo = titulo." Relaxação Linear"
}

if (solver eq "BnBSolver") {
    titulo = titulo." Branch-and-Bound"
}

if (solver eq "BnCSolver") {
    titulo = titulo." Branch-and-Cut"
}

if (solver eq "GRASPSolver") {
    titulo = titulo." GRASP"
}

if (solver eq "LagrangianHeuristicSolver2") {
    titulo = titulo." Heurística Lagrangiana"
}

set title titulo

array cores[10]
cores[1] = "#FF0000"
cores[2] = "#0000FF"
cores[3] = "#FFFF00"
cores[4] = "#FF00FF"
cores[5] = "#00FF00"
cores[6] = "#00FFFF"
cores[7] = "#FF9900"
cores[8] = "#9900FF"
cores[9] = "#00FF99"
cores[10] = "#FF0099"

if (solver eq "GRASPSolver") {
    set output "plots/grid-m".m."V".V."E".E."B".B."D".D.solver."Alpha".alpha.".png"
    district = "plots/grid-m".m."V".V."E".E."B".B."D".D.solver."Alpha".alpha."District"
    vertices = "plots/grid-m".m."V".V."E".E."B".B."D".D.solver."Alpha".alpha.".txt"
} else {
    if (solver eq "LagrangianHeuristicSolver2") {
        set output "plots/grid-m".m."V".V."E".E."B".B."D".D.solver."N".N.".png"
        district = "plots/grid-m".m."V".V."E".E."B".B."D".D.solver."N".N."District"
        vertices = "plots/grid-m".m."V".V."E".E."B".B."D".D.solver."N".N.".txt"
    } else {
        set output "plots/grid-m".m."V".V."E".E."B".B."D".D.solver.".png"
        district = "plots/grid-m".m."V".V."E".E."B".B."D".D."".solver."District"
        vertices = "plots/grid-m".m."V".V."E".E."B".B."D".D."".solver.".txt"
    }
}

plot for [i=0:m-1] district.i.".txt" with lines linetype 1 linewidth 2 linecolor rgbcolor cores[i+1] title "Distrito ".(i+1), \
          vertices using 1:2 with points pointtype 7 pointsize 0.5 linecolor rgb "black" notitle

