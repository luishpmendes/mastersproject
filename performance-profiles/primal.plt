#! /usr/bin/gnuplot
set terminal pngcairo size 800,600
set grid
set output "primal.png"
set title "Performance Profiles dos Limitantes Primais"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "primal.csv" using 2:1 with steps linewidth 2 title "Branch-and-Bound", "primal.csv" using 3:1 with steps linewidth 2 title "Branch-and-Cut", "primal.csv" using 4:1 with steps linewidth 2 title "GRASP", "primal.csv" using 5:1 with steps linewidth 2 title "Heurística Lagrangiana"

