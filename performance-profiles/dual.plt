#! /usr/bin/gnuplot
set terminal pngcairo size 800,600 
set grid
set output "dual.png"
set title "Performance Profiles dos Limitantes Duais"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "dual.csv" using 3:1 with steps linewidth 2 title "Branch-and-Bound", "dual.csv" using 4:1 with steps linewidth 2 title "Branch-and-Cut", "dual.csv" using 5:1 with steps linewidth 2 title "Heurística Lagrangiana", "dual.csv" using 2:1 with steps linewidth 2 title "Relaxação Linear"

