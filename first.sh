#!/bin/bash

for ((MANT=8;MANT<=48;MANT=MANT+8))
do 
export MANT
scons equations=elastic element_type=tria3 precision=64 order=5 cfr=1 xsmm=libs hdf5=libs zlib=libs netcdf=libs moab=libs  
./build/edge --xml ghcan_2d_5000_elastic_500.xml  
mv ~/edge/ghcan_2d_elastic_recvs_5000_500/ ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/5000_elastic
mv ~/edge/ghcan_2d_elastic_wf_5000_500/ ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/5000_elastic
cd examples/bench/seismic/wp/ghcan_2d/runs
python vis.py
mkdir ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTRECV"
mv ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/5000_elastic/ghcan_2d_elastic_recvs_5000_500/ ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTRECV"
mkdir ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTVIS"
cp -r ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/vis/ ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTVIS"
mkdir ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTWF"
mv ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/5000_elastic/ghcan_2d_elastic_wf_5000_500/ ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTWF"
mkdir ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANT"
mv ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTWF"  ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANT"
mv ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTRECV"  ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANT"
mv ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTVIS"  ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANT"
cd 
cd edge
done

