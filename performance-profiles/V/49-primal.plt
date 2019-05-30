#! /usr/bin/gnuplot
set terminal pngcairo size 800,600
set grid
set output "49-primal.png"
set title "Performance Profiles dos Limitantes Primais para instâncias com |V|=49"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "49-primal.csv" using 2:1 with steps linewidth 2 title "Branch-and-Bound", "49-primal.csv" using 3:1 with steps linewidth 2 title "Branch-and-Cut", "49-primal.csv" using 4:1 with steps linewidth 2 title "GRASP"

