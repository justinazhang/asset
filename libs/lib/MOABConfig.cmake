# Config file for MOAB; use the CMake find_package() function to pull this into
# your own CMakeLists.txt file.
#
# This file defines the following variables:
# MOAB_FOUND        - boolean indicating that MOAB is found
# MOAB_INCLUDE_DIRS - include directories from which to pick up MOAB includes
# MOAB_LIBRARIES    - libraries need to link to MOAB; use this in target_link_libraries for MOAB-dependent targets
# MOAB_CXX, MOAB_CC, MOAB_F77, MOAB_FC - compilers used to compile MOAB
# MOAB_CXXFLAGS, MOAB_CCFLAGS, MOAB_FFLAGS, MOAB_FCFLAGS - compiler flags used to compile MOAB; possibly need to use these in add_definitions or CMAKE_<LANG>_FLAGS_<MODE> 

SET(MOAB_FOUND 1)

# Compilers used by MOAB

SET(MOAB_CXX "mpiCC")
SET(MOAB_CC "mpicc")
SET(MOAB_F77 "mpiifort")
SET(MOAB_FC "mpiifort")


# Compiler flags used by MOAB

SET(MOAB_CXXFLAGS "  -fprefetch-loop-arrays -finline-functions -march=native -ftree-vectorize -O2 -DNDEBUG @AM_CXXFLAGS@")
SET(MOAB_CFLAGS "  -fprefetch-loop-arrays -finline-functions -march=native -ftree-vectorize -O2 -DNDEBUG @AM_CFLAGS@")
SET(MOAB_FORTRAN_FLAGS "  -ffree-line-length-0 -finline-functions -ftree-vectorize @AM_FFLAGS@")

# Library and include defs
set(MOAB_INCLUDE_DIRS, "/root/edge/submodules/moab/../../libs/include")
set(MOAB_LIBRARY_DIRS, "/root/edge/submodules/moab/../../libs/lib")
SET(MOAB_INCLUDE_DIRS "/root/edge/submodules/moab/../../libs/include")
SET(MOAB_LIBRARIES "  -L/root/edge/netcdf/../libs/lib -L/root/edge/netcdf/../libs/lib -lnetcdf -lhdf5_hl -lhdf5 -ldl -lm -lz      -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib -lMOAB  -lnetcdf  -lhdf5_hl -lhdf5  -lz  -lz  -ldl -lm -lm -lm  -lhdf5  -lz  -lz  -ldl -lm -lm -lm     -ldl -lm -lm -lm")
SET(DAGMC_LIBRARIES "  -L/root/edge/netcdf/../libs/lib -L/root/edge/netcdf/../libs/lib -lnetcdf -lhdf5_hl -lhdf5 -ldl -lm -lz      -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib  -L/root/edge/submodules/moab/../../libs/lib -ldagmc -lMOAB  -lnetcdf  -lhdf5_hl -lhdf5  -lz  -lz  -ldl -lm -lm -lm  -lhdf5  -lz  -lz  -ldl -lm -lm -lm     -ldl -lm -lm -lm")
