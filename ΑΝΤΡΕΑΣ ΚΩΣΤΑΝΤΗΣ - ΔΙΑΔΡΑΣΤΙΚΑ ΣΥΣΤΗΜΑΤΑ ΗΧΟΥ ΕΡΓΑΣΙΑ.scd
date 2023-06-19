(
s.waitForBoot {

	// Define an array of file paths to audio samples
	var paths = [
		"/samples/dr.wav",
		"/samples/gtr.wav",
		"/samples/melodia.wav"
	];

	// Define a SynthDef that plays audio buffers
	SynthDef(\player, { |out, buf|
		var sig = PlayBuf.ar(1, buf, doneAction: 2);
		Out.ar(out, sig);
	}).add;

	// For each file path, load the audio file into a buffer and play it
	paths.do { |path|
		var buffer = Buffer.read(s, path);
		Synth(\player, [\buf, buffer]);
	};
});













