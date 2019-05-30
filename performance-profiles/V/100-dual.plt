#! /usr/bin/gnuplot
set terminal pngcairo size 800,600 
set grid
set output "100-dual.png"
set title "Performance Profiles dos Limitantes Duais para instâncias com |V|=100"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "100-dual.csv" using 3:1 with steps linewidth 2 title "Branch-and-Bound", "100-dual.csv" using 4:1 with steps linewidth 2 title "Branch-and-Cut", "100-dual.csv" using 2:1 with steps linewidth 2 title "Relaxação Linear"

