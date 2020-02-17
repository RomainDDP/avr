GLISS2=$(HOME)/otawa/gliss2.bsim
MKIRG=$(GLISS2)/irg/mkirg

%.irg: %.nmp
	$(MKIRG) -component $< $@
