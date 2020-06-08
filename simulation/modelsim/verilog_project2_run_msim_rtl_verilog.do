transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/DELL/Desktop/NumberAnalyzer {C:/Users/DELL/Desktop/NumberAnalyzer/isEvenNumber.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/Desktop/NumberAnalyzer {C:/Users/DELL/Desktop/NumberAnalyzer/isFibonacci.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/Desktop/NumberAnalyzer {C:/Users/DELL/Desktop/NumberAnalyzer/isPalindrome.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/Desktop/NumberAnalyzer {C:/Users/DELL/Desktop/NumberAnalyzer/numberAnalyzer.v}

