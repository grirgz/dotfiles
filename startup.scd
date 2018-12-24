//GUI.swing;
//SwingOSC.java = "/usr/bin/java";
//SwingOSC.program = ("/usr/local/bin/SwingOSC.jar").standardizePath;
//SwingOSC.default.boot;

// tentative de reglage du probleme de la double archive
Archive.read;
Archive.write;

FileSystemProject.addPath("~/code/sc/seco/vlive/repeat/");
FileSystemProject.addPath("~/code/sc/seco/vlive/");

//Param.defaultUpdateMode = \skipjack;
Param.defaultUpdateMode = \dependants;

Log(\Param).level = \debug;

//GUI.qt;
o = Server.default.options;
o.memSize = 8192 * 32;
//o.numPrivateAudioBusChannels = 512;
o.numAudioBusChannels = 128 * 8;
o.numControlBusChannels = 4096 * 8;
o.numOutputBusChannels = 8 + 1 * 2;
o.numWireBufs = 64 * 4 * 4;
o.maxSynthDefs = 1024 * 2;
o.numBuffers = 1024 * 2;

SynthDescLib.global.read;

"hello!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!".postln;

~connect_jack_device = { arg idsymbol;
	"==== %: Device id = %".format(idsymbol, topEnvironment[idsymbol]).debug;
	if(topEnvironment[idsymbol].notNil) {
		try {
			MIDIOut.connect(0, topEnvironment[idsymbol]);
		} {
			"%: Probably already connected out".format(idsymbol).debug;
		};
		try {
			MIDIIn.connect(0, topEnvironment[idsymbol]);
		} {
			"%: Probably already connected in".format(idsymbol).debug;
		};
	} {
		"%: Device id is nil".format(idsymbol).debug;
	};
};

~connect_jack = {
	~launchpad_device_id = MIDIIn.findPort ("Launchpad S", "Launchpad S MIDI 1") !? (_.uid);
	~icon_device_id = MIDIIn.findPort ("iCON iControls V2.00", "iCON iControls V2.00 MIDI 1") !? (_.uid);
	~apro_device_id = MIDIIn.findPort ("A-PRO", "A-PRO MIDI 2") !? (_.uid);
	~apc_device_id = MIDIIn.findPort ("APC40 mkII", "APC40 mkII MIDI 1") !? (_.uid);

	[\launchpad_device_id, \icon_device_id, \apro_device_id, \apc_device_id].do(~connect_jack_device);
};


~initialize_jack = {
	if(MIDIClient.initialized == false) { 
		MIDIClient.init; 
		"~/bin/launchpad_connect".standardizePath.unixCmd;
		"jack_connect A-PRO:midi/playback_2 SuperCollider:midi/capture_1".unixCmd;
	} {
		"Midi already initialized just connect.";
		//MIDIClient.restart;
	};

	~connect_jack.();
	//~launchpad_device_id = MIDIIn.findPort ("Launchpad S-Launchpad S MIDI 1", "Launchpad S-Launchpad S MIDI 1") !? (_.uid);
	//~icon_device_id = MIDIIn.findPort ("iCON iControls V2.00-iCON iControls V2.00 MIDI 1", "iCON iControls V2.00-iCON iControls V2.00 MIDI 1") !? (_.uid);
	//MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "Launchpad S-Launchpad S MIDI 1" } );
	//MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "iCON iControls V2.00-iCON iControls V2.00 MIDI 1" } );

	// this worked in 3.7alpha
	//MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "Launchpad S" } );
	//MIDIOut(0).connect( MIDIClient.destinations.detectIndex { arg x; x.device == "iCON iControls V2.00" } );
	//MIDIIn.connect(0, ~launchpad_device_id);
	//MIDIIn.connect(0, ~icon_device_id);
};


//MIDIClient.sources

~cuspn_project_path = "~/code/sc/seco/vlive/cuspn".standardizePath;


// isRest legacy support
{
	var d = Event.parentEvents.default;
	d[\play] = d[\play] <> { ~isRest.notNil.if { ~isRest.if { ~type = \rest } } };
}.value;
