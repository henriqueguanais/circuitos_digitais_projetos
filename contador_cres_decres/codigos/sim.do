vsim cont_cd 

add wave * 

force clr_cont 0 0ps, 1 10ps -repeat 80ps
force up_dw_cont 0 0ps -repeat 80ps
force clk_cont 0 0ps, 1 5ps -repeat 10ps

run 90ps