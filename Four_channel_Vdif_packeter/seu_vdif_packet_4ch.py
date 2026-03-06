from .yellow_block import YellowBlock
from .yellow_block_typecodes import *
from memory import Register
from constraints import PortConstraint, ClockConstraint, ClockGroupConstraint, RawConstraint

class seu_vdif_packet_4ch(YellowBlock):
    def initialize(self):
        self.typecode = TYPECODE_SYSBLOCK
        self.add_source('seu_vdif_packet_4ch/*')
        self.memory_map = [
            Register('module_id',        		mode='r', 	offset=0x00),
            Register('ps_config_en_0',            	mode='rw',  	offset=0x04, default_val = 0),
            Register('ps_tx_en_0',            	mode='rw',  	offset=0x08, default_val = 0),
            Register('local_mac_h_0',      		mode='rw',  	offset=0x0C),
            Register('local_mac_l_0',        		mode='rw', 	offset=0x10),
            Register('local_ip_0',        		mode='rw', 	offset=0x14),
            Register('local_port_0',        		mode='rw', 	offset=0x18),
            Register('dest_mac_h_0',        		mode='rw', 	offset=0x1C),
            Register('dest_mac_l_0',        		mode='rw', 	offset=0x20),
            Register('dest_ip_0',        		mode='rw', 	offset=0x24),
            Register('dest_port_0',        		mode='rw', 	offset=0x28),
            Register('Vvdif_0',        		mode='rw', 	offset=0x2C),
            Register('Sid_0',        			mode='rw', 	offset=0x30),
            Register('Tid_0',        			mode='rw', 	offset=0x34),
            Register('RENS_0',        		mode='rw', 	offset=0x38),
            Register('REN_0',        			mode='rw', 	offset=0x3C),
            Register('RENS_valid_0',        		mode='rw', 	offset=0x40, default_val = 0),
            Register('ps_config_en_1',            	mode='rw',  	offset=0x44, default_val = 0),
            Register('ps_tx_en_1',            	mode='rw',  	offset=0x48, default_val = 0),
            Register('local_mac_h_1',      		mode='rw',  	offset=0x4C),
            Register('local_mac_l_1',        		mode='rw', 	offset=0x50),
            Register('local_ip_1',        		mode='rw', 	offset=0x54),
            Register('local_port_1',        		mode='rw', 	offset=0x58),
            Register('dest_mac_h_1',        		mode='rw', 	offset=0x5C),
            Register('dest_mac_l_1',        		mode='rw', 	offset=0x60),
            Register('dest_ip_1',        		mode='rw', 	offset=0x64),
            Register('dest_port_1',        		mode='rw', 	offset=0x68),
            Register('Vvdif_1',        		mode='rw', 	offset=0x6C),
            Register('Sid_1',        			mode='rw', 	offset=0x70),
            Register('Tid_1',        			mode='rw', 	offset=0x74),
            Register('RENS_1',        		mode='rw', 	offset=0x78),
            Register('REN_1',        			mode='rw', 	offset=0x7C),
            Register('RENS_valid_1',        		mode='rw', 	offset=0x80, default_val = 0),
            Register('ps_config_en_2',            	mode='rw',  	offset=0x84, default_val = 0),
            Register('ps_tx_en_2',            	mode='rw',  	offset=0x88, default_val = 0),
            Register('local_mac_h_2',      		mode='rw',  	offset=0x8C),
            Register('local_mac_l_2',        		mode='rw', 	offset=0x90),
            Register('local_ip_2',        		mode='rw', 	offset=0x94),
            Register('local_port_2',        		mode='rw', 	offset=0x98),
            Register('dest_mac_h_2',        		mode='rw', 	offset=0x9C),
            Register('dest_mac_l_2',        		mode='rw', 	offset=0xA0),
            Register('dest_ip_2',        		mode='rw', 	offset=0xA4),
            Register('dest_port_2',        		mode='rw', 	offset=0xA8),
            Register('Vvdif_2',        		mode='rw', 	offset=0xAC),
            Register('Sid_2',        			mode='rw', 	offset=0xB0),
            Register('Tid_2',        			mode='rw', 	offset=0xB4),
            Register('RENS_2',        		mode='rw', 	offset=0xB8),
            Register('REN_2',        			mode='rw', 	offset=0xBC),
            Register('RENS_valid_2',        		mode='rw', 	offset=0xC0, default_val = 0),
            Register('ps_config_en_3',            	mode='rw',  	offset=0xC4, default_val = 0),
            Register('ps_tx_en_3',            	mode='rw',  	offset=0xC8, default_val = 0),
            Register('local_mac_h_3',      		mode='rw',  	offset=0xCC),
            Register('local_mac_l_3',        		mode='rw', 	offset=0xD0),
            Register('local_ip_3',        		mode='rw', 	offset=0xD4),
            Register('local_port_3',        		mode='rw', 	offset=0xD8),
            Register('dest_mac_h_3',        		mode='rw', 	offset=0xDC),
            Register('dest_mac_l_3',        		mode='rw', 	offset=0xE0),
            Register('dest_ip_3',        		mode='rw', 	offset=0xE4),
            Register('dest_port_3',        		mode='rw', 	offset=0xE8),
            Register('Vvdif_3',        		mode='rw', 	offset=0xEC),
            Register('Sid_3',        			mode='rw', 	offset=0xF0),
            Register('Tid_3',        			mode='rw', 	offset=0xF4),
            Register('RENS_3',        		mode='rw', 	offset=0xF8),
            Register('REN_3',        			mode='rw', 	offset=0xFC),
            Register('RENS_valid_3',        		mode='rw', 	offset=0x100, default_val = 0),
        ]

    def modify_top(self,top):
        module = 'seu_vdif_packet_4ch'
        inst = top.get_instance(entity=module, name=self.fullname)
        
        top.add_axi4lite_interface(regname=self.unique_name, mode='rw', nbytes=65536,
                                        typecode=self.typecode, memory_map=self.memory_map)                                       
        # add ports
        # we need to check if the port is in parent_ports
        inst.add_port('pl_clk', self.fullname+'_pl_clk', parent_port=False, width=1, dir='in')
        inst.add_port('pl_rst', self.fullname+'_pl_rst', parent_port=False, width=1, dir='in')
        inst.add_port('pl_din_0', self.fullname+'_pl_din_0', parent_port=False, width=32, dir='in')
        inst.add_port('pl_din_1', self.fullname+'_pl_din_1', parent_port=False, width=32, dir='in')
        inst.add_port('pl_din_2', self.fullname+'_pl_din_2', parent_port=False, width=32, dir='in')
        inst.add_port('pl_din_3', self.fullname+'_pl_din_3', parent_port=False, width=32, dir='in')
        inst.add_port('clk_10M', self.fullname+'_clk_10M', parent_port=False, width=1, dir='in')
        inst.add_port('PPS_rst', self.fullname+'_PPS_rst', parent_port=False, width=1, dir='in')
        inst.add_port('Ethernet_clk', self.fullname+'_Ethernet_clk', parent_port=False, width=1, dir='in')
        inst.add_port('Ethernet_rst', self.fullname+'_Ethernet_rst', parent_port=False, width=1, dir='in')
        
        inst.add_port('xgmii_txd', self.fullname+'_xgmii_txd', parent_port=False, width=64, dir='out')
        inst.add_port('xgmii_txc', self.fullname+'_xgmii_txc', parent_port=False, width=8, dir='out')
        
        for reg in self.memory_map: 
            if 'w' in reg.mode:
                inst.add_port(reg.name, self.unique_name+'_'+reg.name+'_out', width=32)
                inst.add_port(reg.name+'_we', self.unique_name+'_'+reg.name+'_out_we', width=1)
            else:
                inst.add_port(reg.name, self.unique_name+'_'+reg.name+'_in', width=32)
                top.assign_signal(self.unique_name+'_'+reg.name+'_in_we', "1'b1")
    def gen_constraints(self):
        consts = []

        consts += [ClockGroupConstraint('-of [get_nets -of [get_pins %s/seu_vdif_packet_i_0/packet_fifo_i/rd_clk]]' % (self.fullname), '-of [get_nets -of [get_pins %s/seu_vdif_packet_i_0/packet_fifo_i/wr_clk]]' % (self.fullname), 'asynchronous')]
        consts += [ClockGroupConstraint('-of [get_nets sys_clk]', '-of [get_nets -of [get_pins %s/seu_vdif_packet_i_0/packet_fifo_i/wr_clk]]' % (self.fullname), 'asynchronous')]
        consts += [ClockGroupConstraint('-of [get_nets user_clk]', '-of [get_nets -of [get_pins %s/seu_vdif_packet_i_0/packet_fifo_i/wr_clk]]' % (self.fullname), 'asynchronous')]
        consts += [ClockGroupConstraint('-of [get_pins %s/%s]' % (self.fullname, self.fullname+'_clk_10M'), '-of [get_nets -of [get_pins %s/seu_vdif_packet_i_0/packet_fifo_i/wr_clk]]' % (self.fullname), 'asynchronous')]
        consts += [ClockGroupConstraint('-of [get_pins %s/%s]' % (self.fullname, self.fullname+'_clk_10M'), '-of [get_nets user_clk]', 'asynchronous')]
        return consts

