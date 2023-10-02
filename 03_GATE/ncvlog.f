#-sv tb_term.sv 
#SME.v 
#+access+r 
#+define+RTL
#+debug
#+notimingchecks

SME_syn.v
-timescale 1ns/10ps
-sv tb_term.sv
-v /RAID2/COURSE/iclab/iclab075/IC_CONTEST/CBDK_IC_Contest_v2.5/Verilog/tsmc13_neg.v 
+define+SDF 
+ncmaxdelays
+debug
