;# a basic do script for Modelsim
;# www.aztech.co.il - Amos Zaslavsky
transcript off
onerror abort
echo "------- START OF SCRIPT -------"

;# Test bench style
;# vcom temp.vhd
;# vcom tb_temp.vhd
;# vsim tb_temp

restart -force
noview *

add wave *
#add wave -r *                      ;# all internal signals too
#add wave -ports -radix unsigned *  ;# more options: -in -out -color gold

# optional
#view signals
#add list *
#configure list -delta collapse

;# ============== start of stimulus section ==============
;# with test-benches only run command needed

force  resetN  0 , 1 100 ns
force  clk 0 , 1  50 ns -r 100 ns
force din 0
run 200 ns
force din 1
run 600 ns
force din 0
run 300 ns

;# =============== end of stimulus section ===============

puts "choosing a zoom-full timing range:"
wave zoomfull
#.wave.tree zoomfull ;# with some versions of modelsim
echo "---------------------- END OF SCRIPT ------------------------"
echo "The time now is $now [ string trim $resolution 01 ] "
