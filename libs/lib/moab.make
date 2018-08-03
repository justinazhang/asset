# The values below are for an un-installed copy of MOAB used directly
# from its build build directory.  These values will be overridden below
# for installed copies of MOAB.
MOAB_LIBDIR = /root/edge/submodules/moab/src/.libs
MOAB_INCLUDES = -I/root/edge/submodules/moab/src \
                -I/root/edge/submodules/moab/src \
                -I/root/edge/submodules/moab/src/oldinc \
                -I/root/edge/submodules/moab/src/verdict \
                -I/root/edge/submodules/moab/src/parallel \
                -I/root/edge/submodules/moab/src/parallel \
                -I/root/edge/submodules/moab/src/LocalDiscretization \
                -I/root/edge/submodules/moab/src/RefineMesh

MOAB_INCLUDES += 

MOAB_CPPFLAGS =  -I/root/edge/netcdf/../libs/include -I/root/edge/netcdf/../libs/include     -I/root/edge/submodules/moab/../../libs/include -isystem /root/edge/submodules/moab/../../libs/include -I/root/edge/submodules/moab/../../libs  
MOAB_CXXFLAGS =   -fprefetch-loop-arrays -finline-functions -march=native -ftree-vectorize -O2 -DNDEBUG 
MOAB_CFLAGS =   -fprefetch-loop-arrays -finline-functions -march=native -ftree-vectorize -O2 -DNDEBUG 
MOAB_FFLAGS =   -ffree-line-length-0 -finline-functions -ftree-vectorize
MOAB_FCFLAGS =   -ffree-line-length-0 -finline-functions -ftree-vectorize
MOAB_LDFLAGS =   -L/root/edge/netcdf/../libs/lib -L/root/edge/netcdf/../libs/lib -lnetcdf -lhdf5_hl -lhdf5 -ldl -lm -lz      -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib  -all-static   -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib   -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib

MOAB_LIBS_LINK = ${MOAB_LDFLAGS} -L${MOAB_LIBDIR} -lMOAB  -lnetcdf  -lhdf5_hl -lhdf5  -lz  -lz  -ldl -lm -lm -lm  -lhdf5  -lz  -lz  -ldl -lm -lm -lm       -ldl -lm -lm -lm
DAGMC_LIBS_LINK = ${MOAB_LDFLAGS} -L${MOAB_LIBDIR} -ldagmc -lMOAB  -lnetcdf  -lhdf5_hl -lhdf5  -lz  -lz  -ldl -lm -lm -lm  -lhdf5  -lz  -lz  -ldl -lm -lm -lm       -ldl -lm -lm -lm

MOAB_CXX = mpiCC
MOAB_CC  = mpicc
MOAB_FC  = mpiifort
MOAB_F77  = mpiifort

# Feature list
MOAB_MPI_ENABLED = yes
MOAB_FORTRAN_ENABLED = no
MOAB_HDF5_ENABLED = yes
MOAB_NETCDF_ENABLED = yes
MOAB_PNETCDF_ENABLED = no
MOAB_IGEOM_ENABLED = no
MOAB_IMESH_ENABLED = yes
MOAB_IREL_ENABLED = no

# Override MOAB_LIBDIR and MOAB_INCLUDES from above with the correct
# values for the installed MOAB.

MOAB_LIBDIR=/root/edge/submodules/moab/../../libs/lib
MOAB_INCLUDES=-I/root/edge/submodules/moab/../../libs/include
