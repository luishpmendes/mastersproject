#! /usr/bin/gnuplot
set terminal pngcairo size 800,600
set grid
set output "10-primal.png"
set title "Performance Profiles dos Limitantes Primais para instâncias com m=10"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "10-primal.csv" using 2:1 with steps linewidth 2 title "Branch-and-Bound", "10-primal.csv" using 3:1 with steps linewidth 2 title "Branch-and-Cut", "10-primal.csv" using 4:1 with steps linewidth 2 title "GRASP"

