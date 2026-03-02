from .yellow_block import YellowBlock
from .yellow_block_typecodes import *
from constraints import PortConstraint, ClockConstraint
from memory import Register

class Ethernet_25G(YellowBlock):
    def initialize(self):
        self.add_source('Ethernet_25G/*')

    def modify_top(self,top):
        module = 'Ethernet_25G'
        inst = top.get_instance(entity=module, name=self.fullname)

        inst.add_port('sys_reset', self.fullname+'_sys_reset', parent_port=False, width=1, dir='in')
        inst.add_port('dclk', self.fullname+'_dclk', parent_port=False, width=1, dir='in')
        inst.add_port('eth_d_0', self.fullname+'_eth_d_0', parent_port=False, width=64, dir='in')
        inst.add_port('eth_c_0', self.fullname+'_eth_c_0', parent_port=False, width=8, dir='in')
        inst.add_port('eth_d_1', self.fullname+'_eth_d_1', parent_port=False, width=64, dir='in')
        inst.add_port('eth_c_1', self.fullname+'_eth_c_1', parent_port=False, width=8, dir='in')
        inst.add_port('eth_d_2', self.fullname+'_eth_d_2', parent_port=False, width=64, dir='in')
        inst.add_port('eth_c_2', self.fullname+'_eth_c_2', parent_port=False, width=8, dir='in')
        inst.add_port('eth_d_3', self.fullname+'_eth_d_3', parent_port=False, width=64, dir='in')
        inst.add_port('eth_c_3', self.fullname+'_eth_c_3', parent_port=False, width=8, dir='in')
        
        inst.add_port('eth_clk_0', self.fullname+'_eth_clk_0', parent_port=False, width=1, dir='out')
        inst.add_port('eth_clk_1', self.fullname+'_eth_clk_1', parent_port=False, width=1, dir='out')
        inst.add_port('eth_clk_2', self.fullname+'_eth_clk_2', parent_port=False, width=1, dir='out')
        inst.add_port('eth_clk_3', self.fullname+'_eth_clk_3', parent_port=False, width=1, dir='out')
        inst.add_port('eth_reset_0', self.fullname+'_eth_reset_0', parent_port=False, width=1, dir='out')
        inst.add_port('eth_reset_1', self.fullname+'_eth_reset_1', parent_port=False, width=1, dir='out')
        inst.add_port('eth_reset_2', self.fullname+'_eth_reset_2', parent_port=False, width=1, dir='out')
        inst.add_port('eth_reset_3', self.fullname+'_eth_reset_3', parent_port=False, width=1, dir='out')
        inst.add_port('gt_refclk_out', self.fullname+'_gt_refclk_out', parent_port=False, width=1, dir='out')
        
        inst.add_port('gt_rxp_in_0', self.fullname+'_gt_rxp_in_0', dir='in', width=1, parent_port=True)
        inst.add_port('gt_rxp_in_1', self.fullname+'_gt_rxp_in_1', dir='in', width=1, parent_port=True)
        inst.add_port('gt_rxp_in_2', self.fullname+'_gt_rxp_in_2', dir='in', width=1, parent_port=True)
        inst.add_port('gt_rxp_in_3', self.fullname+'_gt_rxp_in_3', dir='in', width=1, parent_port=True)
        inst.add_port('gt_rxn_in_0', self.fullname+'_gt_rxn_in_0', dir='in', width=1, parent_port=True)
        inst.add_port('gt_rxn_in_1', self.fullname+'_gt_rxn_in_1', dir='in', width=1, parent_port=True)
        inst.add_port('gt_rxn_in_2', self.fullname+'_gt_rxn_in_2', dir='in', width=1, parent_port=True)
        inst.add_port('gt_rxn_in_3', self.fullname+'_gt_rxn_in_3', dir='in', width=1, parent_port=True)
        
        inst.add_port('gt_txp_out_0', self.fullname+'_gt_txp_out_0', dir='out', width=1, parent_port=True)
        inst.add_port('gt_txp_out_1', self.fullname+'_gt_txp_out_1', dir='out', width=1, parent_port=True)
        inst.add_port('gt_txp_out_2', self.fullname+'_gt_txp_out_2', dir='out', width=1, parent_port=True)
        inst.add_port('gt_txp_out_3', self.fullname+'_gt_txp_out_3', dir='out', width=1, parent_port=True)
        inst.add_port('gt_txn_out_0', self.fullname+'_gt_txn_out_0', dir='out', width=1, parent_port=True)
        inst.add_port('gt_txn_out_1', self.fullname+'_gt_txn_out_1', dir='out', width=1, parent_port=True)
        inst.add_port('gt_txn_out_2', self.fullname+'_gt_txn_out_2', dir='out', width=1, parent_port=True)
        inst.add_port('gt_txn_out_3', self.fullname+'_gt_txn_out_3', dir='out', width=1, parent_port=True)
        
        inst.add_port('gt_refclk_p', self.fullname+'_gt_refclk_p', dir='in', width=1, parent_port=True)
        inst.add_port('gt_refclk_n', self.fullname+'_gt_refclk_n', dir='in', width=1, parent_port=True)
        
    def gen_constraints(self):
        consts = []

        consts += [ClockConstraint(self.fullname+'_gt_refclk_p', self.fullname+'_gt_refclk_p', period=6.4)]
        consts += [PortConstraint(self.fullname+'_gt_refclk_p', 'Ethernet_25G_ref_clk_p')]
        consts += [PortConstraint(self.fullname+'_gt_refclk_n', 'Ethernet_25G_ref_clk_n')]

        return consts


