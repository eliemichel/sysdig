#
# Useful commands
#
# *This is not a script*
# It's just a gathering of command line utilities
#

# Print number of equations in the netlist
grep -e ^IN$ -A 2715 ../micro/main_full.sch.net.backup | wc -l

# Print netlist from equation 2705 to equation 2714
grep -e ^IN$ -A 2715 ../micro/main_full.sch.net.backup | sed "1,2d" | cat -n | tail

# Run the scheduler and backup scheduled netlist from final/
# Since it takes time, a notification is raised at the end
cd ../micro && make main && cp main_full.sch.net main_full.sch.net.backup && cd ../final && notify-send 'Sysdig' 'Calculs terminés'



