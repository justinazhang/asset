# Sources for the gaussian hill canyon benchmark
This directory contains the high-level source description and generated point source, as a sampled finite fault.
Used version of EDGE for the script and CDL-template:
```
commit 1b55b2c1144b71423da48c0fb3cfd0deeaf72246
Author: Alexander Nikolas Breuer <anbreuer@ucsd.edu>
Date:   Mon Jun 11 20:05:43 2018 -0700

    Reduced number of file accesses in receiver output.
    Increased default buffer size in receiver output.
```
Source generation:
```
python /tmp/edge/tools/processing/kinematic_bench.py --xml ricker_acoustic.xml 2>&1 | tee ricker_acoustic.log
python /tmp/edge/tools/processing/kinematic_bench.py --xml ricker_elastic.xml  2>&1 | tee ricker_elastic.log
```
