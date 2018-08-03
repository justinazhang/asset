# Runs of the Gaussian Hill-Canyon Benchmark

## Version
```
commit 1b55b2c1144b71423da48c0fb3cfd0deeaf72246
Author: Alexander Nikolas Breuer <anbreuer@ucsd.edu>
Date:   Mon Jun 11 20:05:43 2018 -0700

    Reduced number of file accesses in receiver output.
    Increased default buffer size in receiver output.
```

## Installation: Dependencies
```
cd submodules/libxsmm; PREFIX=../../libs make BLAS=0 CC=cc CXX=CC install -j 16
cd ../..

wget http://zlib.net/zlib-1.2.11.tar.gz -O zlib.tar.gz
mkdir zlib; tar -xzf zlib.tar.gz -C zlib --strip-components=1
cd zlib; CXX=CC CC=cc ./configure --static --prefix=$(pwd)/../libs
make -j 16
make install
cd ..

wget https://www.hdfgroup.org/package/gzip/?wpdmdl=4301 -O hdf5.tar.gz
mkdir hdf5; tar -xzf hdf5.tar.gz -C hdf5 --strip-components=1
cd hdf5; CXX=CC CC=cc ZLIBDIR=$(pwd)/../libs ./configure --enable-shared=no --with-zlib=${ZLIBDIR} --enable-parallel --prefix=$(pwd)/../libs
make -j 16
make install
cd ..

wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz -O netcdf.tar.gz
mkdir netcdf; tar -xzf netcdf.tar.gz -C netcdf --strip-components=1
cd netcdf; CC=cc CXX=CC HDF5DIR=$(pwd)/../libs CPPFLAGS=-I${HDF5DIR}/include LDFLAGS=-L${HDF5DIR}/lib ./configure --enable-shared=no --disable-dap --prefix=$(pwd)/../libs
make -j 16
make install
cd ..

wget https://github.com/Reference-LAPACK/lapack-release/archive/lapack-3.8.0.zip -O lapack.zip
unzip -a lapack.zip
mv lapack-release-lapack-3.8.0 lapack
mkdir lapack/build; cd lapack/build; F77=ftn F90=ftn FC=ftn CC=cc CXX=CC cmake -DCMAKE_INSTALL_PREFIX:PATH=$(pwd)/../../libs ..; make install
ln -s $(pwd)/../../libs/lib64/lib*.a $(pwd)/../../libs/
cd ../..

cd submodules/moab; autoreconf -fi
F77=ftn F90=ftn FC=ftn CC=cc CXX=CC ./configure --disable-debug --enable-optimize --with-mpi --enable-shared=no --enable-static=yes --disable-fortran --enable-tools --with-blas=$(pwd)/../../libs/lib64/libblas.a --with-lapack=$(pwd)/../../libs/lib/liblapack.a --with-hdf5=$(pwd)/../../libs --with-netcdf=$(pwd)/../../libs --with-pnetcdf=no --with-metis=yes --download-metis --prefix=$(pwd)/../../libs
make -j 16
make install
cd ../..
```

## Installation: EDGE
```
module load scons
CRAYPE_LINK_TYPE=dynamic CXX=CC scons equations=elastic order=5 cfr=1 element_type=tria3 precision=32 parallel=mpi+omp xsmm=$(pwd)/libs zlib=$(pwd)/libs hdf5=$(pwd)/libs netcdf=$(pwd)/libs moab=$(pwd)/libs -j 3
```

## Directory Setup
```
bash setup.sh 2>&1 | tee setup.sh.log
```

## Runs and Compression
```
edge_flow.py -x flow_sim.xml 2>&1 | tee flow_sim.log
./vis.py
bash compress.sh 2>&1 | tee compress.sh.log
```
