
# Set ROOT environment variables
#ROOTSYS = ${ROOTSYS}
ROOTCFLAGS = -pthread -m32 -I/home/michael/root/include
ROOTLIBS = -L/home/michael/root/lib -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lTree -lRint -lPostscript -lMatrix -lPhysics -lMathCore -lThread -pthread -lm -ldl -rdynamic
ROOTGLIBS = -L/home/michael/root/lib -lGui -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lTree -lRint -lPostscript -lMatrix -lPhysics -lMathCore -lThread -pthread -lm -ldl -rdynamic
#<
