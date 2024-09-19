;# a basic do script for Modelsim
;# www.aztech.co.il - Amos Zaslavsky
transcript off
onerror abort
echo "------- START OF SCRIPT -------"

;# Test bench style
vlog day3.sv
vlog day3_tb.sv
vsim day3_tb

restart -force
noview *

add wave *
run 400 ns

#add wave -r *                      ;# all internal signals too
#add wave -ports -radix unsigned *  ;# more options: -in -out -color gold

# optional
#view signals
#add list *
#configure list -delta collapse

;# ============== start of stimulus section ==============
;# with test-benches only run command needed



;# =============== end of stimulus section ===============

puts "choosing a zoom-full timing range:"
wave zoomfull
#.wave.tree zoomfull ;# with some versions of modelsim
echo "---------------------- END OF SCRIPT ------------------------"
echo "The time now is $now [ string trim $resolution 01 ] "
