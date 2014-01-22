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

# Pretty print sim output
fold -w14 tmp | sed -e 's/\(^.\{1\}\)/\1 /g' -e 's/\(^.\{10\}\)/\1 /g' -e 's/\(^.\{15\}\)/\1 /g' | less

# Pretty git log
git log --decorate --pretty=format:"%C(3)%h%C() %s -- %C(4)%an"
# or
git log --decorate --pretty=format:"%C(3)%h%C() %s -- %C(4)%an" --graph

