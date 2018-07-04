module roboy_darkroom_tracker(
	input clock_16MHz,
	inout data,
	inout envelope,
	output sck,
	output mosi,
	output ss_n,
	output uart_tx
);

assign data =  clock_16MHz;
assign envelope =  clock_16MHz;
assign sck =  clock_16MHz;
assign mosi =  clock_16MHz;
assign ss_n =  clock_16MHz;
assign uart_tx =  clock_16MHz;

endmodule