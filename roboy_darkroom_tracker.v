module roboy_darkroom_tracker(
	input clock_16MHz,
	inout [1:0]data,
	inout [1:0]envelope,
	output sck,
	output mosi,
	output ss_n,
	output uart_tx
);


parameter NUMBER_OF_SENSORS = 2;
//assign data = clock_16MHz ;
//assign envelope =  clock_16MHz;
//assign sck =  clock_16MHz;
//assign mosi =  clock_16MHz;
//assign ss_n =  clock_16MHz;
//assign uart_tx =  clock_16MHz;

//reg reset;
//assign uart_tx = reset;
//
//always @(posedge clock_16MHz) begin: RESET
//	reg [7:0] counter;
//	if(counter==255) begin
//		reset <= 0;
//	end else begin
//		reset <= 1;
//		counter <= counter + 1;
//	end
//	
//end

//reg [2:0] sensor_states[NUMBER_OF_SENSORS-1:0];
//reg [3:0] current_states[NUMBER_OF_SENSORS-1:0];
//wire D;
//wire E;
//assign D = (sensor_to_configure<NUMBER_OF_SENSORS)?data[sensor_to_configure]:1'bz;
//assign E = (sensor_to_configure<NUMBER_OF_SENSORS)?envelope[sensor_to_configure]:1'bz;
//
//wire [2:0] sensor_state;
//wire [3:0] current_state;
//
//ts4231 #(16_000_000) sensor(
//	.clk(clock),
//	.rst(reset_ts4231_config),
//	.D(D),
//	.E(E),
//	.sensor_STATE(sensor_state),
//	.current_STATE(current_state)
//);
//
//reg reset_ts4231_config;
//reg [7:0] sensor_to_configure;
//
//always @(posedge clock_16MHz, posedge reset) begin: TS4231_INIT_INTERFACE
//	reg [31:0] timeout;
//	if (reset == 1) begin
//		timeout <= 0;
//		sensor_to_configure<=0;
//		reset_ts4231_config <= 1; 
//	end else begin
//		reset_ts4231_config <= 0;
//		if(timeout>0) begin
//			timeout <= timeout - 1;
//		end else begin
//			sensor_states[sensor_to_configure] <= sensor_state;
//			current_states[sensor_to_configure] <= current_state;
//			if(sensor_to_configure<NUMBER_OF_SENSORS-1) begin
//				sensor_to_configure <= sensor_to_configure + 1;
//			end else begin
//				sensor_to_configure <= 0;
//			end
//			reset_ts4231_config <= 1;
//			timeout <= 16_000_000/10; // 100ms timeout
//		end
//	end
//end

//DarkRoom #(0,0,3,16_000_000) darkroom(
//	.clock(clock_16MHz),
//	.reset_n(1'b1),
//	.D_io(data),
//	.E_io(envelope),
//	.sck_o(sck), 
//	.ss_n_o(ss_n),
//	.mosi_o(mosi)
//);

ts4231 #(16_000_000) ts(
	.clk(clock_16MHz),
	.rst(1'b0),
	.D(data[0]),
	.E(envelope[0]),
	.sensor_STATE({mosi,ss_n,sck})
);

endmodule