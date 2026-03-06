function [x, y, typ]= seu_vdif_packet_4ch(job, arg1, arg2)
    x=[];y=[];typ=[];
    blkname = 'seu_vdif_packet_4ch';
    select job
      case 'set' then
        x=arg1;
        graphics = arg1.graphics;
        exprs = graphics.exprs;
        model = arg1.model;
        txt = 'Block Name (any string)';
        [ok, blkname, exprs] = scicos_getvalue("Set seu_vdif_packet_4ch parameters",...
                          txt,...
                          list("str", 1),...
                          exprs);
        if ok then
            graphics.in_label = ['pl_clk', 'pl_rst', 'pl_din_0', 'pl_din_1', 'pl_din_2', 'pl_din_3','clk_10M', 'PPS_rst', 'Ethernet_clk', 'Ethernet_rst'];
            graphics.out_label = ['xgmii_txd', 'xgmii_txc'];
            graphics.style = 'shape=rectangle;fillColor=yellow';
            graphics.exprs = exprs;
            x.graphics = graphics;
            model.in = [1 2 3 4 5 6 7 8 9 10];
            model.in2 = [1, 1, 32, 32, 32, 32, 1, 1, 1, 1];
            model.out = [1 2];
            model.out2 = [64, 8];
            x.model = model;
        end
      case 'define' then
        model = scicos_model();
        model.sim = list('seu_vdif_packet_4ch',4);
        model.blocktype = 'c';
        // Type : column vector of real numbers.
        model.rpar = 0;
        model.in = [1 2 3 4 5 6 7 8 9 10];
        model.in2 = [1, 1, 32, 32, 32, 32, 1, 1, 1, 1];
        model.out = [1 2];
        model.out2 = [64, 8];
        // Type : column vector of strings.
        exprs = 'seu_vdif_packet_4ch';
        gr_i = [];
        // we use model.label as the block tag.
        // the best place to set the tag should be graphics.gr_i/id.
        // However, I can't set graphics.gr_i/id...not sure why.
        // I tracked the code of standard_define until sciscicos_new().
        // Everything looks good, but gr_i/id is not set successfully.
        // scicos_new() looks implemented in c++, so I stopped tracking it.
        // TODO: track the source code of scicos_new() in c++.
        model.label = "xps";
        x=standard_define([10 7],model,exprs,gr_i)
        x.graphics.out_label = ['xgmii_txd', 'xgmii_txc'];
        x.graphics.in_label = ['pl_clk', 'pl_rst', 'pl_din_0', 'pl_din_1', 'pl_din_2', 'pl_din_3','clk_10M', 'PPS_rst', 'Ethernet_clk', 'Ethernet_rst'];
        x.graphics.style = 'shape=rectangle;fillColor=yellow';
        debug_info('seu_vdif_packet_4ch loaded...')
    end
  endfunction
  
  
  
