#! /usr/bin/gnuplot
set terminal pngcairo size 800,600
set grid
set output "05-primal.png"
set title "Performance Profiles dos Limitantes Primais para instâncias com B=0,5"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "05-primal.csv" using 2:1 with steps linewidth 2 title "Branch-and-Bound", "05-primal.csv" using 3:1 with steps linewidth 2 title "Branch-and-Cut", "05-primal.csv" using 4:1 with steps linewidth 2 title "GRASP"

