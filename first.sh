#!/bin/bash
set -e
CXX=mpiCC scons equations=elastic element_type=tria3 precision=64 parallel=mpi order=5 cfr=1 xsmm=libs hdf5=libs zlib=libs netcdf=libs moab=libs
for ((MANT=37;MANT<=40;MANT++))
do 
export MANT  
./build/edge --xml ghcan_2d_5000_elastic_500.xml  
mv ~/edge/ghcan_2d_elastic_recvs_5000_500/ ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/5000_elastic
mkdir ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTRECV"
mv ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/5000_elastic/ghcan_2d_elastic_recvs_5000_500/ ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTRECV"
mkdir ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANT"
mv ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANTRECV"  ~/edge/examples/bench/seismic/wp/ghcan_2d/runs/$MANT"MANT"

cd 
cd edge
done

