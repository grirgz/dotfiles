//GUI.swing;
//SwingOSC.java = "/usr/bin/java";
//SwingOSC.program = ("/usr/local/bin/SwingOSC.jar").standardizePath;
//SwingOSC.default.boot;

GUI.qt;
o = Server.default.options;
o.memSize = 8192 * 8;
//o.numPrivateAudioBusChannels = 512;
o.numAudioBusChannels = 512;
o.numOutputBusChannels = 8 + 1 * 2;

~initialize_jack = {
	if(MIDIClient.initialized == false) { 
		MIDIClient.init; 
		"~/bin/launchpad_connect".standardizePath.unixCmd;
		"jack_connect A-PRO:midi/playback_2 SuperCollider:midi/capture_1".unixCmd;
	} {
		"Midi already initialized.";
	};
};
