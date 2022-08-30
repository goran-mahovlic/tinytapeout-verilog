WOKWI_PROJECT_ID=341424636358034002

# Simulate using Icarus Verilog
sim:
	iverilog -o user_module_$(WOKWI_PROJECT_ID).vvp \
	user_module_$(WOKWI_PROJECT_ID).v \
	trianglewave.v \
	sinewave.v \
	dacpwm.v
	#user_module_$(WOKWI_PROJECT_ID)_tb.v

	vvp user_module_$(WOKWI_PROJECT_ID).vvp

