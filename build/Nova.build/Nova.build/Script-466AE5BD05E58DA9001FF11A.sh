#!/bin/sh
echo "/* IWNovaController */

/* Don't edit this file if you opened it as NovaController.h, all changes will be lost. 
   Edit the first shell script build phase */
   
#import <Cocoa/Cocoa.h>
#import <PYMIDI/PYMIDIEndpoint.h>
#import \"IWProg.h\"
#import \"IWGraphButton.h\"
#import \"IWCableView.h\"
#import \"IWDarkSliderCell.h\"

#define SYSEXBUFSIZE 1024

@interface IWNovaController : NSObject
{
    NSUserDefaults *defaults;
    IBOutlet NSTextView *display;
    IBOutlet NSTextView *display2;
    IBOutlet NSPopUpButton *sourcePopUp;
    IBOutlet NSPopUpButton *destinationPopUp;
    IBOutlet NSMatrix *channelButtons;
    
    IBOutlet NSWindow *mainWindow;
    IBOutlet NSWindow *env1Window;
    IBOutlet NSWindow *env2Window;
    IBOutlet NSWindow *env3Window;
    IBOutlet NSWindow *lfo1Window;
    IBOutlet NSWindow *lfo2Window;
    IBOutlet NSWindow *osc1Window;
    IBOutlet NSWindow *osc2Window;
    IBOutlet NSWindow *osc3Window;
    IBOutlet NSWindow *noiseWindow;
    IBOutlet NSWindow *filterWindow;
    IBOutlet NSWindow *midiWindow;
    IBOutlet NSWindow *lfo1ControlsWindow;
    IBOutlet NSWindow *lfo2ControlsWindow;
    IBOutlet NSWindow *env2ControlsWindow;
    IBOutlet NSWindow *env3ControlsWindow;
    IBOutlet NSWindow *wheelControlsWindow;
    IBOutlet NSWindow *afterTouchControlsWindow;
    IBOutlet NSWindow *osc1ControlledWindow;
    IBOutlet NSWindow *osc2ControlledWindow;
    IBOutlet NSWindow *osc3ControlledWindow;
    IBOutlet NSWindow *ring13ControlledWindow;
    IBOutlet NSWindow *ring23ControlledWindow;
    IBOutlet NSWindow *noiseControlledWindow;
    IBOutlet NSWindow *filterControlledWindow;
    
    IBOutlet NSTextField *osc1FineText;
    IBOutlet NSTextField *osc2FineText;
    IBOutlet NSTextField *osc3FineText;
    IBOutlet NSTextField *osc1PitchText;
    IBOutlet NSTextField *osc2PitchText;
    IBOutlet NSTextField *osc3PitchText;

    IBOutlet IWGraphButton *osc1;
    IBOutlet IWGraphButton *osc2;
    IBOutlet IWGraphButton *osc3;
    IBOutlet IWGraphButton *noise;
    IBOutlet IWGraphButton *env1;
    IBOutlet IWGraphButton *env2;
    IBOutlet IWGraphButton *env3;
    IBOutlet IWGraphButton *lfo1;
    IBOutlet IWGraphButton *lfo2;
    IBOutlet IWGraphButton *filter;
    IBOutlet IWGraphButton *midi;

    IBOutlet IWGraphButton *test;

    IBOutlet IWCableView *cableView;
" >IWNovaController.h

awk '{printf "    IBOutlet IWDarkSliderCell *%s;\n",$1}'  parameters/CC              >>IWNovaController.h
awk '{printf "    IBOutlet IWDarkSliderCell *%s;\n",$1}'  parameters/CCConnections   >>IWNovaController.h
awk '{printf "    IBOutlet IWDarkSliderCell *%s;\n",$1}'  parameters/NRPN            >>IWNovaController.h
awk '{printf "    IBOutlet IWDarkSliderCell *%s;\n",$1}'  parameters/NRPNConnections >>IWNovaController.h
awk '{printf "    IBOutlet NSMatrix     *%s;\n",$1}'  parameters/NRPNButtons     >>IWNovaController.h
awk '{printf "    IBOutlet IWDarkSliderCell *%s;\n",$1}'  parameters/NRPNParts       >>IWNovaController.h    
    
echo "
    
    NSColor *novaColour;
    
    PYMIDIEndpoint *source;
    PYMIDIEndpoint *destination;
    Boolean receivingSysex;
    Boolean receivingNRPN;
    Byte messageBuffer[SYSEXBUFSIZE];
    int messageCounter;
    bool messageComplete;
    NSData *message;
    IWProg *program;
    Byte channel;
    Byte midiMessage[6];
    Byte savedSysexBuffer[SYSEXBUFSIZE];
    NSMutableString *previousSlider;
}

">>IWNovaController.h

awk '{printf "-(IBAction)%sIn:(id)sender;\n",$1}'  parameters/CC              >>IWNovaController.h
awk '{printf "-(IBAction)%sIn:(id)sender;\n",$1}'  parameters/CCConnections   >>IWNovaController.h
awk '{printf "-(IBAction)%sIn:(id)sender;\n",$1}'  parameters/NRPN            >>IWNovaController.h
awk '{printf "-(IBAction)%sIn:(id)sender;\n",$1}'  parameters/NRPNConnections >>IWNovaController.h
awk '{printf "-(IBAction)%sIn:(id)sender;\n",$1}'  parameters/NRPNButtons     >>IWNovaController.h
awk '{printf "-(IBAction)%sIn:(id)sender;\n",$1}'  parameters/NRPNParts       >>IWNovaController.h

echo "
+(void)initialize;
-(void)initIBOutlets;
-(void)initGraphButtons;
-(void)initPitchText;
-(void)initAll;
//-(void)setAllUnlit;
-(IBAction)channelButtonsIn:(id)sender;
//-(IBAction)osc1FineTextIn:(id)sender;
-(IBAction)showEnv1Window:(id)sender;
-(IBAction)showEnv2Window:(id)sender;
-(IBAction)showEnv3Window:(id)sender;
-(IBAction)showLFO1Window:(id)sender;
-(IBAction)showLFO2Window:(id)sender;
-(IBAction)showOsc1Window:(id)sender;
-(IBAction)showOsc2Window:(id)sender;
-(IBAction)showOsc3Window:(id)sender;
-(IBAction)showFilterWindow:(id)sender;
-(IBAction)showMidiWindow:(id)sender;
-(IBAction)showLFO1ControlsWindow:(id)sender;
-(IBAction)showLFO2ControlsWindow:(id)sender;
-(IBAction)showEnv2ControlsWindow:(id)sender;
-(IBAction)showEnv3ControlsWindow:(id)sender;
-(IBAction)showWheelControlsWindow:(id)sender;
-(IBAction)showAfterTouchControlsWindow:(id)sender;
-(IBAction)showOsc1ControlledWindow:(id)sender;
-(IBAction)showOsc2ControlledWindow:(id)sender;
-(IBAction)showOsc3ControlledWindow:(id)sender;
-(IBAction)showNoiseControlledWindow:(id)sender;
-(IBAction)showRing13ControlledWindow:(id)sender;
-(IBAction)showRing23ControlledWindow:(id)sender;
-(IBAction)showFilterControlledWindow:(id)sender;

-(IBAction)sendMidi:(id)sender;
-(IBAction)requestProg:(id)sender;
-(void)sendMidiNoteOn;
-(void)sendMidiNoteOff;

-(void)nrpnIn:(id)progr number:(Byte)number value:(Byte)value;
-(void)ccIn:(id)progr number:(Byte)number value:(Byte)value;

-(IBAction)saveProgram:(id)sender;
-(IBAction)loadProgram:(id)sender;

//-(IBAction)refresh:(id)sender;



//-(id)getColour;
@end" >>IWNovaController.h

