package fpga_pkg;

	// Encoding for a format
	typedef struct packed {
		int unsigned exp_bits;
		int unsigned man_bits;
	} data_encoding_t;

	localparam int unsigned NUM_DATA_FORMATS = 5;
	localparam int unsigned DATA_FORMATS_BITS = $clog2(NUM_DATA_FORMATS);
	
	localparam int unsigned MATRIX_SIZE = 32;
	localparam int unsigned SUB_MATRIX_NUM = 64 ;

	
	//the data type
	typedef enum logic [DATA_FORMATS_BITS-1:0] {
		FP16_LENGTH = 0,
		FP32_LENGTH = 1,
		FP64_LENGTH = 2,
		INT8_LENGTH = 3,
		INT32_LENGTH = 4
	} data_type_e;

	typedef enum logic [1:0] {
		OUTPUT_STATIONARY = 0,
		WEIGHT_STATIONARY = 1,
		BOTH_STATIONANRY = 2
	} data_flow_e;

	// Encodings for data type
  	localparam data_encoding_t [0:NUM_DATA_FORMATS-1] DATA_ENCODINGS  = '{
		'{5,  10}, // IEEE binary16 (half)
		'{8,  23}, // IEEE binary32 (single)
		'{11, 52}, // IEEE binary64 (double)
		'{0,  7},
		'{0,  31}
  	};

	typedef struct packed {
		data_type_e InputType;
		data_type_e OutputType;
		data_type_e AccType;
		data_flow_e DataFlow;
		int unsigned MaxSimultaneousMatmuls;
		int unsigned MacDelay;
		int unsigned AddDelay;
	} pe_features_t;

	localparam pe_features_t OS_DATAFLOW = '{
		InputType : FP16_LENGTH,
		OutputType: FP16_LENGTH,
		AccType   : FP16_LENGTH,
		DataFlow : OUTPUT_STATIONARY,
		MaxSimultaneousMatmuls :  SUB_MATRIX_NUM ,
		MacDelay : 9 ,
		AddDelay : 7
	};

	localparam pe_features_t WS_DATAFLOW = '{
		InputType : FP16_LENGTH,
		OutputType: FP16_LENGTH,
		AccType   : FP16_LENGTH,
		DataFlow : WEIGHT_STATIONARY,
		MaxSimultaneousMatmuls :  SUB_MATRIX_NUM , //the same as the RWOS and COLUMNS
		MacDelay : 9,
		AddDelay : 7
	};

	localparam pe_features_t WS_DATAFLOW_INT8 = '{
		InputType : INT8_LENGTH,
		OutputType: INT32_LENGTH,
		AccType   : INT32_LENGTH,
		DataFlow : WEIGHT_STATIONARY,
		MaxSimultaneousMatmuls :  SUB_MATRIX_NUM , //the same as the RWOS and COLUMNS
		MacDelay : 2,
		AddDelay : 2
	};


	localparam pe_features_t BOTH_DATAFLOW = '{
		InputType : FP16_LENGTH,
		OutputType: FP16_LENGTH,
		AccType   : FP16_LENGTH,
		DataFlow : BOTH_STATIONANRY,
		MaxSimultaneousMatmuls : SUB_MATRIX_NUM ,
		MacDelay : 9,
		AddDelay : 7
	};

	typedef struct packed {
		pe_features_t PE_Features;
		int unsigned rows;
		int unsigned columns;
	} tile_features_t;

	localparam tile_features_t TILE_FEATURES_DEFAULT1 = '{
		PE_Features : WS_DATAFLOW,
		rows :  MATRIX_SIZE,
		columns : MATRIX_SIZE
	};
	localparam tile_features_t TILE_FEATURES_DEFAULT2= '{
		PE_Features : OS_DATAFLOW,
		rows : 4,
		columns : 4
	};
	localparam tile_features_t TILE_FEATURES_DEFAULT3= '{
		PE_Features : BOTH_DATAFLOW,
		rows : MATRIX_SIZE,
		columns : MATRIX_SIZE
	};

	localparam tile_features_t TILE_FEATURES_DEFAULT4= '{
		PE_Features : WS_DATAFLOW,
		rows : MATRIX_SIZE*2,
		columns : MATRIX_SIZE*2
	};

	localparam tile_features_t TILE_FEATURES_DEFAULT5= '{
		PE_Features : WS_DATAFLOW,
		rows : MATRIX_SIZE/2,
		columns : MATRIX_SIZE/2
	};

	localparam tile_features_t TILE_FEATURES_INT8_32 = '{
		PE_Features : WS_DATAFLOW_INT8,
		rows : MATRIX_SIZE,
		columns : MATRIX_SIZE
	};

	localparam tile_features_t TILE_FEATURES_INT8_64 = '{
		PE_Features : WS_DATAFLOW_INT8,
		rows : MATRIX_SIZE*2,
		columns : MATRIX_SIZE*2
	};

	// Returns the width of a data format
	function automatic int unsigned data_width(data_type_e fp_type);
		return DATA_ENCODINGS[fp_type].exp_bits + DATA_ENCODINGS[fp_type].man_bits + 1;
	endfunction

	

endpackage
