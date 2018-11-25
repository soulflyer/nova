#import "IWCableView.h"
#import "IWNovaColour.h"

@implementation IWCableView

- (id)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect]) != nil) 
        {
            //these are the heights above the baseline of the IWCableView of the
            //various synth elements. Work em out from the IB size values
            y0=[self bounds].origin.y;
            y1=[self bounds].origin.y+66;
            y2=[self bounds].origin.y+[self bounds].size.height;
            
            maxLineWidth=14;
            offset=maxLineWidth+16;
            
            lfo1X=[self bounds].origin.x+88;
            lfo2X=[self bounds].origin.x+1121;
            env2X=[self bounds].origin.x+529;
            env3X=[self bounds].origin.x+717;
            wheelX=[self bounds].origin.x+338;
            afterTouchX=[self bounds].origin.x+912;
            
            noiseX=[self bounds].origin.x+88;
            osc1X=[self bounds].origin.x+272;
            osc2X=[self bounds].origin.x+750;
            osc3X=[self bounds].origin.x+511;
            env1X=[self bounds].origin.x+935;
            filterX=[self bounds].origin.x+1119;
            ring13X=[self bounds].origin.x+394;
            ring23X=[self bounds].origin.x+630;
            
            // Use the file "GeneratedFiles/IWCableViewVariablesInit" as a starting point for these initialisations
            // It is automaticaly generated during a build with all the correct variables, but initialised to 0
            
            osc1PitchLfo2Start=NSMakePoint(lfo2X,y1);
            osc1PitchLfo2End=NSMakePoint(osc1X,y2);
            osc1PitchLfo2Colour=[NSColor novaLineColour];
            
            osc1PitchWheelStart=NSMakePoint(wheelX,y0);
            osc1PitchWheelEnd=NSMakePoint(osc1X,y2);
            osc1PitchWheelColour=[NSColor novaLineColour];
            
            osc1WidthEnv3Start=NSMakePoint(env3X,y0);
            osc1WidthEnv3End=NSMakePoint(osc1X+2*offset,y2);
            osc1WidthEnv3Colour=[NSColor novaLineColour];
            
            osc1WidthWheelStart=NSMakePoint(wheelX,y0);
            osc1WidthWheelEnd=NSMakePoint(osc1X+2*offset,y2);
            osc1WidthWheelColour=[NSColor novaLineColour];
            
            osc1SyncEnv3Start=NSMakePoint(env3X,y0);
            osc1SyncEnv3End=NSMakePoint(osc1X+offset,y2);
            osc1SyncEnv3Colour=[NSColor novaLineColour];
            
            osc1SyncLfo2Start=NSMakePoint(lfo2X,y1);
            osc1SyncLfo2End=NSMakePoint(osc1X+offset,y2);
            osc1SyncLfo2Colour=[NSColor novaLineColour];
            
            osc1SyncWheelStart=NSMakePoint(wheelX,y0);
            osc1SyncWheelEnd=NSMakePoint(osc1X+offset,y2);
            osc1SyncWheelColour=[NSColor novaLineColour];
            
            osc1SoftenEnv3Start=NSMakePoint(env3X,y0);
            osc1SoftenEnv3End=NSMakePoint(osc1X-offset,y2);
            osc1SoftenEnv3Colour=[NSColor novaLineColour];
            
            osc1SoftenLfo1Start=NSMakePoint(lfo1X,y1);
            osc1SoftenLfo1End=NSMakePoint(osc1X-offset,y2);
            osc1SoftenLfo1Colour=[NSColor novaLineColour];
            
            osc1SoftenLfo2Start=NSMakePoint(lfo2X,y1);
            osc1SoftenLfo2End=NSMakePoint(osc1X-offset,y2);
            osc1SoftenLfo2Colour=[NSColor novaLineColour];
            
            osc1SoftenWheelStart=NSMakePoint(wheelX,y0);
            osc1SoftenWheelEnd=NSMakePoint(osc1X-offset,y2);
            osc1SoftenWheelColour=[NSColor novaLineColour];
            
            osc1MixEnv3Start=NSMakePoint(env3X,y0);
            osc1MixEnv3End=NSMakePoint(osc1X-2*offset,y2);
            osc1MixEnv3Colour=[NSColor novaLineColour];
            
            osc1MixLfo1Start=NSMakePoint(lfo1X,y1);
            osc1MixLfo1End=NSMakePoint(osc1X-2*offset,y2);
            osc1MixLfo1Colour=[NSColor novaLineColour];
            
            osc1MixLfo2Start=NSMakePoint(lfo2X,y1);
            osc1MixLfo2End=NSMakePoint(osc1X-2*offset,y2);
            osc1MixLfo2Colour=[NSColor novaLineColour];
            
            osc1MixWheelStart=NSMakePoint(wheelX,y0);
            osc1MixWheelEnd=NSMakePoint(osc1X-2*offset,y2);
            osc1MixWheelColour=[NSColor novaLineColour];
            
            osc2PitchLfo2Start=NSMakePoint(lfo2X,y1);
            osc2PitchLfo2End=NSMakePoint(osc2X,y2);
            osc2PitchLfo2Colour=[NSColor novaLineColour];
            
            osc2PitchWheelStart=NSMakePoint(wheelX,y0);
            osc2PitchWheelEnd=NSMakePoint(osc2X,y2);
            osc2PitchWheelColour=[NSColor novaLineColour];
            
            osc2WidthEnv3Start=NSMakePoint(env3X,y0);
            osc2WidthEnv3End=NSMakePoint(osc2X+2*offset,y2);
            osc2WidthEnv3Colour=[NSColor novaLineColour];
            
            osc2WidthWheelStart=NSMakePoint(wheelX,y0);
            osc2WidthWheelEnd=NSMakePoint(osc2X+2*offset,y2);
            osc2WidthWheelColour=[NSColor novaLineColour];
            
            osc2SyncEnv3Start=NSMakePoint(env3X,y0);
            osc2SyncEnv3End=NSMakePoint(osc2X+offset,y2);
            osc2SyncEnv3Colour=[NSColor novaLineColour];
            
            osc2SyncLfo2Start=NSMakePoint(lfo2X,y1);
            osc2SyncLfo2End=NSMakePoint(osc2X+offset,y2);
            osc2SyncLfo2Colour=[NSColor novaLineColour];
            
            osc2SyncWheelStart=NSMakePoint(wheelX,y0);
            osc2SyncWheelEnd=NSMakePoint(osc2X+offset,y2);
            osc2SyncWheelColour=[NSColor novaLineColour];
            
            osc2SoftenEnv3Start=NSMakePoint(env3X,y0);
            osc2SoftenEnv3End=NSMakePoint(osc2X-offset,y2);
            osc2SoftenEnv3Colour=[NSColor novaLineColour];
            
            osc2SoftenLfo1Start=NSMakePoint(lfo1X,y1);
            osc2SoftenLfo1End=NSMakePoint(osc2X-offset,y2);
            osc2SoftenLfo1Colour=[NSColor novaLineColour];
            
            osc2SoftenLfo2Start=NSMakePoint(lfo2X,y1);
            osc2SoftenLfo2End=NSMakePoint(osc2X-offset,y2);
            osc2SoftenLfo2Colour=[NSColor novaLineColour];
            
            osc2SoftenWheelStart=NSMakePoint(wheelX,y0);
            osc2SoftenWheelEnd=NSMakePoint(osc2X-offset,y2);
            osc2SoftenWheelColour=[NSColor novaLineColour];
            
            osc2MixEnv3Start=NSMakePoint(env3X,y0);
            osc2MixEnv3End=NSMakePoint(osc2X-2*offset,y2);
            osc2MixEnv3Colour=[NSColor novaLineColour];
            
            osc2MixLfo1Start=NSMakePoint(lfo1X,y1);
            osc2MixLfo1End=NSMakePoint(osc2X-2*offset,y2);
            osc2MixLfo1Colour=[NSColor novaLineColour];
            
            osc2MixLfo2Start=NSMakePoint(lfo2X,y1);
            osc2MixLfo2End=NSMakePoint(osc2X-2*offset,y2);
            osc2MixLfo2Colour=[NSColor novaLineColour];
            
            osc2MixWheelStart=NSMakePoint(wheelX,y0);
            osc2MixWheelEnd=NSMakePoint(osc2X-2*offset,y2);
            osc2MixWheelColour=[NSColor novaLineColour];
            
            osc3PitchLfo2Start=NSMakePoint(lfo2X,y1);
            osc3PitchLfo2End=NSMakePoint(osc3X,y2);
            osc3PitchLfo2Colour=[NSColor novaLineColour];
            
            osc3PitchWheelStart=NSMakePoint(wheelX,y0);
            osc3PitchWheelEnd=NSMakePoint(osc3X,y2);
            osc3PitchWheelColour=[NSColor novaLineColour];
            
            osc3WidthEnv3Start=NSMakePoint(env3X,y0);
            osc3WidthEnv3End=NSMakePoint(osc3X+2*offset,y2);
            osc3WidthEnv3Colour=[NSColor novaLineColour];
            
            osc3WidthWheelStart=NSMakePoint(wheelX,y0);
            osc3WidthWheelEnd=NSMakePoint(osc3X+2*offset,y2);
            osc3WidthWheelColour=[NSColor novaLineColour];
            
            osc3SyncEnv3Start=NSMakePoint(env3X,y0);
            osc3SyncEnv3End=NSMakePoint(osc3X+offset,y2);
            osc3SyncEnv3Colour=[NSColor novaLineColour];
            
            osc3SyncLfo2Start=NSMakePoint(lfo2X,y1);
            osc3SyncLfo2End=NSMakePoint(osc3X+offset,y2);
            osc3SyncLfo2Colour=[NSColor novaLineColour];
            
            osc3SyncWheelStart=NSMakePoint(wheelX,y0);
            osc3SyncWheelEnd=NSMakePoint(osc3X+offset,y2);
            osc3SyncWheelColour=[NSColor novaLineColour];
            
            osc3SoftenEnv3Start=NSMakePoint(env3X,y0);
            osc3SoftenEnv3End=NSMakePoint(osc3X-offset,y2);
            osc3SoftenEnv3Colour=[NSColor novaLineColour];
            
            osc3SoftenLfo1Start=NSMakePoint(lfo1X,y1);
            osc3SoftenLfo1End=NSMakePoint(osc3X-offset,y2);
            osc3SoftenLfo1Colour=[NSColor novaLineColour];
            
            osc3SoftenLfo2Start=NSMakePoint(lfo2X,y1);
            osc3SoftenLfo2End=NSMakePoint(osc3X-offset,y2);
            osc3SoftenLfo2Colour=[NSColor novaLineColour];
            
            osc3SoftenWheelStart=NSMakePoint(wheelX,y0);
            osc3SoftenWheelEnd=NSMakePoint(osc3X-offset,y2);
            osc3SoftenWheelColour=[NSColor novaLineColour];
            
            osc3MixEnv3Start=NSMakePoint(env3X,y0);
            osc3MixEnv3End=NSMakePoint(osc3X-2*offset,y2);
            osc3MixEnv3Colour=[NSColor novaLineColour];
            
            osc3MixLfo1Start=NSMakePoint(lfo1X,y1);
            osc3MixLfo1End=NSMakePoint(osc3X-2*offset,y2);
            osc3MixLfo1Colour=[NSColor novaLineColour];
            
            osc3MixLfo2Start=NSMakePoint(lfo2X,y1);
            osc3MixLfo2End=NSMakePoint(osc3X-2*offset,y2);
            osc3MixLfo2Colour=[NSColor novaLineColour];
            
            osc3MixWheelStart=NSMakePoint(wheelX,y0);
            osc3MixWheelEnd=NSMakePoint(osc3X-2*offset,y2);
            osc3MixWheelColour=[NSColor novaLineColour];
            
            ringMod13MixEnv2Start=NSMakePoint(env2X,y0);
            ringMod13MixEnv2End=NSMakePoint(ring13X,y2);
            ringMod13MixEnv2Colour=[NSColor novaLineColour];
            
            ringMod13MixEnv3Start=NSMakePoint(env3X,y0);
            ringMod13MixEnv3End=NSMakePoint(ring13X,y2);
            ringMod13MixEnv3Colour=[NSColor novaLineColour];
            
            ringMod13MixLfo1Start=NSMakePoint(lfo1X,y1);
            ringMod13MixLfo1End=NSMakePoint(ring13X,y2);
            ringMod13MixLfo1Colour=[NSColor novaLineColour];
            
            ringMod13MixLfo2Start=NSMakePoint(lfo2X,y1);
            ringMod13MixLfo2End=NSMakePoint(ring13X,y2);
            ringMod13MixLfo2Colour=[NSColor novaLineColour];
            
            ringMod13MixWheelStart=NSMakePoint(wheelX,y0);
            ringMod13MixWheelEnd=NSMakePoint(ring13X,y2);
            ringMod13MixWheelColour=[NSColor novaLineColour];
            
            ringMod23MixEnv2Start=NSMakePoint(env2X,y0);
            ringMod23MixEnv2End=NSMakePoint(ring23X,y2);
            ringMod23MixEnv2Colour=[NSColor novaLineColour];
            
            ringMod23MixEnv3Start=NSMakePoint(env3X,y0);
            ringMod23MixEnv3End=NSMakePoint(ring23X,y2);
            ringMod23MixEnv3Colour=[NSColor novaLineColour];
            
            ringMod23MixLfo1Start=NSMakePoint(lfo1X,y1);
            ringMod23MixLfo1End=NSMakePoint(ring23X,y2);
            ringMod23MixLfo1Colour=[NSColor novaLineColour];
            
            ringMod23MixLfo2Start=NSMakePoint(lfo2X,y1);
            ringMod23MixLfo2End=NSMakePoint(ring23X,y2);
            ringMod23MixLfo2Colour=[NSColor novaLineColour];
            
            ringMod23MixWheelStart=NSMakePoint(wheelX,y0);
            ringMod23MixWheelEnd=NSMakePoint(ring23X,y2);
            ringMod23MixWheelColour=[NSColor novaLineColour];
            
            noiseSoftenEnv2Start=NSMakePoint(env2X,y0);
            noiseSoftenEnv2End=NSMakePoint(noiseX+offset,y2);
            noiseSoftenEnv2Colour=[NSColor novaLineColour];
            
            noiseSoftenEnv3Start=NSMakePoint(env3X,y0);
            noiseSoftenEnv3End=NSMakePoint(noiseX+offset,y2);
            noiseSoftenEnv3Colour=[NSColor novaLineColour];
            
            noiseSoftenLfo1Start=NSMakePoint(lfo1X,y1);
            noiseSoftenLfo1End=NSMakePoint(noiseX+offset,y2);
            noiseSoftenLfo1Colour=[NSColor novaLineColour];
            
            noiseSoftenLfo2Start=NSMakePoint(lfo2X,y1);
            noiseSoftenLfo2End=NSMakePoint(noiseX+offset,y2);
            noiseSoftenLfo2Colour=[NSColor novaLineColour];
            
            noiseSoftenWheelStart=NSMakePoint(wheelX,y0);
            noiseSoftenWheelEnd=NSMakePoint(noiseX+offset,y2);
            noiseSoftenWheelColour=[NSColor novaLineColour];
            
            noiseMixEnv3Start=NSMakePoint(env3X,y0);
            noiseMixEnv3End=NSMakePoint(noiseX,y2);
            noiseMixEnv3Colour=[NSColor novaLineColour];
            
            noiseMixLfo1Start=NSMakePoint(lfo1X,y1);
            noiseMixLfo1End=NSMakePoint(noiseX,y2);
            noiseMixLfo1Colour=[NSColor novaLineColour];
            
            noiseMixLfo2Start=NSMakePoint(lfo2X,y1);
            noiseMixLfo2End=NSMakePoint(noiseX,y2);
            noiseMixLfo2Colour=[NSColor novaLineColour];
            
            noiseMixWheelStart=NSMakePoint(wheelX,y0);
            noiseMixWheelEnd=NSMakePoint(noiseX,y2);
            noiseMixWheelColour=[NSColor novaLineColour];
            
            osc1WheelLfo1Start=NSMakePoint(lfo1X,y1);
            osc1WheelLfo1End=NSMakePoint(wheelX,y0);
            osc1WheelLfo1Colour=[NSColor novaLineColour];
            
            osc2WheelLfo1Start=NSMakePoint(lfo1X,y1);
            osc2WheelLfo1End=NSMakePoint(wheelX,y0);
            osc2WheelLfo1Colour=[NSColor novaLineColour];
            
            osc3WheelLfo1Start=NSMakePoint(lfo1X,y1);
            osc3WheelLfo1End=NSMakePoint(wheelX,y0);
            osc3WheelLfo1Colour=[NSColor novaLineColour];
            
            osc1AfterTouchLfo1Start=NSMakePoint(afterTouchX,y0);
            osc1AfterTouchLfo1End=NSMakePoint(osc1X,y2);
            osc1AfterTouchLfo1Colour=[NSColor novaLineColour];
            
            osc2AfterTouchLfo1Start=NSMakePoint(afterTouchX,y0);
            osc2AfterTouchLfo1End=NSMakePoint(osc2X,y2);
            osc2AfterTouchLfo1Colour=[NSColor novaLineColour];
            
            osc3AfterTouchLfo1Start=NSMakePoint(afterTouchX,y0);
            osc3AfterTouchLfo1End=NSMakePoint(osc3X,y2);
            osc3AfterTouchLfo1Colour=[NSColor novaLineColour];
            
            lfo1AfterTouchSpeedModStart=NSMakePoint(afterTouchX,y0);
            lfo1AfterTouchSpeedModEnd=NSMakePoint(lfo1X,y2);
            lfo1AfterTouchSpeedModColour=[NSColor novaLineColour];
            
            lfo2AfterTouchSpeedModStart=NSMakePoint(afterTouchX,y0);
            lfo2AfterTouchSpeedModEnd=NSMakePoint(lfo2X,y2);
            lfo2AfterTouchSpeedModColour=[NSColor novaLineColour];
            
            filterFrequencyWheelStart=NSMakePoint(wheelX,y0);
            filterFrequencyWheelEnd=NSMakePoint(filterX-offset,y2);
            filterFrequencyWheelColour=[NSColor novaLineColour];
            
            filterResonanceWheelStart=NSMakePoint(wheelX,y0);
            filterResonanceWheelEnd=NSMakePoint(filterX,y2);
            filterResonanceWheelColour=[NSColor novaLineColour];
            
            filterFrequencyWheelLfo2Start=NSMakePoint(wheelX,y0);
            filterFrequencyWheelLfo2End=NSMakePoint(filterX-offset,y2);
            filterFrequencyWheelLfo2Colour=[NSColor novaLineColour];
            
            filterResonanceWheelLfo2Start=NSMakePoint(wheelX,y0);
            filterResonanceWheelLfo2End=NSMakePoint(filterX,y2);
            filterResonanceWheelLfo2Colour=[NSColor novaLineColour];
            
            filterFrequencyAfterTouchLfo2Start=NSMakePoint(afterTouchX,y0);
            filterFrequencyAfterTouchLfo2End=NSMakePoint(filterX-offset,y2);
            filterFrequencyAfterTouchLfo2Colour=[NSColor novaLineColour];
            
            filterResonanceAfterTouchLfo2Start=NSMakePoint(afterTouchX,y0);
            filterResonanceAfterTouchLfo2End=NSMakePoint(filterX,y2);
            filterResonanceAfterTouchLfo2Colour=[NSColor novaLineColour];
            
            filterFrequencyAfterTouchStart=NSMakePoint(afterTouchX,y0);
            filterFrequencyAfterTouchEnd=NSMakePoint(filterX-offset,y2);
            filterFrequencyAfterTouchColour=[NSColor novaLineColour];
            
            filterResonanceAfterTouchStart=NSMakePoint(afterTouchX,y0);
            filterResonanceAfterTouchEnd=NSMakePoint(filterX,y2);
            filterResonanceAfterTouchColour=[NSColor novaLineColour];
            
            lfo1WheelSpeedModStart=NSMakePoint(wheelX,y0);
            lfo1WheelSpeedModEnd=NSMakePoint(lfo1X,y2);
            lfo1WheelSpeedModColour=[NSColor novaLineColour];
            
            lfo2WheelSpeedModStart=NSMakePoint(wheelX,y0);
            lfo2WheelSpeedModEnd=NSMakePoint(lfo2X,y2);
            lfo2WheelSpeedModColour=[NSColor novaLineColour];
            
            osc1PitchEnv2Start=NSMakePoint(env2X,y0);
            osc1PitchEnv2End=NSMakePoint(osc1X,y2);
            osc1PitchEnv2Colour=[NSColor novaLineColour];
            
            osc1PitchEnv3Start=NSMakePoint(env3X,y0);
            osc1PitchEnv3End=NSMakePoint(osc1X,y2);
            osc1PitchEnv3Colour=[NSColor novaLineColour];
            
            osc1PitchLfo1Start=NSMakePoint(lfo1X,y1);
            osc1PitchLfo1End=NSMakePoint(osc1X,y2);
            osc1PitchLfo1Colour=[NSColor novaLineColour];
            
            osc1SoftenEnv2Start=NSMakePoint(env2X,y0);
            osc1SoftenEnv2End=NSMakePoint(osc1X-offset,y2);
            osc1SoftenEnv2Colour=[NSColor novaLineColour];
            
            osc1WidthEnv2Start=NSMakePoint(env2X,y0);
            osc1WidthEnv2End=NSMakePoint(osc1X+2*offset,y2);
            osc1WidthEnv2Colour=[NSColor novaLineColour];
            
            osc1WidthLfo1Start=NSMakePoint(lfo1X,y1);
            osc1WidthLfo1End=NSMakePoint(osc1X+2*offset,y2);
            osc1WidthLfo1Colour=[NSColor novaLineColour];
            
            osc1WidthLfo2Start=NSMakePoint(lfo2X,y1);
            osc1WidthLfo2End=NSMakePoint(osc1X+2*offset,y2);
            osc1WidthLfo2Colour=[NSColor novaLineColour];
            
            osc1SyncEnv2Start=NSMakePoint(env2X,y0);
            osc1SyncEnv2End=NSMakePoint(osc1X+offset,y2);
            osc1SyncEnv2Colour=[NSColor novaLineColour];
            
            osc1SyncLfo1Start=NSMakePoint(lfo1X,y1);
            osc1SyncLfo1End=NSMakePoint(osc1X+offset,y2);
            osc1SyncLfo1Colour=[NSColor novaLineColour];
            
            osc2PitchEnv2Start=NSMakePoint(env2X,y0);
            osc2PitchEnv2End=NSMakePoint(osc2X,y2);
            osc2PitchEnv2Colour=[NSColor novaLineColour];
            
            osc2PitchEnv3Start=NSMakePoint(env3X,y0);
            osc2PitchEnv3End=NSMakePoint(osc2X,y2);
            osc2PitchEnv3Colour=[NSColor novaLineColour];
            
            osc2PitchLfo1Start=NSMakePoint(lfo1X,y1);
            osc2PitchLfo1End=NSMakePoint(osc2X,y2);
            osc2PitchLfo1Colour=[NSColor novaLineColour];
            
            osc2SoftenEnv2Start=NSMakePoint(env2X,y0);
            osc2SoftenEnv2End=NSMakePoint(osc2X-offset,y2);
            osc2SoftenEnv2Colour=[NSColor novaLineColour];
            
            osc2WidthEnv2Start=NSMakePoint(env2X,y0);
            osc2WidthEnv2End=NSMakePoint(osc2X+2*offset,y2);
            osc2WidthEnv2Colour=[NSColor novaLineColour];
            
            osc2WidthLfo1Start=NSMakePoint(lfo1X,y1);
            osc2WidthLfo1End=NSMakePoint(osc2X+2*offset,y2);
            osc2WidthLfo1Colour=[NSColor novaLineColour];
            
            osc2WidthLfo2Start=NSMakePoint(lfo2X,y1);
            osc2WidthLfo2End=NSMakePoint(osc2X+2*offset,y2);
            osc2WidthLfo2Colour=[NSColor novaLineColour];
            
            osc2SyncEnv2Start=NSMakePoint(env2X,y1);
            osc2SyncEnv2End=NSMakePoint(osc2X+offset,y2);
            osc2SyncEnv2Colour=[NSColor novaLineColour];
            
            osc2SyncLfo1Start=NSMakePoint(lfo1X,y1);
            osc2SyncLfo1End=NSMakePoint(osc2X+offset,y2);
            osc2SyncLfo1Colour=[NSColor novaLineColour];

            osc3PitchEnv2Start=NSMakePoint(env2X,y0);
            osc3PitchEnv2End=NSMakePoint(osc3X,y2);
            osc3PitchEnv2Colour=[NSColor novaLineColour];
            
            osc3PitchEnv3Start=NSMakePoint(env3X,y0);
            osc3PitchEnv3End=NSMakePoint(osc3X,y2);
            osc3PitchEnv3Colour=[NSColor novaLineColour];
            
            osc3PitchLfo1Start=NSMakePoint(lfo1X,y1);
            osc3PitchLfo1End=NSMakePoint(osc3X,y2);
            osc3PitchLfo1Colour=[NSColor novaLineColour];

            osc3SoftenEnv2Start=NSMakePoint(env2X,y0);
            osc3SoftenEnv2End=NSMakePoint(osc3X-offset,y2);
            osc3SoftenEnv2Colour=[NSColor novaLineColour];
            
            osc3WidthEnv2Start=NSMakePoint(env2X,y0);
            osc3WidthEnv2End=NSMakePoint(osc3X+2*offset,y2);
            osc3WidthEnv2Colour=[NSColor novaLineColour];
            
            osc3WidthLfo1Start=NSMakePoint(lfo1X,y1);
            osc3WidthLfo1End=NSMakePoint(osc3X+2*offset,y2);
            osc3WidthLfo1Colour=[NSColor novaLineColour];
            
            osc3WidthLfo2Start=NSMakePoint(lfo2X,y1);
            osc3WidthLfo2End=NSMakePoint(osc3X+2*offset,y2);
            osc3WidthLfo2Colour=[NSColor novaLineColour];
            
            osc3SyncEnv2Start=NSMakePoint(env2X,y0);
            osc3SyncEnv2End=NSMakePoint(osc3X+offset,y2);
            osc3SyncEnv2Colour=[NSColor novaLineColour];
            
            osc3SyncLfo1Start=NSMakePoint(lfo1X,y1);
            osc3SyncLfo1End=NSMakePoint(osc3X+offset,y2);
            osc3SyncLfo1Colour=[NSColor novaLineColour];
            
            osc1MixEnv2Start=NSMakePoint(env2X,y0);
            osc1MixEnv2End=NSMakePoint(osc3X-2*offset,y2);
            osc1MixEnv2Colour=[NSColor novaLineColour];
            
            osc2MixEnv2Start=NSMakePoint(env2X,y0);
            osc2MixEnv2End=NSMakePoint(osc2X-2*offset,y2);
            osc2MixEnv2Colour=[NSColor novaLineColour];
            
            osc3MixEnv2Start=NSMakePoint(env2X,y0);
            osc3MixEnv2End=NSMakePoint(osc3X-2*offset,y2);
            osc3MixEnv2Colour=[NSColor novaLineColour];
            
            filterFrequencyEnv2Start=NSMakePoint(env2X,y0);
            filterFrequencyEnv2End=NSMakePoint(filterX-offset,y2);
            filterFrequencyEnv2Colour=[NSColor novaLineColour];
            
            filterFrequencyEnv3Start=NSMakePoint(env3X,y0);
            filterFrequencyEnv3End=NSMakePoint(filterX-offset,y2);
            filterFrequencyEnv3Colour=[NSColor novaLineColour];
            
            filterFrequencyLfo1Start=NSMakePoint(lfo1X,y1);
            filterFrequencyLfo1End=NSMakePoint(filterX-offset,y2);
            filterFrequencyLfo1Colour=[NSColor novaLineColour];
            
            filterFrequencyLfo2Start=NSMakePoint(lfo2X,y1);
            filterFrequencyLfo2End=NSMakePoint(filterX-offset,y2);
            filterFrequencyLfo2Colour=[NSColor novaLineColour];
            
            filterResonanceEnv2Start=NSMakePoint(env2X,y0);
            filterResonanceEnv2End=NSMakePoint(filterX,y2);
            filterResonanceEnv2Colour=[NSColor novaLineColour];
            
            filterResonanceEnv3Start=NSMakePoint(env3X,y0);
            filterResonanceEnv3End=NSMakePoint(filterX,y2);
            filterResonanceEnv3Colour=[NSColor novaLineColour];
            
            filterResonanceLfo1Start=NSMakePoint(lfo1X,y1);
            filterResonanceLfo1End=NSMakePoint(filterX,y2);
            filterResonanceLfo1Colour=[NSColor novaLineColour];
            
            filterResonanceLfo2Start=NSMakePoint(lfo2X,y1);
            filterResonanceLfo2End=NSMakePoint(filterX,y2);
            filterResonanceLfo2Colour=[NSColor novaLineColour];
            
            lfo1Env3SpeedModStart=NSMakePoint(env3X,y0);
            lfo1Env3SpeedModEnd=NSMakePoint(lfo1X,y1);
            lfo1Env3SpeedModColour=[NSColor novaLineColour];
            
            lfo2Env3SpeedModStart=NSMakePoint(env3X,y0);
            lfo2Env3SpeedModEnd=NSMakePoint(lfo2X,y1);
            lfo2Env3SpeedModColour=[NSColor novaLineColour];
            
            noiseMixEnv2Start=NSMakePoint(env2X,y0);
            noiseMixEnv2End=NSMakePoint(noiseX,y2);
            noiseMixEnv2Colour=[NSColor novaLineColour];
            
            
        }
	return self;
}

//Program needs to be set from elswhere, ie IWNovaController, so that the instance created there can be read here.
-(void)setProg:(IWProg *)progr
{
    program = progr;
}

- (void)drawRect:(NSRect)rect
{
#include "GeneratedFiles/IWCableViewDrawrect"
}
 
-(void)drawLine:(int)width colour:(NSColor *)colour start:(NSPoint)start end:(NSPoint)end
{
    if(width>0)
    {
        width=width*maxLineWidth/127;
        if (width==0)
        {
            width=1;
        }        
        NSBezierPath * path;
        path=[NSBezierPath bezierPath];
        [self lockFocus];
        [colour set];    
        [path init];
        [path setLineCapStyle:NSButtLineCapStyle];
        [path setLineWidth:width];
        [path moveToPoint:start];
        [path curveToPoint:end controlPoint1:NSMakePoint(start.x,start.y+200) controlPoint2:NSMakePoint(end.x,end.y-200)];
        [path stroke];
        [self unlockFocus];
    }
}

//-(void)drawOsc1PitchLfo2:(int)width colour:(NSColor *)colour
//{
//    [self drawLine:width colour:colour start:osc1PitchLfo2Start end:osc1PitchLfo2End];
//}
    
#include "GeneratedFiles/IWCableViewProcs"
#include "GeneratedFiles/IWCableViewSetMethods":
#include "GeneratedFiles/IWCableViewAccessMethods";
@end
