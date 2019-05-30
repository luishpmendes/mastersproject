#! /usr/bin/gnuplot
set terminal pngcairo size 800,600
set grid
set output "A-primal.png"
set title "Performance Profiles dos Limitantes Primais para instâncias com capacidade baixa"
set xlabel "Desvio do melhor valor"
set ylabel "Probabilidade"
set key right bottom
plot "A-primal.csv" using 2:1 with steps linewidth 2 title "Branch-and-Bound", "A-primal.csv" using 3:1 with steps linewidth 2 title "Branch-and-Cut", "A-primal.csv" using 4:1 with steps linewidth 2 title "GRASP"

