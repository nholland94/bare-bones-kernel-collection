PATSHOME=/usr/lib/ats2-postiats-0.1.3
ATSCC=$(PATSHOME)/bin/atscc
ATSOPT=$(PATSHOME)/bin/atsopt

%_sats.o: %.sats
%_dats.o: %.dats

%_sats.o %_dats.o:
	$(ATSCC) $(ATSCCFLAGS) -c $< || echo $@ ": ERROR!"

kernel.bin: kernel_dats.o
