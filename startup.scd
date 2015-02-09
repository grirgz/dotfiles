//GUI.swing;
//SwingOSC.java = "/usr/bin/java";
//SwingOSC.program = ("/usr/local/bin/SwingOSC.jar").standardizePath;
//SwingOSC.default.boot;

GUI.qt;
o = Server.default.options;
o.memSize = 8192 * 8;
//o.numPrivateAudioBusChannels = 512;
o.numAudioBusChannels = 128 * 8;
o.numControlBusChannels = 4096 * 8;
o.numOutputBusChannels = 8 + 1 * 2;
o.numWireBufs = 64 * 4;
o.maxSynthDefs = 1024 * 2;
o.numBuffers = 1024 * 2;

SynthDescLib.global.read;

"hello!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!".postln;

~initialize_jack = {
	if(MIDIClient.initialized == false) { 
		MIDIClient.init; 
		"~/bin/launchpad_connect".standardizePath.unixCmd;
		"jack_connect A-PRO:midi/playback_2 SuperCollider:midi/capture_1".unixCmd;
	} {
		"Midi already initialized just connect.";
		//MIDIClient.restart;
	};
	//~launchpad_device_id = MIDIIn.findPort ("Launchpad S-Launchpad S MIDI 1", "Launchpad S-Launchpad S MIDI 1") !? (_.uid);
	//~icon_device_id = MIDIIn.findPort ("iCON iControls V2.00-iCON iControls V2.00 MIDI 1", "iCON iControls V2.00-iCON iControls V2.00 MIDI 1") !? (_.uid);
	~launchpad_device_id = MIDIIn.findPort ("Launchpad S", "Launchpad S MIDI 1") !? (_.uid);
	~icon_device_id = MIDIIn.findPort ("iCON iControls V2.00", "iCON iControls V2.00 MIDI 1") !? (_.uid);
	~icon_device_id.debug("iCON iControls device");
	~launchpad_device_id.debug("Launchpad device");
	//MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "Launchpad S-Launchpad S MIDI 1" } );
	//MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "iCON iControls V2.00-iCON iControls V2.00 MIDI 1" } );
	MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "Launchpad S" } );
	MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "iCON iControls V2.00" } );
	MIDIIn.connect(0, ~launchpad_device_id);
	MIDIIn.connect(0, ~icon_device_id);
};

//MIDIClient.sources

~cuspn_project_path = "~/code/sc/seco/vlive/cuspn".standardizePath;
