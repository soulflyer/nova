#import "NovaController.h"
#import <PYMIDI/PYMIDIManager.h>
#import <PYMIDI/PYMIDIEndpoint.h>
#import "MIDICONST.h"
#import "IWNovaColour.h"

@implementation NovaController
-(id)getColour
{
    return novaColour;
}
// This gets called when MIDI Data arrives
- (void)processMIDIPacketList:(MIDIPacketList*)packetList sender:(id)sender
{
    MIDIPacket *packet;
    int i,j;
    //[destination processMIDIPacketList:packetList sender:self];
    // Handle the MIDI data in here
    packet = &packetList->packet[0];
    for (i = 0; i < packetList->numPackets; ++i) 
    {
        // Display the raw midi data
        /*[display2 insertText:[NSString localizedStringWithFormat:@"\n\n ++%d:",packet->length]];
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
            // We have a complete nrpn message here
            [self nrpnIn:program number:messageBuffer[2] value:messageBuffer[5]];
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
                        // We have a complete CC message here
                        [self ccIn:program number:messageBuffer[1] value:messageBuffer[2]];
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
            messageComplete=false;
            [display2 insertText:[NSString localizedStringWithFormat:@"Sysex:%d:",messageCounter]];
            for (j=0;j<messageCounter;j++)
            {
                [display2 insertText:[NSString localizedStringWithFormat:@"-%d ",messageBuffer[j]]];
            }
            messageCounter=0;
        }
        packet = MIDIPacketNext(packet);
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

-(void)awakeFromNib
{
    [mainWindow setBackgroundColor:novaColour];
    [display2 setTextColor:[NSColor blueColor]];
    [display setTextColor:[NSColor blueColor]];
    [self connectToMidi];
    [cableView setProg:program];
    
    //Initialize all the GraphButton displays etc
    [filter drawFilter:[program filterType] slope:[program filterDB] frequency:[program filterFrequency] resonance:[program filterResonance]];
    
    [osc1PitchText setIntValue:([program osc1Oct]-32)*12+[program osc1Semi]-57];
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
    
    //[cableView drawNoiseWithSoften:[program noiseSoften]];
    //[cableView drawOsc1PitchWheel:6];
    
    //[cableView setNeedsDisplay:yes];
}

-(IBAction)showEnv2Window:(id)sender
{
    if(env2Window==nil)
    {
        if(![NSBundle loadNibNamed:@"Env2.nib" owner:self])
        {
            NSLog(@"Couldn't load Env2.nib");
        }
    }
    [env2Window setBackgroundColor:novaColour];
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
    [env1Window setBackgroundColor:novaColour];
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
    [env3Window setBackgroundColor:novaColour];
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
    [lfo1Window setBackgroundColor:novaColour];
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
    [lfo2Window setBackgroundColor:novaColour];
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
    [osc1Window setBackgroundColor:novaColour];
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
    [osc2Window setBackgroundColor:novaColour];
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
    [osc3Window setBackgroundColor:novaColour];
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
    [midiWindow setBackgroundColor:novaColour];
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
    [filterControlledWindow setBackgroundColor:novaColour];
    [filterControlledWindow makeKeyAndOrderFront:nil];    
}

-(void)sendMidiNoteOn
{
    NSLog(@"sendMidiOn");
}

-(void)sendMidiNoteOff
{
    NSLog(@"sendMidiOff");
}

-(id)init
{
    self=[super init];
    novaColour=[NSColor novaBodyColour];
    channel=8;
    program=[[IWProg alloc] init];
    //[cableView setProg:program];
    return self;
}

-(void)nrpnIn:(id)progr number:(Byte)number value:(Byte)value
{
    [display2 insertText:[NSString localizedStringWithFormat:@"\nNRPN:%d:%d",number,value]];
    switch(number)
    {
        case 0:
            switch(value)
            {
#include "GeneratedFiles/Nrpn0Cases"                
            }
            break;
        case 1:
            switch(value)
            {
#include "GeneratedFiles/Nrpn1Cases"                
            }
        case 84:
            switch(value)
            {
#include "GeneratedFiles/Nrpn84Cases"                
            }
            break;
        case 100:
            switch(value)
            {
#include "GeneratedFiles/Nrpn100Cases"                
            }
        case 109:
            switch(value)
            {
#include "GeneratedFiles/Nrpn109Cases"                
            }
            break;
        case 113:
            switch(value)
            {
#include "GeneratedFiles/Nrpn113Cases"                
            }
            
                
#include "GeneratedFiles/NrpnCases"
    }
}

-(void)ccIn:(id)progr number:(Byte)number value:(Byte)value
{
    [display2 insertText:[NSString localizedStringWithFormat:@"\nCC:%d:%d",number,value]];
    switch(number)
    {
#include "GeneratedFiles/CcCases"        
    }
}

#include "GeneratedFiles/IBActions"

-(IBAction)osc1FineTextIn:(id)sender
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
}

@end
