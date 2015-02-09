#! /bin/bash
rm -vr output/envelopes.bak
mv -v output/envelopes output/envelopes.bak
prof-envelopes --datadir ./output --weights ./output/weights --outdir ./output
cd output/envelopes
make-plots --pdf *.dat
rm -v *.dat

echo "making allBABAR_2004_phi.pdf"
pdftk BABAR_2004_phi*.pdf output allBABAR_2004_phi_envelopes.pdf

echo "making allBABAR_2007_S719111*.pdf"
pdftk BABAR_2007_S719111*.pdf output allBABAR_2007_S719111_envelopes.pdf

echo "making allBELLE_2001_S4598261*.pdf"
pdftk BELLE_2001_S4598261* output allBELLE_2001_S4598261_envelopes.pdf

echo "making allARGUS_1993_S2653028*.pdf"
pdftk ARGUS_1993_S2653028*  output allARGUS_1993_S2653028_envelopes.pdf
