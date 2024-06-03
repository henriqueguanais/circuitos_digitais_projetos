vsim maquina_troco 

add wave * 

force clk "0" 0ps, "1" 10ps -repeat 20ps
force T "0" 0ps, "1" 20ps

force V "0101110101" 0ps
force moedas "101101" 0ps

run 400ps