#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Top Block
# GNU Radio version: 3.7.13.5
##################################################

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print "Warning: failed to XInitThreads()"

from gnuradio import analog
from gnuradio import blocks
from gnuradio import digital
from gnuradio import eng_notation
from gnuradio import filter
from gnuradio import gr
from gnuradio import wxgui
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from gnuradio.filter import pfb
from gnuradio.wxgui import constsink_gl
from grc_gnuradio import wxgui as grc_wxgui
from math import pi
from optparse import OptionParser
import pmt
import wx


class top_block(grc_wxgui.top_block_gui):

    def __init__(self):
        grc_wxgui.top_block_gui.__init__(self, title="Top Block")
        _icon_path = "C:\Program Files\GNURadio-3.7\share\icons\hicolor\scalable/apps\gnuradio-grc.png"
        self.SetIcon(wx.Icon(_icon_path, wx.BITMAP_TYPE_ANY))

        ##################################################
        # Variables
        ##################################################
        self.sps = sps = 3
        self.nfilts = nfilts = 32
        self.ntaps = ntaps = 11*nfilts*sps
        self.excess_bw = excess_bw = 0.4
        self.tx_taps = tx_taps = firdes.root_raised_cosine(nfilts, nfilts, 1.0, excess_bw, ntaps)
        self.timing_bw = timing_bw = 2*pi/100
        self.samp_rate_0 = samp_rate_0 = 20000*sps
        self.samp_rate = samp_rate = 20000
        self.rx_taps = rx_taps = firdes.root_raised_cosine(nfilts, nfilts, 1.0, excess_bw, ntaps)
        self.freq_bw = freq_bw = 2*pi/100
        self.fll_ntaps = fll_ntaps = 55
        self.const_points = const_points = 4

        ##################################################
        # Blocks
        ##################################################
        self.wxgui_constellationsink2_0 = constsink_gl.const_sink_c(
        	self.GetWin(),
        	title='Constellation Plot',
        	sample_rate=samp_rate,
        	frame_rate=5,
        	const_size=2048,
        	M=4,
        	theta=0,
        	loop_bw=6.28/100.0,
        	fmax=0.06,
        	mu=0.5,
        	gain_mu=0.005,
        	symbol_rate=samp_rate/4.,
        	omega_limit=0.005,
        )
        self.Add(self.wxgui_constellationsink2_0.win)
        self.rational_resampler_xxx_0_0 = filter.rational_resampler_ccf(
                interpolation=3,
                decimation=25,
                taps=None,
                fractional_bw=None,
        )
        self.rational_resampler_xxx_0 = filter.rational_resampler_ccc(
                interpolation=25,
                decimation=3,
                taps=None,
                fractional_bw=None,
        )
        self.pfb_arb_resampler_xxx_0 = pfb.arb_resampler_ccf(
        	  sps,
                  taps=(tx_taps),
        	  flt_size=32)
        self.pfb_arb_resampler_xxx_0.declare_sample_delay(0)

        self.low_pass_filter_0_0 = filter.fir_filter_fff(1, firdes.low_pass(
        	1, 500e3, 50e3, 10e3, firdes.WIN_HAMMING, 6.76))
        self.low_pass_filter_0 = filter.fir_filter_fff(1, firdes.low_pass(
        	1, 500e3, 50e3, 10e3, firdes.WIN_HAMMING, 6.76))
        self.digital_pfb_clock_sync_xxx_0 = digital.pfb_clock_sync_ccf(sps, timing_bw, (rx_taps), nfilts, 16, 1.5, 1)
        self.digital_chunks_to_symbols_xx_0 = digital.chunks_to_symbols_bc(((-1,1)), 1)
        self.blocks_unpack_k_bits_bb_0 = blocks.unpack_k_bits_bb(8)
        self.blocks_throttle_0_0 = blocks.throttle(gr.sizeof_gr_complex*1, 20e3,True)
        self.blocks_threshold_ff_0 = blocks.threshold_ff(-0.001, 0.001, 0)
        self.blocks_skiphead_0 = blocks.skiphead(gr.sizeof_char*1, 7)
        self.blocks_pack_k_bits_bb_0 = blocks.pack_k_bits_bb(8)
        self.blocks_multiply_xx_0_1 = blocks.multiply_vff(1)
        self.blocks_multiply_xx_0_0 = blocks.multiply_vff(1)
        self.blocks_multiply_xx_0 = blocks.multiply_vcc(1)
        self.blocks_float_to_uchar_0 = blocks.float_to_uchar()
        self.blocks_float_to_complex_0 = blocks.float_to_complex(1)
        self.blocks_file_source_0 = blocks.file_source(gr.sizeof_char*1, 'D:\\Iitb\\Sem6\\communications lab\\lab8\\Original_Text.txt', False)
        self.blocks_file_source_0.set_begin_tag(pmt.PMT_NIL)
        self.blocks_file_sink_0 = blocks.file_sink(gr.sizeof_char*1, 'D:\\Iitb\\Sem6\\communications lab\\lab8\\op_8_1.txt', False)
        self.blocks_file_sink_0.set_unbuffered(False)
        self.blocks_complex_to_real_0_0 = blocks.complex_to_real(1)
        self.blocks_complex_to_real_0 = blocks.complex_to_real(1)
        self.analog_sig_source_x_0_1 = analog.sig_source_f(500e3, analog.GR_COS_WAVE, 100e3, 1, 0)
        self.analog_sig_source_x_0_0 = analog.sig_source_f(500e3, analog.GR_SIN_WAVE, 100e3, -1, 0)
        self.analog_sig_source_x_0 = analog.sig_source_c(500e3, analog.GR_COS_WAVE, 100e3, 1, 0)



        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_sig_source_x_0, 0), (self.blocks_multiply_xx_0, 1))
        self.connect((self.analog_sig_source_x_0_0, 0), (self.blocks_multiply_xx_0_0, 1))
        self.connect((self.analog_sig_source_x_0_1, 0), (self.blocks_multiply_xx_0_1, 0))
        self.connect((self.blocks_complex_to_real_0, 0), (self.blocks_multiply_xx_0_0, 0))
        self.connect((self.blocks_complex_to_real_0, 0), (self.blocks_multiply_xx_0_1, 1))
        self.connect((self.blocks_complex_to_real_0_0, 0), (self.blocks_threshold_ff_0, 0))
        self.connect((self.blocks_file_source_0, 0), (self.blocks_unpack_k_bits_bb_0, 0))
        self.connect((self.blocks_float_to_complex_0, 0), (self.rational_resampler_xxx_0_0, 0))
        self.connect((self.blocks_float_to_uchar_0, 0), (self.blocks_skiphead_0, 0))
        self.connect((self.blocks_multiply_xx_0, 0), (self.blocks_complex_to_real_0, 0))
        self.connect((self.blocks_multiply_xx_0_0, 0), (self.low_pass_filter_0_0, 0))
        self.connect((self.blocks_multiply_xx_0_1, 0), (self.low_pass_filter_0, 0))
        self.connect((self.blocks_pack_k_bits_bb_0, 0), (self.blocks_file_sink_0, 0))
        self.connect((self.blocks_skiphead_0, 0), (self.blocks_pack_k_bits_bb_0, 0))
        self.connect((self.blocks_threshold_ff_0, 0), (self.blocks_float_to_uchar_0, 0))
        self.connect((self.blocks_throttle_0_0, 0), (self.blocks_complex_to_real_0_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0, 0), (self.digital_chunks_to_symbols_xx_0, 0))
        self.connect((self.digital_chunks_to_symbols_xx_0, 0), (self.pfb_arb_resampler_xxx_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0, 0), (self.blocks_throttle_0_0, 0))
        self.connect((self.low_pass_filter_0, 0), (self.blocks_float_to_complex_0, 0))
        self.connect((self.low_pass_filter_0_0, 0), (self.blocks_float_to_complex_0, 1))
        self.connect((self.pfb_arb_resampler_xxx_0, 0), (self.rational_resampler_xxx_0, 0))
        self.connect((self.rational_resampler_xxx_0, 0), (self.blocks_multiply_xx_0, 0))
        self.connect((self.rational_resampler_xxx_0, 0), (self.wxgui_constellationsink2_0, 0))
        self.connect((self.rational_resampler_xxx_0_0, 0), (self.digital_pfb_clock_sync_xxx_0, 0))

    def get_sps(self):
        return self.sps

    def set_sps(self, sps):
        self.sps = sps
        self.set_samp_rate_0(20000*self.sps)
        self.pfb_arb_resampler_xxx_0.set_rate(self.sps)
        self.set_ntaps(11*self.nfilts*self.sps)

    def get_nfilts(self):
        return self.nfilts

    def set_nfilts(self, nfilts):
        self.nfilts = nfilts
        self.set_tx_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0, self.excess_bw, self.ntaps))
        self.set_rx_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0, self.excess_bw, self.ntaps))
        self.set_ntaps(11*self.nfilts*self.sps)

    def get_ntaps(self):
        return self.ntaps

    def set_ntaps(self, ntaps):
        self.ntaps = ntaps
        self.set_tx_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0, self.excess_bw, self.ntaps))
        self.set_rx_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0, self.excess_bw, self.ntaps))

    def get_excess_bw(self):
        return self.excess_bw

    def set_excess_bw(self, excess_bw):
        self.excess_bw = excess_bw
        self.set_tx_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0, self.excess_bw, self.ntaps))
        self.set_rx_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0, self.excess_bw, self.ntaps))

    def get_tx_taps(self):
        return self.tx_taps

    def set_tx_taps(self, tx_taps):
        self.tx_taps = tx_taps
        self.pfb_arb_resampler_xxx_0.set_taps((self.tx_taps))

    def get_timing_bw(self):
        return self.timing_bw

    def set_timing_bw(self, timing_bw):
        self.timing_bw = timing_bw
        self.digital_pfb_clock_sync_xxx_0.set_loop_bandwidth(self.timing_bw)

    def get_samp_rate_0(self):
        return self.samp_rate_0

    def set_samp_rate_0(self, samp_rate_0):
        self.samp_rate_0 = samp_rate_0

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.wxgui_constellationsink2_0.set_sample_rate(self.samp_rate)

    def get_rx_taps(self):
        return self.rx_taps

    def set_rx_taps(self, rx_taps):
        self.rx_taps = rx_taps
        self.digital_pfb_clock_sync_xxx_0.update_taps((self.rx_taps))

    def get_freq_bw(self):
        return self.freq_bw

    def set_freq_bw(self, freq_bw):
        self.freq_bw = freq_bw

    def get_fll_ntaps(self):
        return self.fll_ntaps

    def set_fll_ntaps(self, fll_ntaps):
        self.fll_ntaps = fll_ntaps

    def get_const_points(self):
        return self.const_points

    def set_const_points(self, const_points):
        self.const_points = const_points


def main(top_block_cls=top_block, options=None):

    tb = top_block_cls()
    tb.Start(True)
    tb.Wait()


if __name__ == '__main__':
    main()
