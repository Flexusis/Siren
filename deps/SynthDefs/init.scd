(
Server.supernova;
s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 2;
// s.options.outDevice = "Built-in Output";
s.options.outDevice = "QUAD-CAPTURE";
s.options.inDevice = "QUAD-CAPTURE";
//s.options.inDevice = "Analog Rytm (Core Audio)";
s.options.hardwareBufferSize = 256;
s.options.maxNodes = 2048;
s.options.numWireBufs = 1024;
s.options.memSize = 131072 * 16;
s.options.sampleRate = 44100;
s.options.blockSize = 128;
s.options.numBuffers = 2048;
s.latency = 0.02;
s.options.verbosity = -2;
s.boot;
s.waitForBoot({

	~test_inp1 = 1;
	~test_inp2 = 1;

"/Users/canince/Documents/Github/sq/deps/SCsend/inp.scd".load;
"/Users/canince/Documents/Github/sq/deps/SCsend/npfx.scd".load;
"/Users/canince/Documents/Github/sq/deps/SCsend/fxloops.scd".load;
	SuperDirt.start;
	s.makeGui(l);
	v = s.volume;
	v.volume = -3;
});
)