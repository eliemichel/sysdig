#!/usr/bin/env sh

cat prog_clock.param.s |
# jour
sed -e "s/\[j_h\]/011/" | # high weight
sed -e "s/\[j_l\]/100/" | # low  weight
# mois
sed -e "s/\[m_h\]/000/" |
sed -e "s/\[m_l\]/010/" |
# an 1
sed -e "s/\[a1_h\]/000/" |
sed -e "s/\[a1_m\]/010/" |
sed -e "s/\[a1_l\]/100/" |
# an 2
sed -e "s/\[a2_h\]/001/" |
sed -e "s/\[a2_m\]/100/" |
sed -e "s/\[a2_l\]/000/" |
# s
sed -e "s/\[s_h\]/110/" |
sed -e "s/\[s_l\]/111/" |
# mn
sed -e "s/\[mn_h\]/111/" |
sed -e "s/\[mn_l\]/011/" |
# h
sed -e "s/\[h_h\]/010/" |
sed -e "s/\[h_l\]/111/" |
cat > prog_clock.s

# fullspeed mode
#grep -e "^#======($" -B 100000 prog_clock.s > tmp1
#grep -e "^#======)$" -A 100000 prog_clock.s > tmp2
#cat tmp1 tmp2 > prog_clock.s
#rm tmp1 tmp2

