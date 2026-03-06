# PFB Block
This module can partition a wideband signal into a series of subbands.
\begin{table}[!h]
    \centering
    \caption{OPFB module interface description.}
    \begin{tabular}{|c|c|c|c|}
    \hline
    Interface &  Direction & Width & Description \\
    \hline
    clk\textunderscore adc & in & 1 & Input wideband data clock. \\
    \hline
    rst & in & 1 & Reset signal. \\
    \hline
    data\textunderscore adc & in & 128 & Input data, containing 8 sampling points, 16 bits per point.\\
    \hline
    gain\textunderscore in & in & 8 & \makecell{Output truncation control signal:  
\\ 0 means taking 16 bits from the highest bit for output,  
\\ 1 means starting from the second highest bit, and so on.}\\
    \hline
    clk\textunderscore out & out & 1 & \makecell{Subband output data clock.}\\
    \hline
    clk\textunderscore 10M & out & 1 & \makecell{10 MHz clock output.}\\
    \hline
    max\textunderscore out & out & 38 & \makecell{Maximum value among every 100,000 output data, \\used as a reference for truncation control.}\\
    \hline
    Dout\textunderscore 00-31 & out & 32 & \makecell{32 subband data outputs, 32-bit complex numbers:\\  
the upper 16 bits are the imaginary part, and the lower 16 bits are the real part.}\\
    \hline
    \end{tabular}
\end{table}
