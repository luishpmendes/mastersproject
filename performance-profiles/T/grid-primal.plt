#! /usr/bin/gnuplot
set terminal pngcairo size 800,600
set grid
set output "grid-primal.png"
set title "Performance Profiles dos Limitantes Primais para instâncias com topologia grade"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "grid-primal.csv" using 2:1 with steps linewidth 2 title "Branch-and-Bound", "grid-primal.csv" using 3:1 with steps linewidth 2 title "Branch-and-Cut", "grid-primal.csv" using 4:1 with steps linewidth 2 title "GRASP"

