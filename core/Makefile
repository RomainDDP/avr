
# configuration
ARCH=avr
GLISS_PREFIX	=../../gliss2
WITH_DISASM		= 1	# comment it to prevent disassembler building
WITH_SIM		= 1	# comment it to prevent simulator building
#WITH_DYNLIB	= 1	# uncomment it to build dynamicaly linkable library
#WITH_OSEMUL	= 1 # uncomment it to use OS emulation of system calls (only with Unix)
HOST_ENDIAN		= little	# change to big if required
TARGET_ENDIAN	= little	# change to big if required

MEMORY=vfast_mem			# select here the memory module
LOADER=old_elf				# select here the loaded module

# goals definition
GOALS		=
SUBDIRS		=	src
CLEAN		=	$(ARCH).irg
DISTCLEAN	=	include src
GFLAGS		=

ifdef WITH_DISASM
GOALS		+=	$(ARCH)-disasm
SUBDIRS		+= 	disasm
DISTCLEAN	+= 	disasm
GFLAGS		+=	-a disasm.c
endif

ifdef WITH_SIM
GOALS		+=	$(ARCH)-sim
SUBDIRS		+=	sim
DISTCLEAN	+=	sim
GFLAGS		+=	-S
endif

ifdef WITH_DYNLIB
REC_FLAGS = WITH_DYNLIB=1
endif

GFLAGS += -D \
	-m mem:$(MEMORY) \
	-m loader:$(LOADER) \
	-m env:void_env \
	-m code:code
	


NMP_MAIN = $(ARCH).nmp
NMP = $(NMP_MAIN)


# targets
all: lib $(GOALS)

$(ARCH).irg: $(NMP)
	$(GLISS_PREFIX)/irg/mkirg $(NMP_MAIN) $@

$(ARCH).nml: $(NMP)
	$(GLISS_PREFIX)/gep/gliss-nmp2nml.pl $(NMP_MAIN) $@

src include: $(ARCH).irg
	$(GLISS_PREFIX)/gep/gep $(GFLAGS) $< -S

check: $(ARCH).irg
	$(GLISS_PREFIX)/gep/gep $(GFLAGS) $< -S -c

lib: src include include/$(ARCH)/config.h src/disasm.c
	(cd src; make -j $(REC_FLAGS))

$(ARCH)-disasm:
	cd disasm; make -j3

$(ARCH)-sim:
	cd sim; make -j3

src/disasm.c: $(ARCH).irg
	$(GLISS_PREFIX)/gep/gliss-disasm -switch $< -o $@ -c

distclean: clean
	-for d in $(SUBDIRS); do test -d $$d && (cd $$d; make distclean || exit 0); done
	-rm -rf $(DISTCLEAN)

clean: only-clean
	-for d in $(SUBDIRS); do test -d $$d && (cd $$d; make clean || exit 0); done

only-clean:
	-rm -rf $(CLEAN)

HOST_ENDIAN = $(shell python -c "import sys; print(sys.byteorder)")

include/$(ARCH)/config.h: config.tpl
	test -d include/$(ARCH) || mkdir include/$(ARCH)
	cp config.tpl $@
	echo "#define TARGET_ENDIANNESS $(TARGET_ENDIAN)" >> $@
	echo "#define HOST_ENDIANNESS $(HOST_ENDIAN)" >> $@
