#import "IWNovaController.h"
#import <PYMIDI13/PYMIDIManager.h>
#import <PYMIDI13/PYMIDIEndpoint.h>
#import "MIDICONST.h"
#import "IWNovaColour.h"

@implementation IWNovaController

// This gets called when MIDI Data arrives
- (void)processMIDIPacketList:(MIDIPacketList*)packetList sender:(id)sender
{
    MIDIPacket *packet;
    NSData *sysexDump;
    int i,j;
    //[destination processMIDIPacketList:packetList sender:self];
    // Handle the MIDI data in here
    packet = &packetList->packet[0];
    for (i = 0; i < packetList->numPackets; ++i) 
    {
        // Display the raw midi data
        /*[display2 insertText:[NSString localizedStringWithFormat:@"\n%d bytes:",packet->length]];
        for (j=0;j<packet->length;j++)
        {
            [display2 insertText:[NSString localizedStringWithFormat:@" %d ",packet->data[j]]];
        }*/
        
        if(receivingSysex)
        {
            for (j=0;j<packet->length;j++)
            {
                if(packet->data[j]<REALTIME)
                {
                    messageBuffer[messageCounter]=packet->data[j];
                    if(messageBuffer[messageCounter]==SYSEXEND)
                    {
                        messageComplete=true;
                        receivingSysex=false;
                    }
                    messageCounter++;                
                }     
            }
        }
        else if(receivingNRPN)
        {
            for(j=0;j<3;j++)
            {
                messageBuffer[messageCounter]=packet->data[j];
                messageCounter++;
            }
            receivingNRPN=false;
            //***********************************************************************************
            //********************* We have a complete nrpn message here ************************
            //***********************************************************************************
            [self nrpnIn:program number:messageBuffer[2] value:messageBuffer[5]];
            [cableView setNeedsDisplay:true];
            messageCounter=0;
        }
        else
        {
            switch(packet->data[0])
            {                
                case CC1 ... CC16:
                    for(j=0;j<3;j++)
                    {
                        messageBuffer[j]=packet->data[j];
                        messageCounter++;
                    }                    
                    //Is this an NRPN?
                    if(packet->data[1]==98)
                    {
                        receivingNRPN=true;
                    }
                    else
                    {
                        //***********************************************************************************
                        //********************* We have a complete CC message here **************************
                        //***********************************************************************************
                        [self ccIn:program number:messageBuffer[1] value:messageBuffer[2]];
                        [cableView setNeedsDisplay:true];
                        messageCounter=0;
                    }
                    break;
                case SYSEX:
                    receivingSysex=true;
                    messageCounter=0;
                    for (j=0;j<packet->length;j++)
                    {
                        if(packet->data[j]<REALTIME)
                        {
                            messageBuffer[messageCounter]=packet->data[j];
                            if(messageBuffer[messageCounter]==SYSEXEND)
                            {
                                messageComplete=true;
                                receivingSysex=false;
                            }
                            else
                            {
                                messageCounter++;
                            }                
                        }     
                    }
                    break;
                case AFTERTOUCH1 ... AFTERTOUCH16:
                case KEEPALIVE:
                case CLOCK:
                case NOTEON1 ... NOTEON16:
                case PITCHBEND1 ... PITCHBEND16:
                default:
                    break;
            }            
        }
        if(messageComplete)
        {
            //***********************************************************************************
            //********************* We have a complete Sysex message here ***********************
            //***********************************************************************************
            messageComplete=false;
            [display2 insertText:[NSString localizedStringWithFormat:@"Sysex:%d:",messageCounter]];
            sysexDump=[NSData dataWithBytes:messageBuffer length:messageCounter];
            //Compare with the previous sysex dump
            for(j=0;j<messageCounter;j++)
            {
                NSLog(@"%d %d",messageBuffer[j],savedSysexBuffer[j]);
                if(messageBuffer[j]!=savedSysexBuffer[j])
                {
                    if(j>2)
                    [display2 insertText:[NSString localizedStringWithFormat:@"\ndiffer at %d %d %d",j,messageBuffer[j],savedSysexBuffer[j]]];
                }
                savedSysexBuffer[j]=messageBuffer[j];
            }
            NSLog(@"*************************************************************************************");
            
            
            //load the sysex data into program
            [program initWithSysex:sysexDump];
            //[self initIBOutletsWithProgram:program];
            [self initIBOutlets];
            /* for (j=0;j<messageCounter;j++)
            {
                [display2 insertText:[NSString localizedStringWithFormat:@"-%d ",messageBuffer[j]]];
            }*/
            messageCounter=0;
        }
        packet = MIDIPacketNext(packet);
    }
}

-(IBAction)saveProgram:(id)sender
{
    NSSavePanel *sp;
    int runResult;
    sp = [NSSavePanel savePanel];
    
    [sp setRequiredFileType:@"prog"];
    /* display the NSSavePanel */
    runResult = [sp runModal];
    /* if successful, save file under designated name */
    if (runResult == NSOKButton) {
        NSLog(@"Filename: %@", [sp filename]);
        
        if (![[program asDictionary] writeToFile:[sp filename] atomically:YES])
        {   
            NSBeep();
        }
    }
}

-(IBAction)loadProgram:(id)sender
{
    NSOpenPanel *op;
    NSDictionary *dict;
    int runResult;
    NSArray *types;
    types=[NSArray arrayWithObject:@"prog"];
    op=[NSOpenPanel openPanel];
    [op setRequiredFileType:@"prog"];
    /* display the NSSavePanel */
    runResult = [op runModalForTypes:types];
    
    if (runResult == NSOKButton) 
    {
        NSLog(@"Filename: %@", [op filename]);
        
        if (dict=[NSDictionary dictionaryWithContentsOfFile:[op filename]])
        {
            [program fromDictionary:dict];
            //[self initIBOutletsWithProgram:program];
            [self initIBOutlets];
        }
        else
        {   
            NSBeep();
        }
    }
}

- (void)buildPopUps
{
    PYMIDIManager*  manager = [PYMIDIManager sharedInstance];
    NSArray*        endpointArray;
    NSEnumerator*   enumerator;
    PYMIDIEndpoint* endpoint;
    
    [sourcePopUp removeAllItems];
    [destinationPopUp removeAllItems];
    
    endpointArray = [manager onlineRealSources];
    
    enumerator = [endpointArray objectEnumerator];
    while (endpoint = [enumerator nextObject]) {
        [sourcePopUp addItemWithTitle:[endpoint displayName]];
        [[sourcePopUp lastItem] setRepresentedObject:endpoint];
    }
    
    endpointArray = [manager onlineRealDestinations];
    
    enumerator = [endpointArray objectEnumerator];
    while (endpoint = [enumerator nextObject]) {
        [destinationPopUp addItemWithTitle:[endpoint displayName]];
        [[destinationPopUp lastItem] setRepresentedObject:endpoint];
    }    
}

-(void)connectToMidi
{
    [self buildPopUps];
    source=[[sourcePopUp selectedItem] representedObject];
    destination=[[destinationPopUp selectedItem] representedObject];
    [source addReceiver:self];
    [destination addSender:self];
    receivingSysex=false;
    receivingNRPN=false;
    messageCounter=0;
    messageComplete=false;
}

+(void)initialize
{
    //NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    //[defs setInteger:1 forKey:@"channel"];
}

-(id)init
{
    self=[super init];
    novaColour=[NSColor novaBodyColour];
    program=[[IWProg alloc] init];
    //[previousSlider  initWithString:@"    "];
    previousSlider=[NSMutableString stringWithCapacity:40];
    [previousSlider retain];
    [previousSlider  setString:@"abcd"];
    return self;
}

-(void)initGraphButtons
{
    [filter drawFilter:[program filterType] slope:[program filterDB] frequency:[program filterFrequency] resonance:[program filterResonance] width:[program filterWidth]];    
    //    [osc1PitchText setIntValue:([program osc1Oct]-2)*12+[program osc1Semi]-57];
    [osc1 drawWave:[program osc1Wave] soften:[program osc1Soften] pulseWidth:[program osc1Width]];
    //    [osc2PitchText setIntValue:([program osc2Oct]-32)*12+[program osc2Semi]-57];
    [osc2 drawWave:[program osc2Wave] soften:[program osc2Soften] pulseWidth:[program osc2Width]];
    //    [osc3PitchText setIntValue:([program osc3Oct]-32)*12+[program osc3Semi]-57];
    [osc3 drawWave:[program osc3Wave] soften:[program osc3Soften] pulseWidth:[program osc3Width]];
    [lfo1 drawLFO:[program lfo1Shape]];
    [lfo2 drawLFO:[program lfo2Shape]];    
    [env1 drawEnvWithAttack:[program env1Attack] decay:[program env1Decay] sustain:[program env1Sustain] release:[program env1Release]];
    [env2 drawEnvWithAttack:[program env2Attack] decay:[program env2Decay] sustain:[program env2Sustain] release:[program env2Release]];
    [env3 drawEnvWithAttack:[program env3Attack] decay:[program env3Decay] sustain:[program env3Sustain] release:[program env3Release]];    
    [noise drawNoiseWithSoften:[program noiseSoften]];
    
}

-(void)initPitchText
{
    [osc1PitchText setIntValue:([program osc1Oct]-2)*12+[program osc1Semi]-12];
    [osc2PitchText setIntValue:([program osc2Oct]-2)*12+[program osc2Semi]-12];
    [osc3PitchText setIntValue:([program osc3Oct]-2)*12+[program osc3Semi]-12];
}

-(void)awakeFromNib
{
    defaults = [NSUserDefaults standardUserDefaults];
    channel=[defaults integerForKey:@"channel"];
    [mainWindow setFrameAutosaveName:@"Main Window"];
    [mainWindow setBackgroundColor:novaColour];
    [display2 setTextColor:[NSColor blueColor]];
    [display setTextColor:[NSColor blueColor]];
    [self connectToMidi];
    [cableView setProg:program];
    [self initAll];

}
-(void)initAll
{
    //Initialize all the GraphButton displays etc
    [self initGraphButtons];
    
    //Initialize sliders
    [self initIBOutlets];
    
    //Initialise pitchText fields
    [self initPitchText];    
}

/*-(void)setAllUnlit
{
    NSLog(@"SetAllUnlit");
#include "GeneratedFiles/SetAllUnlit"   
}*/

/*-(void)setAllNeedsDisplay
{
    [mainWindow setViewsNeedDisplay:true];
    [osc1Window setViewsNeedDisplay:true];
}*/

-(void)initIBOutlets
{
#include "GeneratedFiles/InitIBOutlets"
    [cableView setNeedsDisplay:true];
    [osc1 drawWave:[program osc1Wave] soften:[program osc1Soften] pulseWidth:[program osc1Width]];
    [osc2 drawWave:[program osc2Wave] soften:[program osc2Soften] pulseWidth:[program osc2Width]]; 
    [osc3 drawWave:[program osc3Wave] soften:[program osc3Soften] pulseWidth:[program osc3Width]]; 
    //[osc1FineText setIntValue:[program osc1Fine]]; 
    //[osc2FineText setIntValue:[program osc2Fine]]; 
    //[osc3FineText setIntValue:[program osc3Fine]]; 
    [env1 drawEnvWithAttack:[program env1Attack] decay:[program env1Decay] sustain:[program env1Sustain] release:[program env1Release]]; 
    [env2 drawEnvWithAttack:[program env2Attack] decay:[program env2Decay] sustain:[program env2Sustain] release:[program env2Release]]; 
    [env3 drawEnvWithAttack:[program env3Attack] decay:[program env3Decay] sustain:[program env3Sustain] release:[program env3Release]]; 
    [noise drawNoiseWithSoften:[program noiseSoften]]; 
    [filter drawFilter:[program filterType] slope:[program filterDB] frequency:[program filterFrequency] resonance:[program filterResonance] width:[program filterWidth]]; 
    [lfo1 drawLFO:[program lfo1Shape]]; 
    [lfo2 drawLFO:[program lfo2Shape]]; 
    //[self setAllUnlit];
}

/*-(IBAction)refresh:(id)sender
{
    NSLog (@"**refresh");
    [self initIBOutletsWithProgram:program];
}*/

-(IBAction)showEnv2Window:(id)sender
{
    if(env2Window==nil)
    {
        if(![NSBundle loadNibNamed:@"Env2.nib" owner:self])
        {
            NSLog(@"Couldn't load Env2.nib");
        }
    }
    [env2Window setFrameAutosaveName:@"Env2Window"];
    [env2Window setBackgroundColor:novaColour];
    [env2Attack setIntValue:[program env2Attack]];
    [env2Decay setIntValue:[program env2Decay]];
    [env2Sustain setIntValue:[program env2Sustain]];
    [env2Release setIntValue:[program env2Release]];
    [env2Window makeKeyAndOrderFront:nil];
}

-(IBAction)showEnv1Window:(id)sender
{
    if(env1Window==nil)
    {
        if(![NSBundle loadNibNamed:@"Env1.nib" owner:self])
        {
            NSLog(@"Couldn't load Env1.nib");
        }
    }
    [env1Window setFrameAutosaveName:@"Env1Window"];
    [env1Window setBackgroundColor:novaColour];
    [env1Attack setIntValue:[program env1Attack]];
    [env1Decay setIntValue:[program env1Decay]];
    [env1Sustain setIntValue:[program env1Sustain]];
    [env1Release setIntValue:[program env1Release]];
    [env1Window makeKeyAndOrderFront:nil];
}

-(IBAction)showEnv3Window:(id)sender
{
    if(env3Window==nil)
    {
        if(![NSBundle loadNibNamed:@"Env3.nib" owner:self])
        {
            NSLog(@"Couldn't load Env3.nib");
        }
    }
    [env3Window setFrameAutosaveName:@"Env3Window"];
    [env3Window setBackgroundColor:novaColour];
    [env3Attack setIntValue:[program env3Attack]];
    [env3Decay setIntValue:[program env3Decay]];
    [env3Sustain setIntValue:[program env3Sustain]];
    [env3Release setIntValue:[program env3Release]];
    [env3Window makeKeyAndOrderFront:nil];
}

-(IBAction)showLFO1Window:(id)sender
{
    if(lfo1Window==nil)
    {
        if(![NSBundle loadNibNamed:@"LFO1.nib" owner:self])
        {
            NSLog(@"Couldn't load LFO1.nib");
        }
    }
    [lfo1Window setFrameAutosaveName:@"Lfo1Window"];
    [lfo1Window setBackgroundColor:novaColour];
    [lfo1Delay setIntValue:[program lfo1Delay]];
    [lfo1Speed setIntValue:[program lfo1Speed]];
    [lfo1Window makeKeyAndOrderFront:nil];
    
}

-(IBAction)showLFO2Window:(id)sender
{
    if(lfo2Window==nil)
    {
        if(![NSBundle loadNibNamed:@"LFO2.nib" owner:self])
        {
            NSLog(@"Couldn't load LFO2.nib");
        }
    }
    [lfo2Window setFrameAutosaveName:@"Lfo2Window"];
    [lfo2Window setBackgroundColor:novaColour];
    [lfo2Speed setIntValue:[program lfo2Speed]];
    [lfo2Delay setIntValue:[program lfo2Delay]];    
    [lfo2Window makeKeyAndOrderFront:nil];
    
}


-(IBAction)showOsc1Window:(id)sender
{
if(osc1Window==nil)
    {
        if(![NSBundle loadNibNamed:@"Osc1.nib" owner:self])
        {
            NSLog(@"Couldn't load Osc1.nib");
        }
    }
    [osc1Window setFrameAutosaveName:@"Osc1Window"];
    [osc1Window setBackgroundColor:novaColour];
    
    [osc1Soften setIntValue:[program osc1Soften]];
    [osc1Width setIntValue:[program osc1Width]];
    [osc1Sync setIntValue:[program osc1Sync]];
    [osc1SyncSkew setIntValue:[program osc1SyncSkew]];
    [osc1SyncKeyFollow setIntValue:[program osc1SyncKeyFollow]];
    [osc1FormantWidth setIntValue:[program osc1FormantWidth]];
    [osc1Semi setIntValue:[program osc1Semi]];
    [osc1Fine setIntValue:[program osc1Fine]];
    [osc1Wave selectCellWithTag:[program osc1Wave]];
    [osc1Oct selectCellWithTag:[program osc1Oct]];
    
    [osc1Window makeKeyAndOrderFront:nil];
}

-(IBAction)showOsc2Window:(id)sender
{
    if(osc2Window==nil)
    {
        if(![NSBundle loadNibNamed:@"Osc2.nib" owner:self])
        {
            NSLog(@"Couldn't load Osc2.nib");
        }
    }
    [osc2Window setFrameAutosaveName:@"Osc2Window"];
    [osc2Window setBackgroundColor:novaColour];
    [osc2Soften setIntValue:[program osc2Soften]];
    [osc2Width setIntValue:[program osc2Width]];
    [osc2Sync setIntValue:[program osc2Sync]];
    [osc2SyncSkew setIntValue:[program osc2SyncSkew]];
    [osc2SyncKeyFollow setIntValue:[program osc2SyncKeyFollow]];
    [osc2FormantWidth setIntValue:[program osc2FormantWidth]];
    [osc2Semi setIntValue:[program osc2Semi]];
    [osc2Fine setIntValue:[program osc2Fine]];
    [osc2Window makeKeyAndOrderFront:nil];
}

-(IBAction)showOsc3Window:(id)sender
{
    if(osc3Window==nil)
    {
        if(![NSBundle loadNibNamed:@"Osc3.nib" owner:self])
        {
            NSLog(@"Couldn't load Osc3.nib");
        }
    }
    [osc3Window setFrameAutosaveName:@"Osc3Window"];
    [osc3Window setBackgroundColor:novaColour];
    [osc3Soften setIntValue:[program osc3Soften]];
    [osc3Width setIntValue:[program osc3Width]];
    [osc3Sync setIntValue:[program osc3Sync]];
    [osc3SyncSkew setIntValue:[program osc3SyncSkew]];
    [osc3SyncKeyFollow setIntValue:[program osc3SyncKeyFollow]];
    [osc3FormantWidth setIntValue:[program osc3FormantWidth]];
    [osc3Semi setIntValue:[program osc3Semi]];
    [osc3Fine setIntValue:[program osc3Fine]];
    [osc3Window makeKeyAndOrderFront:nil];
}

-(IBAction)showFilterWindow:(id)sender
{
    if(filterWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Filter.nib" owner:self])
        {
            NSLog(@"Couldn't load Filter.nib");
        }
    }
    [filterWindow setFrameAutosaveName:@"FilterWindow"];
    [filterWindow setBackgroundColor:novaColour];
    [filterWindow makeKeyAndOrderFront:nil];
}

-(IBAction)showMidiWindow:(id)sender
{
    if(midiWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Midi.nib" owner:self])
        {
            NSLog(@"Couldn't load Midi.nib");
        }
    }
    [midiWindow setFrameAutosaveName:@"MidiWindow"];
    [midiWindow setBackgroundColor:novaColour];
    [partMidi selectCellWithTag:channel];
    [midiWindow makeKeyAndOrderFront:nil];
}

-(IBAction)showLFO1ControlsWindow:(id)sender
{
    if(lfo1ControlsWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"LFO1Controls.nib" owner:self])
        {
            NSLog(@"Couldn't load LFO1Controls.nib");
        }
    }
    [lfo1ControlsWindow setFrameAutosaveName:@"Lfo1ControlsWindow"];
    [lfo1ControlsWindow setBackgroundColor:novaColour];
    [lfo1ControlsWindow makeKeyAndOrderFront:nil];    
}
-(IBAction)showLFO2ControlsWindow:(id)sender
{
    if(lfo2ControlsWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"LFO2Controls.nib" owner:self])
        {
            NSLog(@"Couldn't load LFO2Controls.nib");
        }
    }
    [lfo2ControlsWindow setFrameAutosaveName:@"Lfo2ControlsWindow"];
    [lfo2ControlsWindow setBackgroundColor:novaColour];
    [lfo2ControlsWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showEnv2ControlsWindow:(id)sender
{
    if(env2ControlsWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Env2Controls.nib" owner:self])
        {
            NSLog(@"Couldn't load Env2Controls.nib");
        }
    }
    [env2ControlsWindow setFrameAutosaveName:@"Env2ControlsWindow"];
    [env2ControlsWindow setBackgroundColor:novaColour];
    [env2ControlsWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showEnv3ControlsWindow:(id)sender
{
    if(env3ControlsWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Env3Controls.nib" owner:self])
        {
            NSLog(@"Couldn't load Env3Controls.nib");
        }
    }
    [env3ControlsWindow setFrameAutosaveName:@"Env3ControlsWindow"];
    [env3ControlsWindow setBackgroundColor:novaColour];
    [env3ControlsWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showWheelControlsWindow:(id)sender
{
    if(wheelControlsWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"WheelControls.nib" owner:self])
        {
            NSLog(@"Couldn't load WheelControls.nib");
        }
    }
    [wheelControlsWindow setFrameAutosaveName:@"WheelControlsWindow"];
    [wheelControlsWindow setBackgroundColor:novaColour];
    [wheelControlsWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showAfterTouchControlsWindow:(id)sender
{
    if(afterTouchControlsWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"AfterTouchControls.nib" owner:self])
        {
            NSLog(@"Couldn't load AfterTouchControls.nib");
        }
    }
    [afterTouchControlsWindow setFrameAutosaveName:@"AfterTouchControlsWindow"];
    [afterTouchControlsWindow setBackgroundColor:novaColour];
    [afterTouchControlsWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showOsc1ControlledWindow:(id)sender
{
    if(osc1ControlledWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Osc1Controlled.nib" owner:self])
        {
            NSLog(@"Couldn't load Osc1Controlled.nib");
        }
    }
    [osc1ControlledWindow setFrameAutosaveName:@"Osc1ControlledWindow"];
    [osc1ControlledWindow setBackgroundColor:novaColour];
    [osc1ControlledWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showOsc2ControlledWindow:(id)sender
{
    if(osc2ControlledWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Osc2Controlled.nib" owner:self])
        {
            NSLog(@"Couldn't load Osc2Controlled.nib");
        }
    }
    [osc2ControlledWindow setFrameAutosaveName:@"Osc2ControlledWindow"];
    [osc2ControlledWindow setBackgroundColor:novaColour];
    [osc2ControlledWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showOsc3ControlledWindow:(id)sender
{
    if(osc3ControlledWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Osc3Controlled.nib" owner:self])
        {
            NSLog(@"Couldn't load Osc3Controlled.nib");
        }
    }
    [osc3ControlledWindow setFrameAutosaveName:@"Osc3ControlledWindow"];
    [osc3ControlledWindow setBackgroundColor:novaColour];
    [osc3ControlledWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showNoiseControlledWindow:(id)sender
{
    if(noiseControlledWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"NoiseControlled.nib" owner:self])
        {
            NSLog(@"Couldn't load NoiseControlled.nib");
        }
    }
    [noiseControlledWindow setFrameAutosaveName:@"NoiseControlledWindow"];
    [noiseControlledWindow setBackgroundColor:novaColour];
    [noiseControlledWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showRing13ControlledWindow:(id)sender
{
    if(ring13ControlledWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Ring13Controlled.nib" owner:self])
        {
            NSLog(@"Couldn't load Ring13Controlled.nib");
        }
    }
    [ring13ControlledWindow setFrameAutosaveName:@"Ring13ControlledWindow"];
    [ring13ControlledWindow setBackgroundColor:novaColour];
    [ring13ControlledWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showRing23ControlledWindow:(id)sender
{
    if(ring23ControlledWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"Ring23Controlled.nib" owner:self])
        {
            NSLog(@"Couldn't load Ring23Controlled.nib");
        }
    }
    [ring23ControlledWindow setFrameAutosaveName:@"Ring23ControlledWindow"];
    [ring23ControlledWindow setBackgroundColor:novaColour];
    [ring23ControlledWindow makeKeyAndOrderFront:nil];    
}

-(IBAction)showFilterControlledWindow:(id)sender
{
    if(filterControlledWindow==nil)
    {
        if(![NSBundle loadNibNamed:@"FilterControlled.nib" owner:self])
        {
            NSLog(@"Couldn't load FilterControlled.nib");
        }
    }
    [filterControlledWindow setFrameAutosaveName:@"FilterControlledWindow"];
    [filterControlledWindow setBackgroundColor:novaColour];
    [filterControlledWindow makeKeyAndOrderFront:nil]; 
}

-(IBAction)sendMidi:(id)sender
{
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;
    MIDIPacket *packet;
    int i;
    packet=MIDIPacketListInit (packetList);
    NSArray *temp=[[sender stringValue] componentsSeparatedByString:@" "];
    NSLog(@"%d bytes:-------------------------",[temp count]);
    for(i=0;i<[temp count];i++)
    {
        midiMessage[i]=[[temp objectAtIndex:i] intValue];
        NSLog(@" %d",midiMessage[i]);
    }   
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,0,i,midiMessage);
    [destination processMIDIPacketList:packetList sender:self];
    
}

-(IBAction)requestProg:(id)sender
{
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;
    MIDIPacket *packet;
    packet=MIDIPacketListInit (packetList);
    midiMessage[0]=240;
    midiMessage[1]=0;
    midiMessage[2]=32;
    midiMessage[3]=41;
    midiMessage[4]=1;
    midiMessage[5]=33;
    midiMessage[6]=7;
    midiMessage[7]=3;
    midiMessage[8]=247;    
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,0,9,midiMessage);
    [destination processMIDIPacketList:packetList sender:self];
}
-(void)sendMidiNoteOn
{
    //NSLog(@"sendMidiOn");
    //[self display2InsertText:[NSString localizedStringWithFormat:@"\nSend Midi Note On"]];

    //[display2 insertText:[NSString localizedStringWithFormat:@"\nSend Midi Note On"]];
}

-(void)sendMidiNoteOff
{
    NSLog(@"sendMidiOff");
    [display2 insertText:[NSString localizedStringWithFormat:@"\nSend Midi Note Off"]];

}

-(void)nrpnIn:(id)progr number:(Byte)number value:(Byte)value
{
    [display2 insertText:[NSString localizedStringWithFormat:@"\nNRPN:%d:%d",number,value]];
    switch(number)
    {
#include "GeneratedFiles/NrpnCases2"                
#include "GeneratedFiles/NrpnCases"
    }
    //[self initAll];
}

-(void)ccIn:(id)progr number:(Byte)number value:(Byte)value
{
    [display2 insertText:[NSString localizedStringWithFormat:@"\nCC:%d:%d",number,value]];
    switch(number)
    {
#include "GeneratedFiles/CcCases"        
    }
    //[self initAll];
}

#include "GeneratedFiles/IBActions"

-(IBAction)channelButtonsIn:(id)sender
{
    channel=[sender selectedTag];
    [defaults setInteger:channel forKey:@"channel"];
    [display2 insertText:[NSString localizedStringWithFormat:@"Channel:%d",channel]];
}

/*-(IBAction)osc1FineTextIn:(id)sender
{
    // This doesn't seem to work prob cos I removed the text field?
    // Also can't figure out how to make it possible to automatically generate it
    // Need to modify it whenever the IBAction template changes
    [osc1Fine setIntValue:[sender intValue]];
    MIDITimeStamp now = 0;
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;
    MIDIPacket *packet;
    packet=MIDIPacketListInit (packetList);
    midiMessage[0]=175+channel;
    midiMessage[2]=[sender intValue];
    midiMessage[1]=11;
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,now,3,midiMessage);
    [program setOsc1Fine:[sender intValue]];
    [destination processMIDIPacketList:packetList sender:self];
    [display2 insertText:[NSString localizedStringWithFormat:@"\nCC %d %d %d",midiMessage[0],midiMessage[1],midiMessage[2]]];
}*/


@end
