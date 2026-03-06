function [x, y, typ]= seu_pfb_32ch(job, arg1, arg2)
    x=[];y=[];typ=[];
    blkname = 'seu_pfb_32ch';
    select job
      case 'set' then
        x=arg1;
        graphics = arg1.graphics;
        exprs = graphics.exprs;
        model = arg1.model;
        txt = 'Block Name (any string)';
        [ok, blkname, exprs] = scicos_getvalue("Set seu_pfb_32ch parameters",...
                          txt,...
                          list("str", 1),...
                          exprs);
        if ok then
            graphics.in_label = ['clk_adc', 'rst', 'data_adc', 'gain_in'];
            graphics.out_label = ['clk_out', 'clk_10M', 'max_out', 'Dout_00', 'Dout_01', 'Dout_02', 'Dout_03', 'Dout_04', 'Dout_05', 'Dout_06', 'Dout_07', 'Dout_08', 'Dout_09', 'Dout_10', 'Dout_11', 'Dout_12', 'Dout_13', 'Dout_14', 'Dout_15', 'Dout_16', 'Dout_17', 'Dout_18', 'Dout_19', 'Dout_20', 'Dout_21', 'Dout_22', 'Dout_23', 'Dout_24', 'Dout_25', 'Dout_26', 'Dout_27', 'Dout_28', 'Dout_29', 'Dout_30', 'Dout_31'];
            graphics.style = 'shape=rectangle;fillColor=green';
            graphics.exprs = exprs;
            x.graphics = graphics;
            model.in = [1 2 3 4];
            model.in2 = [1, 1, 128, 8];
            model.out = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35];
            model.out2 = [1, 1, 38, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32];
            x.model = model;
        end
      case 'define' then
        model = scicos_model();
        model.sim = list('seu_pfb_32ch',4);
        model.blocktype = 'c';
        // Type : column vector of real numbers.
        model.rpar = 0;
        model.in = [1 2 3 4];
        model.in2 = [1, 1, 128, 8];
        model.out = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35];
        model.out2 = [1, 1, 38, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32];
        // Type : column vector of strings.
        exprs = 'seu_pfb_32ch';
        gr_i = [];
        // we use model.label as the block tag.
        // the best place to set the tag should be graphics.gr_i/id.
        // However, I can't set graphics.gr_i/id...not sure why.
        // I tracked the code of standard_define until sciscicos_new().
        // Everything looks good, but gr_i/id is not set successfully.
        // scicos_new() looks implemented in c++, so I stopped tracking it.
        // TODO: track the source code of scicos_new() in c++.
        model.label = "dsp";
        x=standard_define([10 7],model,exprs,gr_i)
        x.graphics.out_label = ['clk_out', 'clk_10M', 'max_out', 'Dout_00', 'Dout_01', 'Dout_02', 'Dout_03', 'Dout_04', 'Dout_05', 'Dout_06', 'Dout_07', 'Dout_08', 'Dout_09', 'Dout_10', 'Dout_11', 'Dout_12', 'Dout_13', 'Dout_14', 'Dout_15', 'Dout_16', 'Dout_17', 'Dout_18', 'Dout_19', 'Dout_20', 'Dout_21', 'Dout_22', 'Dout_23', 'Dout_24', 'Dout_25', 'Dout_26', 'Dout_27', 'Dout_28', 'Dout_29', 'Dout_30', 'Dout_31'];
        x.graphics.in_label = ['clk_adc', 'rst', 'data_adc', 'gain_in'];
        x.graphics.style = 'shape=rectangle;fillColor=green';
        debug_info('seu_pfb_32ch loaded...')
    end
  endfunction
  
  
  
