function [x, y, typ]= seu_eth_25g(job, arg1, arg2)
    x=[];y=[];typ=[];
    blkname = 'seu_eth_25g';
    select job
      case 'set' then
        x=arg1;
        graphics = arg1.graphics;
        exprs = graphics.exprs;
        model = arg1.model;
        txt = 'Block Name (any string)';
        [ok, blkname, exprs] = scicos_getvalue("Set seu_eth_25g parameters",...
                          txt,...
                          list("str", 1),...
                          exprs);
        if ok then
            graphics.in_label = ['sys_reset', 'dclk', 'eth_d_0', 'eth_c_0', 'eth_d_1', 'eth_c_1', 'eth_d_2', 'eth_c_2', 'eth_d_3', 'eth_c_3'];
            graphics.out_label = ['eth_clk_0', 'eth_clk_1', 'eth_clk_2', 'eth_clk_3', 'eth_reset_0', 'eth_reset_1', 'eth_reset_2', 'eth_reset_3', 'gt_refclk_out'];
            graphics.style = 'shape=rectangle;fillColor=yellow';
            graphics.exprs = exprs;
            x.graphics = graphics;
            model.in = [1 2 3 4 5 6 7 8 9 10];
            model.in2 = [1, 1, 64, 8, 64, 8, 64, 8, 64, 8];
            model.out = [1 2 3 4 5 6 7 8 9];
            model.out2 = [1, 1, 1, 1, 1, 1, 1, 1, 1];
            x.model = model;
        end
      case 'define' then
        model = scicos_model();
        model.sim = list('seu_eth_25g',4);
        model.blocktype = 'c';
        // Type : column vector of real numbers.
        model.rpar = 0;
        model.in = [1 2 3 4 5 6 7 8 9 10];
        model.in2 = [1, 1, 64, 8, 64, 8, 64, 8, 64, 8];
        model.out = [1 2 3 4 5 6 7 8 9];
        model.out2 = [1, 1, 1, 1, 1, 1, 1, 1, 1];
        // Type : column vector of strings.
        exprs = 'seu_eth_25g';
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
        x.graphics.out_label = ['eth_clk_0', 'eth_clk_1', 'eth_clk_2', 'eth_clk_3', 'eth_reset_0', 'eth_reset_1', 'eth_reset_2', 'eth_reset_3', 'gt_refclk_out'];
        x.graphics.in_label = ['sys_reset', 'dclk', 'eth_d_0', 'eth_c_0', 'eth_d_1', 'eth_c_1', 'eth_d_2', 'eth_c_2', 'eth_d_3', 'eth_c_3'];
        x.graphics.style = 'shape=rectangle;fillColor=yellow';
        debug_info('seu_eth_25g loaded...')
    end
  endfunction
  
  
  
