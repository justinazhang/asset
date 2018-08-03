#!/usr/bin/env python3
##
# @file This file is part of EDGE.
#
# @author Alexander Breuer (anbreuer AT ucsd.edu)#
# @section LICENSE
# Copyright (c) 2018, Regents of the University of California
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# @section DESCRIPTION
# Plots the results of Gaussian hill canyon benchmark.
##

import csv
import matplotlib.pyplot
from matplotlib.backends.backend_pdf import PdfPages


##
# Reads the given column from the file. Header columns are ignored.
#
# @param i_file file which is read.
# @param i_col column which is read (0 is first column).
##
def readCsv(i_file, i_col):
    # values
    l_vals = []

    # read file
    with open(i_file, 'r') as l_fi:
        # detect dialect
        l_sniff = csv.Sniffer().sniff(l_fi.read(), [',', ' ', '\t'])
        l_fi.seek(0)

        l_csv = csv.reader(l_fi, l_sniff, skipinitialspace=True)

        for l_ro in l_csv:
            if len(l_ro) > 0:
                # ignore comments
                if l_ro[0].lstrip()[0] == '#':
                    continue

                # ignore indices out of range and non-numbers
                try:
                    l_vals = l_vals + [float(l_ro[i_col])]
                except IndexError:
                    continue
                except ValueError:
                    continue

    return l_vals


l_volNames = ['sigma_xx', 'sigma_yy', 'sigma_xy', 'u', 'v']
l_res = ['500']
l_volRecvs = ['00_-05']
l_types = ['5000_elastic']
l_mant = ['1','7','9','11','13','15','64']
l_color = ['red', 'green', 'blue', 'yellow', 'magenta', 'pink', 'black', 'brown']
for l_ty in l_types:
    for l_vr in l_volRecvs:
        for l_qt in range(1, 6):
            # create a figure
            l_fig = matplotlib.pyplot.figure(figsize=(10, 21))

            l_outFile = 'vis/' + l_ty + '_' + l_vr + '_' + l_volNames[l_qt - 1] + '.pdf'
            l_pdf = PdfPages(l_outFile)

            for l_re in l_res:
                counter = 0;
                for l_ma in l_mant:
                    l_split = l_ty.split('_')
                    l_file = l_ma + 'MANT/' + l_ma + 'MANTRECV/' + 'ghcan_2d_' + l_split[1] + '_recvs_' + l_split[
                        0] + '_' + l_re + '/' + 'ghcan_2d_' + l_vr + '.csv'
                    l_time = readCsv(l_file, 0)
                    l_data = readCsv(l_file, l_qt)

                    matplotlib.pyplot.plot(l_time, l_data, label=l_ma, color=l_color[counter])
                    matplotlib.pyplot.legend()
                    counter = counter + 1;
                    matplotlib.pyplot.xlabel('time (s)')
                    matplotlib.pyplot.ylabel(l_volNames[l_qt - 1])

            # save figure
            l_pdf.savefig(l_fig, bbox_inches='tight')

            matplotlib.pyplot.close()

            # close pdf
            l_pdf.close()
