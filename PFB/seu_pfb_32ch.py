import sys
from .dsp_block import DSPBlock
from verilog import VerilogModule
import os

class seu_pfb_32ch(DSPBlock):
    def initialize(self):
        self.add_source('seu_pfb_32ch/*')

    def modify_top(self,top):
        self._populate_parent_ports(top)
        module = 'seu_pfb_32ch'
        inst = top.get_instance(entity=module, name=self.fullname)

        inst.add_port('clk_adc', self.fullname+'_clk_adc', parent_port=False, width=1, dir='in')
        inst.add_port('rst', self.fullname+'_rst', parent_port=False, width=1, dir='in')
        inst.add_port('data_adc', self.fullname+'_data_adc', parent_port=False, width=128, dir='in')
        inst.add_port('gain_in', self.fullname+'_gain_in', parent_port=False, width=8, dir='in')

        inst.add_port('clk_out', self.fullname+'_clk_out', parent_port=False, width=1, dir='out')
        inst.add_port('clk_10M', self.fullname+'_clk_10M', parent_port=False, width=1, dir='out')
        inst.add_port('max_out', self.fullname+'_max_out', parent_port=False, width=38, dir='out')
        inst.add_port('Dout_00', self.fullname+'_Dout_00', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_01', self.fullname+'_Dout_01', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_02', self.fullname+'_Dout_02', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_03', self.fullname+'_Dout_03', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_04', self.fullname+'_Dout_04', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_05', self.fullname+'_Dout_05', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_06', self.fullname+'_Dout_06', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_07', self.fullname+'_Dout_07', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_08', self.fullname+'_Dout_08', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_09', self.fullname+'_Dout_09', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_10', self.fullname+'_Dout_10', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_11', self.fullname+'_Dout_11', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_12', self.fullname+'_Dout_12', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_13', self.fullname+'_Dout_13', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_14', self.fullname+'_Dout_14', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_15', self.fullname+'_Dout_15', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_16', self.fullname+'_Dout_16', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_17', self.fullname+'_Dout_17', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_18', self.fullname+'_Dout_18', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_19', self.fullname+'_Dout_19', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_20', self.fullname+'_Dout_20', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_21', self.fullname+'_Dout_21', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_22', self.fullname+'_Dout_22', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_23', self.fullname+'_Dout_23', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_24', self.fullname+'_Dout_24', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_25', self.fullname+'_Dout_25', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_26', self.fullname+'_Dout_26', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_27', self.fullname+'_Dout_27', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_28', self.fullname+'_Dout_28', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_29', self.fullname+'_Dout_29', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_30', self.fullname+'_Dout_30', parent_port=False, width=32, dir='out')
        inst.add_port('Dout_31', self.fullname+'_Dout_31', parent_port=False, width=32, dir='out')

    def gen_tcl_cmds(self):
        tcl_cmds = {}
        env_var = os.getenv('MLIB_DEVEL_PATH', 'not set')
        file_path = '%s/scilab_library/hdl_sources/seu_pfb_32ch/fir_block.tcl' % env_var  
        new_first_line = '  set fircoe_source %s/scilab_library/hdl_sources/seu_pfb_32ch/FIRS\n' % env_var  
        with open(file_path, "r", encoding="utf-8") as f:
            lines = f.readlines()  
        lines[259] = new_first_line  
        with open(file_path, "w", encoding="utf-8") as f:
            f.writelines(lines)
        tcl_cmds['pre_synth'] = ['source %s/scilab_library/hdl_sources/seu_pfb_32ch/fir_block.tcl' % env_var]
        return tcl_cmds

