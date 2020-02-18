# Makefile for the avr architecture using GLISS V2
ARCH=avr
# configuration
#GLISS2=$(HOME)/otawa/gliss2.bsim
#MKIRG=$(GLISS2)/irg/mkirg
GLISS_PREFIX = ../../gliss2/
WITH_DISASM		= 1	# comment it to prevent disassembler building
WITH_SIM		= 1	# comment it to prevent simulator building
WITH_DYNLIB	= 1	# uncomment it to build dynamicaly linkable library
#WITH_OSEMUL	= 1 # uncomment it to use OS emulation of system calls (only with Unix)
CPU_ENDIAN		= little	# change to big if required
MEM_ENDIAN		= little	# change to big if required

MEMORY=vfast_mem			# select here the memory module
LOADER=old_elf				# select here the loaded module
DECODER=decode32_dtrace		# modify this with CAUTION

# goals definition
GOALS		=
SUBDIRS		=	src
CLEAN		=	$(ARCH).nml $(ARCH).irg include
DISTCLEAN	=	include src

ifdef WITH_DISASM
GOALS		+=	$(ARCH)-disasm
SUBDIRS		+= 	disasm
DISTCLEAN	+= 	disasm
endif

ifdef WITH_SIM
GOALS		+=	$(ARCH)-sim
SUBDIRS		+=	sim
DISTCLEAN	+=	sim
endif

ifdef WITH_DYNLIB
REC_FLAGS = WITH_DYNLIB=1
endif

SYSCALL=syscall-linux
ENV=linux-env
#ifdef WITH_OSEMUL
#SYSCALL=syscall-linux
#ENV=linux-env
#else
#SYSCALL=syscall-embedded
#ENV=void_env
#endif

%.irg: %.nmp
	$(MKIRG) -component $< $@

GFLAGS = \
	-switch -D \
	-m mem:$(MEMORY) \
	-m loader:$(LOADER) \
	-m syscall:$(SYSCALL) \
	-m sysparm:sysparm-reg32 \
	-m fetch:fetch32 \
	-m decode:decode32 \
	-m emu:extern/emu \
	-m inst_size:inst_size \
	-m code:code \
	-m env:$(ENV) \
	-a disasm.c \
	-m exception:extern/exception\
	-m fpi:extern/fpi

NMP_MAIN = $(ARCH).nmp

NMP =\
	$(NMP_MAIN) \
	nmp/config.nmp \
	nmp/control.nmp \
	nmp/macros.nmp \
	nmp/special.nmp \
	nmp/state.nmp \
	nmp/AVRI_alu.nmp \
	nmp/AVRI_mem.nmp \
	nmp/AVRA.nmp \
	nmp/AVRD.nmp \
	nmp/AVRF.nmp \
	nmp/AVRM.nmp

ifeq ($(ARCH), avr)
NMP =\
	$(NMP_MAIN) \
	nmp/AVRI_alu.nmp \
	nmp/AVRI_mem.nmp \
	nmp/AVRA.nmp \
	nmp/AVRF.nmp \
	nmp/AVRM.nmp
endif

# targets
#all: lib $(GOALS)


#lib: src include/$(ARCH)/config.h src/disasm.c
#	(cd src; make -j $(REC_FLAGS))


nmp/config.nmp:
ifeq ($(MEM_ENDIAN),big)
	echo "let BigEndianMem = 1" > $@
else
	echo "let BigEndianMem = 0" > $@
endif
ifeq ($(CPU_ENDIAN),big)
	echo "let BigEndianCPU = 1" >> $@
else
	echo "let BigEndianCPU = 0" >> $@
endif

$(ARCH).nmp: $(NMP)
	$(GLISS_PREFIX)/gep/gliss-nmp2nml.pl $< $@

$(ARCH).irg: $(ARCH).nml #nml
	$(GLISS_PREFIX)/irg/mkirg $< $@

$(ARCH).nml: $(NMP)
	$(GLISS_PREFIX)/gep/gliss-nmp2nml.pl $< $@

#src include: $(ARCH).nml
#	$(GLISS_PREFIX)/gep/gep $(GFLAGS) $< -S