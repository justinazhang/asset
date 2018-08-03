IMESH_CXXFLAGS =   -fprefetch-loop-arrays -finline-functions -march=native -ftree-vectorize -O2 -DNDEBUG 
IMESH_CFLAGS =   -fprefetch-loop-arrays -finline-functions -march=native -ftree-vectorize -O2 -DNDEBUG
IMESH_LDFLAGS =   -L/root/edge/netcdf/../libs/lib -L/root/edge/netcdf/../libs/lib -lnetcdf -lhdf5_hl -lhdf5 -ldl -lm -lz      -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib -all-static   -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib   -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib
IMESH_FC = mpiifort
IMESH_FCFLAGS =   -ffree-line-length-0 -finline-functions -ftree-vectorize
FC_DEFINE = 
IMESH_FCDEFS = TEMPLATE_SPECIALIZATION TEMPLATE_FUNC_SPECIALIZATION

IMESH_CPPFLAGS =  -I/root/edge/netcdf/../libs/include -I/root/edge/netcdf/../libs/include     -I/root/edge/submodules/moab/../../libs/include -isystem /root/edge/submodules/moab/../../libs/include -I/root/edge/submodules/moab/../../libs  -I$(IMESH_INCLUDEDIR) $(IMESH_INCLUDEDIR2)

# This definition is deprecated; use IMESH_CPPFLAGS instead
IMESH_INCLUDES = $(IMESH_CPPFLAGS)

IMESH_LIBS = $(IMESH_LDFLAGS) -L$(MOAB_LIBDIR) \
             -L$(IMESH_LIBDIR) -liMesh -lMOAB \
             -lnetcdf  -lhdf5_hl -lhdf5  -lz  -lz  -ldl -lm -lm -lm  -lhdf5  -lz  -lz  -ldl -lm -lm -lm  \
                   \
               -ldl -lm -lm -lm

IMESH_INCLUDEDIR = /root/edge/submodules/moab/itaps/imesh
IMESH_INCLUDEDIR2 = -I/root/edge/submodules/moab/itaps/imesh -I/root/edge/submodules/moab/itaps/imesh/.. -I/root/edge/submodules/moab/itaps/imesh/.. -I/root/edge/submodules/moab/src -I/root/edge/submodules/moab/itaps/imesh/../../src
IMESH_LIBDIR = /root/edge/submodules/moab/itaps/imesh/.libs
MOAB_LIBDIR = /root/edge/submodules/moab/src/.libs
IMESH_INCLUDEDIR=/root/edge/submodules/moab/../../libs/include
IMESH_INCLUDEDIR2=
IMESH_LIBDIR=/root/edge/submodules/moab/../../libs/lib
MOAB_LIBDIR=/root/edge/submodules/moab/../../libs/lib
