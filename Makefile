# Base directory where the EvtGen libraries are
BASEDIR = $(EVTGENDIR)

# Read in the config.mk file in the base directory to extract where
# the external libraries are, as well as setting compiler flags etc..

include ${BASEDIR}/config.mk
include ${BASEDIR}/test/extraConfig.mk

# Need to first add EvtGen libraries, then HepMC, then Photos, Tauola and Pythia,
# since Photos depends on HepMC etc..                                            

allLibDir=-L$(HEPMCLIBDIR)
allLibs=$(HEPMCLIBLIST)   

ifeq ("$(EVTGEN_PHOTOS)", "1")
        allLibDir+=-L$(PHOTOSLIBDIR)
        allLibs+=$(PHOTOSLIBLIST)   
endif

ifeq ("$(EVTGEN_PYTHIA)", "1")
        allLibDir+=-L$(PYTHIALIBDIR)
        allLibs+=$(PYTHIALIBLIST)
endif

ifeq ("$(EVTGEN_TAUOLA)", "1")
        allLibDir+=-L$(TAUOLALIBDIR)
        allLibs+=$(TAUOLALIBLIST)
endif

evtgenLibs=-lEvtGen
ifeq ($(EVTGEN_EXTERNAL),1)
	evtgenLibs+=-lEvtGenExternal
	EXTRAFLAGS+= -D EVTGEN_EXTERNAL
endif

GENLIBS = -L${BASEDIR}/lib ${allLibDir} -lgfortran ${allLibs} ${evtgenLibs}

INCLUDEDIR = ${BASEDIR}

CXXFLAGS      += $(ROOTCFLAGS)
LIBS           = $(ROOTLIBS)
NGLIBS         = $(ROOTGLIBS)
NGLIBS        += -lMinuit
GLIBS          = $(filter-out -lNew, $(NGLIBS))

.SUFFIXES: .cc

# ================================================================================
default: profmc

profmc: profmc.o
	$(CXX) $(CXXFLAGS) $(EXTRAFLAGS) -o profmc profmc.o $(GENLIBS) $(LIBS)

.cc.o:
	$(CXX) $(CXXFLAGS) $(EXTRAFLAGS) -c -o $@ $< -I$(INCLUDEDIR) -I$(HEPMCINCDIR)

clean:
	rm -f profmc *.o
