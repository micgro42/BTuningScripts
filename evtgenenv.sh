
GENERATOR=EvtGen
VERSION= 

#PREFIX= .

SHELL= /bin/bash 
ARCH= Linux-gcc4 
LCGPLATFORM= 
FC= gfortran 
FFLAGS= -O2 -Wuninitialized 
CFLAGS= -O2
CXX= g++
CXXFLAGS= -O2 -Wall

EVTGENDIR= /home/michael/Documents/BMC/EvtGen

TMPDIR= $(EVTGENDIR)/tmp
INCLUDEDIR= $(EVTGENDIR)

HEPMCDIR= /home/michael/Documents/BMC/HEPMC
HEPMCINCDIR= /home/michael/Documents/BMC/HEPMC/include
HEPMCLIBDIR= /home/michael/Documents/BMC/HEPMC/lib
HEPMCLIBLIST= -lHepMC

SRCDIR= $(EVTGENDIR)/src
LIBDIR_SHARED= $(EVTGENDIR)/lib
LIBDIR_ARCHIVE= $(EVTGENDIR)/lib/archive
LIBDIRLIST= -lEvtGen

LIB_SHARED= $(LIBDIR_SHARED)/lib$(GENERATOR).so
LIB_ARCHIVE= $(LIBDIR_ARCHIVE)/lib$(GENERATOR).a

LIBEXT_SHARED= $(LIBDIR_SHARED)/lib$(GENERATOR)External.so
LIBEXT_ARCHIVE= $(LIBDIR_ARCHIVE)/lib$(GENERATOR)External.a

# Flags:
#
FFLAGSSHARED= -fPIC
CFLAGSSHARED= -fPIC
CXXFLAGSSHARED= -fPIC

LDFLAGSSHARED= -O2 -Wall -pthread -fPIC 

FLIBS= -lgfortran -lgfortranbegin

# External generators:

EVTGEN_EXTERNAL= 1

EVTGEN_PYTHIA= 1
EXTRAFLAGS += -D EVTGEN_PYTHIA
PYTHIADIR= /home/michael/Documents/BMC/pythia8175
PYTHIAINCDIR= /home/michael/Documents/BMC/pythia8175/include
PYTHIALIBDIR= /home/michael/Documents/BMC/pythia8175/lib
PYTHIALIBLIST= -lpythia8 -llhapdfdummy -lhepmcinterface
EVTGEN_PHOTOS= 1
EXTRAFLAGS += -D EVTGEN_PHOTOS
PHOTOSDIR= /home/michael/Documents/BMC/PHOTOS
PHOTOSINCDIR= /home/michael/Documents/BMC/PHOTOS/include
PHOTOSLIBDIR= /home/michael/Documents/BMC/PHOTOS/lib
PHOTOSLIBLIST= -lPhotosCxxInterface -lPhotosFortran
EVTGEN_TAUOLA= 1
EXTRAFLAGS += -D EVTGEN_TAUOLA
TAUOLADIR= /home/michael/Documents/BMC/TAUOLA
TAUOLAINCDIR= /home/michael/Documents/BMC/TAUOLA/include
TAUOLALIBDIR= /home/michael/Documents/BMC/TAUOLA/lib
TAUOLALIBLIST= -lTauolaCxxInterface -lTauolaFortran
