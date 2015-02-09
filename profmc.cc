//
//  Sample test program for running EvtGen
//  

#include "EvtGen/EvtGen.hh"

#include "EvtGenBase/EvtParticle.hh"
#include "EvtGenBase/EvtParticleFactory.hh"
#include "EvtGenBase/EvtPatches.hh"
#include "EvtGenBase/EvtPDL.hh"
#include "EvtGenBase/EvtRandom.hh"
#include "EvtGenBase/EvtReport.hh"
#include "EvtGenBase/EvtHepMCEvent.hh"
#include "EvtGenBase/EvtStdlibRandomEngine.hh"
#include "EvtGenBase/EvtAbsRadCorr.hh"
#include "EvtGenBase/EvtDecayBase.hh"

#ifdef EVTGEN_EXTERNAL
#include "EvtGenExternal/EvtExternalGenList.hh"
#endif

#include "HepMC/GenEvent.h"
#include "HepMC/GenVertex.h"
#include "HepMC/GenParticle.h"
#include "HepMC/IO_GenEvent.h"

#include <iostream>
#include <string>
#include <cstring>

#include <list>


bool copyParamlines (const char* path_to_source_file, std::ostream& dest_file);
bool appendDecayfile (const char* path_to_source_file, std::ostream& dest_file);
std::string replaceWhiteSpaceWithEqualSign (std::string paramline);

int main(int argc, char** argv) {
  
  EvtParticle* parent(0);
  
  EvtStdlibRandomEngine eng;
  EvtRandom::setRandomEngine((EvtRandomEngine*)&eng);
  
  EvtAbsRadCorr* radCorrEngine = 0;
  std::list<EvtDecayBase*> extraModels;
  
  #ifdef EVTGEN_EXTERNAL
  EvtExternalGenList genList;
  radCorrEngine = genList.getPhotosModel();
  extraModels = genList.getListOfModels();
  #endif
  
  //Initialize the generator - read in the decay table and particle properties
  EvtGen myGenerator("../../../trunk/DECAY_2010.DEC","../../../trunk/evt.pdl", (EvtRandomEngine*)&eng, radCorrEngine, &extraModels);
  
  //If I wanted a user decay file, I would read it in now.
  std::ofstream combinedfile("combtemp.txt");
  if (copyParamlines(argv[3], combinedfile)) std::cout << "parameters read\n";
  if (appendDecayfile("../../../trunk/DECAY_Dp.DEC", combinedfile)) std::cout << "Decay file read\n";
  
  combinedfile.close();
  myGenerator.readUDecay("combtemp.txt");
  
  static EvtId UPS4 = EvtPDL::getId(std::string("Upsilon(4S)"));
  
  int nEvents=std::atoi(argv[1]);
  HepMC::IO_GenEvent ascii_io(argv[2], std::ios::out);
  
  // Loop to create nEvents, starting from an Upsilon(4S)
  int i;
  for (i = 0; i < nEvents; i++) {
    // Set up the parent particle
    EvtVector4R pInit(EvtPDL::getMeanMass(UPS4), 0.0, 0.0, 0.0);
    parent = EvtParticleFactory::particleFactory(UPS4, pInit);
    parent->setVectorSpinDensity();      
    
    // Generate the event
    myGenerator.generateDecay(parent);    
    
    // Write out the results
    EvtHepMCEvent theEvent;
    theEvent.constructEvent(parent);
    HepMC::GenEvent* genEvent = theEvent.getEvent();
    
    HepMC::GenEvent* hepmc=NULL;
    hepmc=theEvent.getEvent();
    
    // Manually set the beam particles
    HepMC::FourVector v1(8.9871067, 0.0, 0.0, 8.9871067);
    HepMC::FourVector v2(3.112816, 0.0, 0.0, -3.112816 );
    HepMC::GenParticle b1 = HepMC::GenParticle(v1,  11, 0);
    HepMC::GenParticle b2 = HepMC::GenParticle(v2, -11, 0);
    hepmc->set_beam_particles(&b1, &b2);
    
    // Way dodgy a posteriori adding of a signal process vertex
    HepMC::GenVertex* sigvtx = new HepMC::GenVertex();
    hepmc->set_signal_process_vertex (sigvtx);
    sigvtx->add_particle_in(&b1);
    sigvtx->add_particle_in(&b2);
    HepMC::GenParticle* ups4s = hepmc->barcode_to_particle(10001);
    sigvtx->add_particle_out(ups4s);
    
    ascii_io << hepmc;
    hepmc->remove_vertex(sigvtx);
    parent->deleteTree();
  }
  
  return 0;
  
}

bool copyParamlines (const char* path_to_source_file, std::ostream& dest_file){
  std::ifstream param_file(path_to_source_file);
  char paramline[256];
  char templine[256];
  if (param_file)
  {
    param_file.getline(paramline,256);
    while (!param_file.eof()){
//       paramline=replace(paramline).c_str();
      strcpy(paramline,replaceWhiteSpaceWithEqualSign(paramline).c_str());
      dest_file << "PythiaBothParam " << paramline << '\n';
      param_file.getline(paramline,256);
    }
    
    return dest_file;
  }
  else
  {
    std::cerr << "error: could not open " << path_to_source_file << '\n';
    return false;
  }
}

bool appendDecayfile (const char* path_to_source_file, std::ostream& dest_file)
{
  std::ifstream udecay_file(path_to_source_file);
  if (udecay_file)
  {
    dest_file << udecay_file.rdbuf();
    return dest_file;
  }
  else
  {
    std::cerr << "error: could not open " << path_to_source_file << '\n';
    return false;
  }
}

std::string replaceWhiteSpaceWithEqualSign (std::string paramline)
{
  int i=0;
  //find first occurence of whitespace and change to equal sign
  while (!(paramline[i]==' ')){
      ++i;
  }
  paramline[i]='=';
  ++i;
  //remove remaining whitespace if any
  while ((paramline[i]==' ')){
    paramline.erase(i,1);
  }
//   while (!paramline[i]=='\0'){
//     paramline[i]=paramline[i+1];
//     ++i;
//   }
  return paramline;
}

