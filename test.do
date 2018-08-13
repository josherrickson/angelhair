cap program drop angelhair
do angelhair.ado

webuse pig, clear
angelhair weight week, by(id) hnum(5) hcolor("blue") xtitle("abc")
