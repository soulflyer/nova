//  IWCableView.h
// Don't edit this file directly, go to the 3rd shell script build phase
// and edit that instead

#import <Cocoa/Cocoa.h>
#import "IWProg.h"

@interface IWCableView : NSView
{
   int y0, y1, y2;
   int lfo1X, lfo2X, env2X, env3X, wheelX, noiseX, osc1X, osc2X, osc3X, env1X, filterX, ring13X, ring23X, afterTouchX;
   float maxLineWidth;
   int offset;
   IWProg *program;

   NSPoint osc1PitchEnv2Start;
   NSPoint osc1PitchEnv2End;
   NSColor * osc1PitchEnv2Colour;

   NSPoint osc1PitchEnv3Start;
   NSPoint osc1PitchEnv3End;
   NSColor * osc1PitchEnv3Colour;

   NSPoint osc1PitchLfo1Start;
   NSPoint osc1PitchLfo1End;
   NSColor * osc1PitchLfo1Colour;

   NSPoint osc1SoftenEnv2Start;
   NSPoint osc1SoftenEnv2End;
   NSColor * osc1SoftenEnv2Colour;

   NSPoint osc1WidthEnv2Start;
   NSPoint osc1WidthEnv2End;
   NSColor * osc1WidthEnv2Colour;

   NSPoint osc1WidthLfo1Start;
   NSPoint osc1WidthLfo1End;
   NSColor * osc1WidthLfo1Colour;

   NSPoint osc1WidthLfo2Start;
   NSPoint osc1WidthLfo2End;
   NSColor * osc1WidthLfo2Colour;

   NSPoint osc1SyncEnv2Start;
   NSPoint osc1SyncEnv2End;
   NSColor * osc1SyncEnv2Colour;

   NSPoint osc1SyncLfo1Start;
   NSPoint osc1SyncLfo1End;
   NSColor * osc1SyncLfo1Colour;

   NSPoint osc2PitchEnv2Start;
   NSPoint osc2PitchEnv2End;
   NSColor * osc2PitchEnv2Colour;

   NSPoint osc2PitchEnv3Start;
   NSPoint osc2PitchEnv3End;
   NSColor * osc2PitchEnv3Colour;

   NSPoint osc2PitchLfo1Start;
   NSPoint osc2PitchLfo1End;
   NSColor * osc2PitchLfo1Colour;

   NSPoint osc2SoftenEnv2Start;
   NSPoint osc2SoftenEnv2End;
   NSColor * osc2SoftenEnv2Colour;

   NSPoint osc2WidthEnv2Start;
   NSPoint osc2WidthEnv2End;
   NSColor * osc2WidthEnv2Colour;

   NSPoint osc2WidthLfo1Start;
   NSPoint osc2WidthLfo1End;
   NSColor * osc2WidthLfo1Colour;

   NSPoint osc2WidthLfo2Start;
   NSPoint osc2WidthLfo2End;
   NSColor * osc2WidthLfo2Colour;

   NSPoint osc2SyncEnv2Start;
   NSPoint osc2SyncEnv2End;
   NSColor * osc2SyncEnv2Colour;

   NSPoint osc2SyncLfo1Start;
   NSPoint osc2SyncLfo1End;
   NSColor * osc2SyncLfo1Colour;

   NSPoint osc3PitchEnv2Start;
   NSPoint osc3PitchEnv2End;
   NSColor * osc3PitchEnv2Colour;

   NSPoint osc3PitchEnv3Start;
   NSPoint osc3PitchEnv3End;
   NSColor * osc3PitchEnv3Colour;

   NSPoint osc3PitchLfo1Start;
   NSPoint osc3PitchLfo1End;
   NSColor * osc3PitchLfo1Colour;

   NSPoint osc3SoftenEnv2Start;
   NSPoint osc3SoftenEnv2End;
   NSColor * osc3SoftenEnv2Colour;

   NSPoint osc3WidthEnv2Start;
   NSPoint osc3WidthEnv2End;
   NSColor * osc3WidthEnv2Colour;

   NSPoint osc3WidthLfo1Start;
   NSPoint osc3WidthLfo1End;
   NSColor * osc3WidthLfo1Colour;

   NSPoint osc3WidthLfo2Start;
   NSPoint osc3WidthLfo2End;
   NSColor * osc3WidthLfo2Colour;

   NSPoint osc3SyncEnv2Start;
   NSPoint osc3SyncEnv2End;
   NSColor * osc3SyncEnv2Colour;

   NSPoint osc3SyncLfo1Start;
   NSPoint osc3SyncLfo1End;
   NSColor * osc3SyncLfo1Colour;

   NSPoint osc1MixEnv2Start;
   NSPoint osc1MixEnv2End;
   NSColor * osc1MixEnv2Colour;

   NSPoint osc2MixEnv2Start;
   NSPoint osc2MixEnv2End;
   NSColor * osc2MixEnv2Colour;

   NSPoint osc3MixEnv2Start;
   NSPoint osc3MixEnv2End;
   NSColor * osc3MixEnv2Colour;

   NSPoint filterFrequencyEnv2Start;
   NSPoint filterFrequencyEnv2End;
   NSColor * filterFrequencyEnv2Colour;

   NSPoint filterFrequencyEnv3Start;
   NSPoint filterFrequencyEnv3End;
   NSColor * filterFrequencyEnv3Colour;

   NSPoint filterFrequencyLfo1Start;
   NSPoint filterFrequencyLfo1End;
   NSColor * filterFrequencyLfo1Colour;

   NSPoint filterFrequencyLfo2Start;
   NSPoint filterFrequencyLfo2End;
   NSColor * filterFrequencyLfo2Colour;

   NSPoint filterResonanceEnv2Start;
   NSPoint filterResonanceEnv2End;
   NSColor * filterResonanceEnv2Colour;

   NSPoint filterResonanceEnv3Start;
   NSPoint filterResonanceEnv3End;
   NSColor * filterResonanceEnv3Colour;

   NSPoint filterResonanceLfo1Start;
   NSPoint filterResonanceLfo1End;
   NSColor * filterResonanceLfo1Colour;

   NSPoint filterResonanceLfo2Start;
   NSPoint filterResonanceLfo2End;
   NSColor * filterResonanceLfo2Colour;

   NSPoint lfo1Env3SpeedModStart;
   NSPoint lfo1Env3SpeedModEnd;
   NSColor * lfo1Env3SpeedModColour;

   NSPoint lfo2Env3SpeedModStart;
   NSPoint lfo2Env3SpeedModEnd;
   NSColor * lfo2Env3SpeedModColour;

   NSPoint noiseMixEnv2Start;
   NSPoint noiseMixEnv2End;
   NSColor * noiseMixEnv2Colour;

   NSPoint osc1PitchLfo2Start;
   NSPoint osc1PitchLfo2End;
   NSColor * osc1PitchLfo2Colour;

   NSPoint osc1PitchWheelStart;
   NSPoint osc1PitchWheelEnd;
   NSColor * osc1PitchWheelColour;

   NSPoint osc1WidthEnv3Start;
   NSPoint osc1WidthEnv3End;
   NSColor * osc1WidthEnv3Colour;

   NSPoint osc1WidthWheelStart;
   NSPoint osc1WidthWheelEnd;
   NSColor * osc1WidthWheelColour;

   NSPoint osc1SyncEnv3Start;
   NSPoint osc1SyncEnv3End;
   NSColor * osc1SyncEnv3Colour;

   NSPoint osc1SyncLfo2Start;
   NSPoint osc1SyncLfo2End;
   NSColor * osc1SyncLfo2Colour;

   NSPoint osc1SyncWheelStart;
   NSPoint osc1SyncWheelEnd;
   NSColor * osc1SyncWheelColour;

   NSPoint osc1SoftenEnv3Start;
   NSPoint osc1SoftenEnv3End;
   NSColor * osc1SoftenEnv3Colour;

   NSPoint osc1SoftenLfo1Start;
   NSPoint osc1SoftenLfo1End;
   NSColor * osc1SoftenLfo1Colour;

   NSPoint osc1SoftenLfo2Start;
   NSPoint osc1SoftenLfo2End;
   NSColor * osc1SoftenLfo2Colour;

   NSPoint osc1SoftenWheelStart;
   NSPoint osc1SoftenWheelEnd;
   NSColor * osc1SoftenWheelColour;

   NSPoint osc1MixEnv3Start;
   NSPoint osc1MixEnv3End;
   NSColor * osc1MixEnv3Colour;

   NSPoint osc1MixLfo1Start;
   NSPoint osc1MixLfo1End;
   NSColor * osc1MixLfo1Colour;

   NSPoint osc1MixLfo2Start;
   NSPoint osc1MixLfo2End;
   NSColor * osc1MixLfo2Colour;

   NSPoint osc1MixWheelStart;
   NSPoint osc1MixWheelEnd;
   NSColor * osc1MixWheelColour;

   NSPoint osc2PitchLfo2Start;
   NSPoint osc2PitchLfo2End;
   NSColor * osc2PitchLfo2Colour;

   NSPoint osc2PitchWheelStart;
   NSPoint osc2PitchWheelEnd;
   NSColor * osc2PitchWheelColour;

   NSPoint osc2WidthEnv3Start;
   NSPoint osc2WidthEnv3End;
   NSColor * osc2WidthEnv3Colour;

   NSPoint osc2WidthWheelStart;
   NSPoint osc2WidthWheelEnd;
   NSColor * osc2WidthWheelColour;

   NSPoint osc2SyncEnv3Start;
   NSPoint osc2SyncEnv3End;
   NSColor * osc2SyncEnv3Colour;

   NSPoint osc2SyncLfo2Start;
   NSPoint osc2SyncLfo2End;
   NSColor * osc2SyncLfo2Colour;

   NSPoint osc2SyncWheelStart;
   NSPoint osc2SyncWheelEnd;
   NSColor * osc2SyncWheelColour;

   NSPoint osc2SoftenEnv3Start;
   NSPoint osc2SoftenEnv3End;
   NSColor * osc2SoftenEnv3Colour;

   NSPoint osc2SoftenLfo1Start;
   NSPoint osc2SoftenLfo1End;
   NSColor * osc2SoftenLfo1Colour;

   NSPoint osc2SoftenLfo2Start;
   NSPoint osc2SoftenLfo2End;
   NSColor * osc2SoftenLfo2Colour;

   NSPoint osc2SoftenWheelStart;
   NSPoint osc2SoftenWheelEnd;
   NSColor * osc2SoftenWheelColour;

   NSPoint osc2MixEnv3Start;
   NSPoint osc2MixEnv3End;
   NSColor * osc2MixEnv3Colour;

   NSPoint osc2MixLfo1Start;
   NSPoint osc2MixLfo1End;
   NSColor * osc2MixLfo1Colour;

   NSPoint osc2MixLfo2Start;
   NSPoint osc2MixLfo2End;
   NSColor * osc2MixLfo2Colour;

   NSPoint osc2MixWheelStart;
   NSPoint osc2MixWheelEnd;
   NSColor * osc2MixWheelColour;

   NSPoint osc3PitchLfo2Start;
   NSPoint osc3PitchLfo2End;
   NSColor * osc3PitchLfo2Colour;

   NSPoint osc3PitchWheelStart;
   NSPoint osc3PitchWheelEnd;
   NSColor * osc3PitchWheelColour;

   NSPoint osc3WidthEnv3Start;
   NSPoint osc3WidthEnv3End;
   NSColor * osc3WidthEnv3Colour;

   NSPoint osc3WidthWheelStart;
   NSPoint osc3WidthWheelEnd;
   NSColor * osc3WidthWheelColour;

   NSPoint osc3SyncEnv3Start;
   NSPoint osc3SyncEnv3End;
   NSColor * osc3SyncEnv3Colour;

   NSPoint osc3SyncLfo2Start;
   NSPoint osc3SyncLfo2End;
   NSColor * osc3SyncLfo2Colour;

   NSPoint osc3SyncWheelStart;
   NSPoint osc3SyncWheelEnd;
   NSColor * osc3SyncWheelColour;

   NSPoint osc3SoftenEnv3Start;
   NSPoint osc3SoftenEnv3End;
   NSColor * osc3SoftenEnv3Colour;

   NSPoint osc3SoftenLfo1Start;
   NSPoint osc3SoftenLfo1End;
   NSColor * osc3SoftenLfo1Colour;

   NSPoint osc3SoftenLfo2Start;
   NSPoint osc3SoftenLfo2End;
   NSColor * osc3SoftenLfo2Colour;

   NSPoint osc3SoftenWheelStart;
   NSPoint osc3SoftenWheelEnd;
   NSColor * osc3SoftenWheelColour;

   NSPoint osc3MixEnv3Start;
   NSPoint osc3MixEnv3End;
   NSColor * osc3MixEnv3Colour;

   NSPoint osc3MixLfo1Start;
   NSPoint osc3MixLfo1End;
   NSColor * osc3MixLfo1Colour;

   NSPoint osc3MixLfo2Start;
   NSPoint osc3MixLfo2End;
   NSColor * osc3MixLfo2Colour;

   NSPoint osc3MixWheelStart;
   NSPoint osc3MixWheelEnd;
   NSColor * osc3MixWheelColour;

   NSPoint ringMod13MixEnv2Start;
   NSPoint ringMod13MixEnv2End;
   NSColor * ringMod13MixEnv2Colour;

   NSPoint ringMod13MixEnv3Start;
   NSPoint ringMod13MixEnv3End;
   NSColor * ringMod13MixEnv3Colour;

   NSPoint ringMod13MixLfo1Start;
   NSPoint ringMod13MixLfo1End;
   NSColor * ringMod13MixLfo1Colour;

   NSPoint ringMod13MixLfo2Start;
   NSPoint ringMod13MixLfo2End;
   NSColor * ringMod13MixLfo2Colour;

   NSPoint ringMod13MixWheelStart;
   NSPoint ringMod13MixWheelEnd;
   NSColor * ringMod13MixWheelColour;

   NSPoint ringMod23MixEnv2Start;
   NSPoint ringMod23MixEnv2End;
   NSColor * ringMod23MixEnv2Colour;

   NSPoint ringMod23MixEnv3Start;
   NSPoint ringMod23MixEnv3End;
   NSColor * ringMod23MixEnv3Colour;

   NSPoint ringMod23MixLfo1Start;
   NSPoint ringMod23MixLfo1End;
   NSColor * ringMod23MixLfo1Colour;

   NSPoint ringMod23MixLfo2Start;
   NSPoint ringMod23MixLfo2End;
   NSColor * ringMod23MixLfo2Colour;

   NSPoint ringMod23MixWheelStart;
   NSPoint ringMod23MixWheelEnd;
   NSColor * ringMod23MixWheelColour;

   NSPoint noiseSoftenEnv2Start;
   NSPoint noiseSoftenEnv2End;
   NSColor * noiseSoftenEnv2Colour;

   NSPoint noiseSoftenEnv3Start;
   NSPoint noiseSoftenEnv3End;
   NSColor * noiseSoftenEnv3Colour;

   NSPoint noiseSoftenLfo1Start;
   NSPoint noiseSoftenLfo1End;
   NSColor * noiseSoftenLfo1Colour;

   NSPoint noiseSoftenLfo2Start;
   NSPoint noiseSoftenLfo2End;
   NSColor * noiseSoftenLfo2Colour;

   NSPoint noiseSoftenWheelStart;
   NSPoint noiseSoftenWheelEnd;
   NSColor * noiseSoftenWheelColour;

   NSPoint noiseMixEnv3Start;
   NSPoint noiseMixEnv3End;
   NSColor * noiseMixEnv3Colour;

   NSPoint noiseMixLfo1Start;
   NSPoint noiseMixLfo1End;
   NSColor * noiseMixLfo1Colour;

   NSPoint noiseMixLfo2Start;
   NSPoint noiseMixLfo2End;
   NSColor * noiseMixLfo2Colour;

   NSPoint noiseMixWheelStart;
   NSPoint noiseMixWheelEnd;
   NSColor * noiseMixWheelColour;

   NSPoint osc1WheelLfo1Start;
   NSPoint osc1WheelLfo1End;
   NSColor * osc1WheelLfo1Colour;

   NSPoint osc2WheelLfo1Start;
   NSPoint osc2WheelLfo1End;
   NSColor * osc2WheelLfo1Colour;

   NSPoint osc3WheelLfo1Start;
   NSPoint osc3WheelLfo1End;
   NSColor * osc3WheelLfo1Colour;

   NSPoint osc1AfterTouchLfo1Start;
   NSPoint osc1AfterTouchLfo1End;
   NSColor * osc1AfterTouchLfo1Colour;

   NSPoint osc2AfterTouchLfo1Start;
   NSPoint osc2AfterTouchLfo1End;
   NSColor * osc2AfterTouchLfo1Colour;

   NSPoint osc3AfterTouchLfo1Start;
   NSPoint osc3AfterTouchLfo1End;
   NSColor * osc3AfterTouchLfo1Colour;

   NSPoint lfo1AfterTouchSpeedModStart;
   NSPoint lfo1AfterTouchSpeedModEnd;
   NSColor * lfo1AfterTouchSpeedModColour;

   NSPoint lfo2AfterTouchSpeedModStart;
   NSPoint lfo2AfterTouchSpeedModEnd;
   NSColor * lfo2AfterTouchSpeedModColour;

   NSPoint filterFrequencyWheelStart;
   NSPoint filterFrequencyWheelEnd;
   NSColor * filterFrequencyWheelColour;

   NSPoint filterResonanceWheelStart;
   NSPoint filterResonanceWheelEnd;
   NSColor * filterResonanceWheelColour;

   NSPoint filterFrequencyWheelLfo2Start;
   NSPoint filterFrequencyWheelLfo2End;
   NSColor * filterFrequencyWheelLfo2Colour;

   NSPoint filterResonanceWheelLfo2Start;
   NSPoint filterResonanceWheelLfo2End;
   NSColor * filterResonanceWheelLfo2Colour;

   NSPoint filterFrequencyAfterTouchLfo2Start;
   NSPoint filterFrequencyAfterTouchLfo2End;
   NSColor * filterFrequencyAfterTouchLfo2Colour;

   NSPoint filterResonanceAfterTouchLfo2Start;
   NSPoint filterResonanceAfterTouchLfo2End;
   NSColor * filterResonanceAfterTouchLfo2Colour;

   NSPoint filterFrequencyAfterTouchStart;
   NSPoint filterFrequencyAfterTouchEnd;
   NSColor * filterFrequencyAfterTouchColour;

   NSPoint filterResonanceAfterTouchStart;
   NSPoint filterResonanceAfterTouchEnd;
   NSColor * filterResonanceAfterTouchColour;

   NSPoint lfo1WheelSpeedModStart;
   NSPoint lfo1WheelSpeedModEnd;
   NSColor * lfo1WheelSpeedModColour;

   NSPoint lfo2WheelSpeedModStart;
   NSPoint lfo2WheelSpeedModEnd;
   NSColor * lfo2WheelSpeedModColour;

   NSPoint env1WheelStart;
   NSPoint env1WheelEnd;
   NSColor * env1WheelColour;

   NSPoint env1AfterTouchStart;
   NSPoint env1AfterTouchEnd;
   NSColor * env1AfterTouchColour;
  
}

-(void)drawLine:(int)width colour:(NSColor *)colour start:(NSPoint)start end:(NSPoint)end;
-(void)setProg:(IWProg *)progr;


-(void)drawOsc1PitchEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1PitchEnv2:(int)width;
-(void)drawOsc1PitchEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc1PitchEnv3:(int)width;
-(void)drawOsc1PitchLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc1PitchLfo1:(int)width;
-(void)drawOsc1SoftenEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SoftenEnv2:(int)width;
-(void)drawOsc1WidthEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1WidthEnv2:(int)width;
-(void)drawOsc1WidthLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc1WidthLfo1:(int)width;
-(void)drawOsc1WidthLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1WidthLfo2:(int)width;
-(void)drawOsc1SyncEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SyncEnv2:(int)width;
-(void)drawOsc1SyncLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SyncLfo1:(int)width;
-(void)drawOsc2PitchEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2PitchEnv2:(int)width;
-(void)drawOsc2PitchEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc2PitchEnv3:(int)width;
-(void)drawOsc2PitchLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc2PitchLfo1:(int)width;
-(void)drawOsc2SoftenEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SoftenEnv2:(int)width;
-(void)drawOsc2WidthEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2WidthEnv2:(int)width;
-(void)drawOsc2WidthLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc2WidthLfo1:(int)width;
-(void)drawOsc2WidthLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2WidthLfo2:(int)width;
-(void)drawOsc2SyncEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SyncEnv2:(int)width;
-(void)drawOsc2SyncLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SyncLfo1:(int)width;
-(void)drawOsc3PitchEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3PitchEnv2:(int)width;
-(void)drawOsc3PitchEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc3PitchEnv3:(int)width;
-(void)drawOsc3PitchLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc3PitchLfo1:(int)width;
-(void)drawOsc3SoftenEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SoftenEnv2:(int)width;
-(void)drawOsc3WidthEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3WidthEnv2:(int)width;
-(void)drawOsc3WidthLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc3WidthLfo1:(int)width;
-(void)drawOsc3WidthLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3WidthLfo2:(int)width;
-(void)drawOsc3SyncEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SyncEnv2:(int)width;
-(void)drawOsc3SyncLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SyncLfo1:(int)width;
-(void)drawOsc1MixEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1MixEnv2:(int)width;
-(void)drawOsc2MixEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2MixEnv2:(int)width;
-(void)drawOsc3MixEnv2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3MixEnv2:(int)width;
-(void)drawFilterFrequencyEnv2:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyEnv2:(int)width;
-(void)drawFilterFrequencyEnv3:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyEnv3:(int)width;
-(void)drawFilterFrequencyLfo1:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyLfo1:(int)width;
-(void)drawFilterFrequencyLfo2:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyLfo2:(int)width;
-(void)drawFilterResonanceEnv2:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceEnv2:(int)width;
-(void)drawFilterResonanceEnv3:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceEnv3:(int)width;
-(void)drawFilterResonanceLfo1:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceLfo1:(int)width;
-(void)drawFilterResonanceLfo2:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceLfo2:(int)width;
-(void)drawLfo1Env3SpeedMod:(int)width colour:(NSColor *)colour;
-(void)drawLfo1Env3SpeedMod:(int)width;
-(void)drawLfo2Env3SpeedMod:(int)width colour:(NSColor *)colour;
-(void)drawLfo2Env3SpeedMod:(int)width;
-(void)drawNoiseMixEnv2:(int)width colour:(NSColor *)colour;
-(void)drawNoiseMixEnv2:(int)width;
-(void)drawOsc1PitchLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1PitchLfo2:(int)width;
-(void)drawOsc1PitchWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc1PitchWheel:(int)width;
-(void)drawOsc1WidthEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc1WidthEnv3:(int)width;
-(void)drawOsc1WidthWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc1WidthWheel:(int)width;
-(void)drawOsc1SyncEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SyncEnv3:(int)width;
-(void)drawOsc1SyncLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SyncLfo2:(int)width;
-(void)drawOsc1SyncWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SyncWheel:(int)width;
-(void)drawOsc1SoftenEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SoftenEnv3:(int)width;
-(void)drawOsc1SoftenLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SoftenLfo1:(int)width;
-(void)drawOsc1SoftenLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SoftenLfo2:(int)width;
-(void)drawOsc1SoftenWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc1SoftenWheel:(int)width;
-(void)drawOsc1MixEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc1MixEnv3:(int)width;
-(void)drawOsc1MixLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc1MixLfo1:(int)width;
-(void)drawOsc1MixLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc1MixLfo2:(int)width;
-(void)drawOsc1MixWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc1MixWheel:(int)width;
-(void)drawOsc2PitchLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2PitchLfo2:(int)width;
-(void)drawOsc2PitchWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc2PitchWheel:(int)width;
-(void)drawOsc2WidthEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc2WidthEnv3:(int)width;
-(void)drawOsc2WidthWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc2WidthWheel:(int)width;
-(void)drawOsc2SyncEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SyncEnv3:(int)width;
-(void)drawOsc2SyncLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SyncLfo2:(int)width;
-(void)drawOsc2SyncWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SyncWheel:(int)width;
-(void)drawOsc2SoftenEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SoftenEnv3:(int)width;
-(void)drawOsc2SoftenLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SoftenLfo1:(int)width;
-(void)drawOsc2SoftenLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SoftenLfo2:(int)width;
-(void)drawOsc2SoftenWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc2SoftenWheel:(int)width;
-(void)drawOsc2MixEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc2MixEnv3:(int)width;
-(void)drawOsc2MixLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc2MixLfo1:(int)width;
-(void)drawOsc2MixLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc2MixLfo2:(int)width;
-(void)drawOsc2MixWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc2MixWheel:(int)width;
-(void)drawOsc3PitchLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3PitchLfo2:(int)width;
-(void)drawOsc3PitchWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc3PitchWheel:(int)width;
-(void)drawOsc3WidthEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc3WidthEnv3:(int)width;
-(void)drawOsc3WidthWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc3WidthWheel:(int)width;
-(void)drawOsc3SyncEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SyncEnv3:(int)width;
-(void)drawOsc3SyncLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SyncLfo2:(int)width;
-(void)drawOsc3SyncWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SyncWheel:(int)width;
-(void)drawOsc3SoftenEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SoftenEnv3:(int)width;
-(void)drawOsc3SoftenLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SoftenLfo1:(int)width;
-(void)drawOsc3SoftenLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SoftenLfo2:(int)width;
-(void)drawOsc3SoftenWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc3SoftenWheel:(int)width;
-(void)drawOsc3MixEnv3:(int)width colour:(NSColor *)colour;
-(void)drawOsc3MixEnv3:(int)width;
-(void)drawOsc3MixLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc3MixLfo1:(int)width;
-(void)drawOsc3MixLfo2:(int)width colour:(NSColor *)colour;
-(void)drawOsc3MixLfo2:(int)width;
-(void)drawOsc3MixWheel:(int)width colour:(NSColor *)colour;
-(void)drawOsc3MixWheel:(int)width;
-(void)drawRingMod13MixEnv2:(int)width colour:(NSColor *)colour;
-(void)drawRingMod13MixEnv2:(int)width;
-(void)drawRingMod13MixEnv3:(int)width colour:(NSColor *)colour;
-(void)drawRingMod13MixEnv3:(int)width;
-(void)drawRingMod13MixLfo1:(int)width colour:(NSColor *)colour;
-(void)drawRingMod13MixLfo1:(int)width;
-(void)drawRingMod13MixLfo2:(int)width colour:(NSColor *)colour;
-(void)drawRingMod13MixLfo2:(int)width;
-(void)drawRingMod13MixWheel:(int)width colour:(NSColor *)colour;
-(void)drawRingMod13MixWheel:(int)width;
-(void)drawRingMod23MixEnv2:(int)width colour:(NSColor *)colour;
-(void)drawRingMod23MixEnv2:(int)width;
-(void)drawRingMod23MixEnv3:(int)width colour:(NSColor *)colour;
-(void)drawRingMod23MixEnv3:(int)width;
-(void)drawRingMod23MixLfo1:(int)width colour:(NSColor *)colour;
-(void)drawRingMod23MixLfo1:(int)width;
-(void)drawRingMod23MixLfo2:(int)width colour:(NSColor *)colour;
-(void)drawRingMod23MixLfo2:(int)width;
-(void)drawRingMod23MixWheel:(int)width colour:(NSColor *)colour;
-(void)drawRingMod23MixWheel:(int)width;
-(void)drawNoiseSoftenEnv2:(int)width colour:(NSColor *)colour;
-(void)drawNoiseSoftenEnv2:(int)width;
-(void)drawNoiseSoftenEnv3:(int)width colour:(NSColor *)colour;
-(void)drawNoiseSoftenEnv3:(int)width;
-(void)drawNoiseSoftenLfo1:(int)width colour:(NSColor *)colour;
-(void)drawNoiseSoftenLfo1:(int)width;
-(void)drawNoiseSoftenLfo2:(int)width colour:(NSColor *)colour;
-(void)drawNoiseSoftenLfo2:(int)width;
-(void)drawNoiseSoftenWheel:(int)width colour:(NSColor *)colour;
-(void)drawNoiseSoftenWheel:(int)width;
-(void)drawNoiseMixEnv3:(int)width colour:(NSColor *)colour;
-(void)drawNoiseMixEnv3:(int)width;
-(void)drawNoiseMixLfo1:(int)width colour:(NSColor *)colour;
-(void)drawNoiseMixLfo1:(int)width;
-(void)drawNoiseMixLfo2:(int)width colour:(NSColor *)colour;
-(void)drawNoiseMixLfo2:(int)width;
-(void)drawNoiseMixWheel:(int)width colour:(NSColor *)colour;
-(void)drawNoiseMixWheel:(int)width;
-(void)drawOsc1WheelLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc1WheelLfo1:(int)width;
-(void)drawOsc2WheelLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc2WheelLfo1:(int)width;
-(void)drawOsc3WheelLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc3WheelLfo1:(int)width;
-(void)drawOsc1AfterTouchLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc1AfterTouchLfo1:(int)width;
-(void)drawOsc2AfterTouchLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc2AfterTouchLfo1:(int)width;
-(void)drawOsc3AfterTouchLfo1:(int)width colour:(NSColor *)colour;
-(void)drawOsc3AfterTouchLfo1:(int)width;
-(void)drawLfo1AfterTouchSpeedMod:(int)width colour:(NSColor *)colour;
-(void)drawLfo1AfterTouchSpeedMod:(int)width;
-(void)drawLfo2AfterTouchSpeedMod:(int)width colour:(NSColor *)colour;
-(void)drawLfo2AfterTouchSpeedMod:(int)width;
-(void)drawFilterFrequencyWheel:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyWheel:(int)width;
-(void)drawFilterResonanceWheel:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceWheel:(int)width;
-(void)drawFilterFrequencyWheelLfo2:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyWheelLfo2:(int)width;
-(void)drawFilterResonanceWheelLfo2:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceWheelLfo2:(int)width;
-(void)drawFilterFrequencyAfterTouchLfo2:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyAfterTouchLfo2:(int)width;
-(void)drawFilterResonanceAfterTouchLfo2:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceAfterTouchLfo2:(int)width;
-(void)drawFilterFrequencyAfterTouch:(int)width colour:(NSColor *)colour;
-(void)drawFilterFrequencyAfterTouch:(int)width;
-(void)drawFilterResonanceAfterTouch:(int)width colour:(NSColor *)colour;
-(void)drawFilterResonanceAfterTouch:(int)width;
-(void)drawLfo1WheelSpeedMod:(int)width colour:(NSColor *)colour;
-(void)drawLfo1WheelSpeedMod:(int)width;
-(void)drawLfo2WheelSpeedMod:(int)width colour:(NSColor *)colour;
-(void)drawLfo2WheelSpeedMod:(int)width;
-(void)drawEnv1Wheel:(int)width colour:(NSColor *)colour;
-(void)drawEnv1Wheel:(int)width;
-(void)drawEnv1AfterTouch:(int)width colour:(NSColor *)colour;
-(void)drawEnv1AfterTouch:(int)width;
-(NSColor *)osc1PitchEnv2Colour;
-(NSColor *)osc1PitchEnv3Colour;
-(NSColor *)osc1PitchLfo1Colour;
-(NSColor *)osc1SoftenEnv2Colour;
-(NSColor *)osc1WidthEnv2Colour;
-(NSColor *)osc1WidthLfo1Colour;
-(NSColor *)osc1WidthLfo2Colour;
-(NSColor *)osc1SyncEnv2Colour;
-(NSColor *)osc1SyncLfo1Colour;
-(NSColor *)osc2PitchEnv2Colour;
-(NSColor *)osc2PitchEnv3Colour;
-(NSColor *)osc2PitchLfo1Colour;
-(NSColor *)osc2SoftenEnv2Colour;
-(NSColor *)osc2WidthEnv2Colour;
-(NSColor *)osc2WidthLfo1Colour;
-(NSColor *)osc2WidthLfo2Colour;
-(NSColor *)osc2SyncEnv2Colour;
-(NSColor *)osc2SyncLfo1Colour;
-(NSColor *)osc3PitchEnv2Colour;
-(NSColor *)osc3PitchEnv3Colour;
-(NSColor *)osc3PitchLfo1Colour;
-(NSColor *)osc3SoftenEnv2Colour;
-(NSColor *)osc3WidthEnv2Colour;
-(NSColor *)osc3WidthLfo1Colour;
-(NSColor *)osc3WidthLfo2Colour;
-(NSColor *)osc3SyncEnv2Colour;
-(NSColor *)osc3SyncLfo1Colour;
-(NSColor *)osc1MixEnv2Colour;
-(NSColor *)osc2MixEnv2Colour;
-(NSColor *)osc3MixEnv2Colour;
-(NSColor *)filterFrequencyEnv2Colour;
-(NSColor *)filterFrequencyEnv3Colour;
-(NSColor *)filterFrequencyLfo1Colour;
-(NSColor *)filterFrequencyLfo2Colour;
-(NSColor *)filterResonanceEnv2Colour;
-(NSColor *)filterResonanceEnv3Colour;
-(NSColor *)filterResonanceLfo1Colour;
-(NSColor *)filterResonanceLfo2Colour;
-(NSColor *)lfo1Env3SpeedModColour;
-(NSColor *)lfo2Env3SpeedModColour;
-(NSColor *)noiseMixEnv2Colour;
-(NSColor *)osc1PitchLfo2Colour;
-(NSColor *)osc1PitchWheelColour;
-(NSColor *)osc1WidthEnv3Colour;
-(NSColor *)osc1WidthWheelColour;
-(NSColor *)osc1SyncEnv3Colour;
-(NSColor *)osc1SyncLfo2Colour;
-(NSColor *)osc1SyncWheelColour;
-(NSColor *)osc1SoftenEnv3Colour;
-(NSColor *)osc1SoftenLfo1Colour;
-(NSColor *)osc1SoftenLfo2Colour;
-(NSColor *)osc1SoftenWheelColour;
-(NSColor *)osc1MixEnv3Colour;
-(NSColor *)osc1MixLfo1Colour;
-(NSColor *)osc1MixLfo2Colour;
-(NSColor *)osc1MixWheelColour;
-(NSColor *)osc2PitchLfo2Colour;
-(NSColor *)osc2PitchWheelColour;
-(NSColor *)osc2WidthEnv3Colour;
-(NSColor *)osc2WidthWheelColour;
-(NSColor *)osc2SyncEnv3Colour;
-(NSColor *)osc2SyncLfo2Colour;
-(NSColor *)osc2SyncWheelColour;
-(NSColor *)osc2SoftenEnv3Colour;
-(NSColor *)osc2SoftenLfo1Colour;
-(NSColor *)osc2SoftenLfo2Colour;
-(NSColor *)osc2SoftenWheelColour;
-(NSColor *)osc2MixEnv3Colour;
-(NSColor *)osc2MixLfo1Colour;
-(NSColor *)osc2MixLfo2Colour;
-(NSColor *)osc2MixWheelColour;
-(NSColor *)osc3PitchLfo2Colour;
-(NSColor *)osc3PitchWheelColour;
-(NSColor *)osc3WidthEnv3Colour;
-(NSColor *)osc3WidthWheelColour;
-(NSColor *)osc3SyncEnv3Colour;
-(NSColor *)osc3SyncLfo2Colour;
-(NSColor *)osc3SyncWheelColour;
-(NSColor *)osc3SoftenEnv3Colour;
-(NSColor *)osc3SoftenLfo1Colour;
-(NSColor *)osc3SoftenLfo2Colour;
-(NSColor *)osc3SoftenWheelColour;
-(NSColor *)osc3MixEnv3Colour;
-(NSColor *)osc3MixLfo1Colour;
-(NSColor *)osc3MixLfo2Colour;
-(NSColor *)osc3MixWheelColour;
-(NSColor *)ringMod13MixEnv2Colour;
-(NSColor *)ringMod13MixEnv3Colour;
-(NSColor *)ringMod13MixLfo1Colour;
-(NSColor *)ringMod13MixLfo2Colour;
-(NSColor *)ringMod13MixWheelColour;
-(NSColor *)ringMod23MixEnv2Colour;
-(NSColor *)ringMod23MixEnv3Colour;
-(NSColor *)ringMod23MixLfo1Colour;
-(NSColor *)ringMod23MixLfo2Colour;
-(NSColor *)ringMod23MixWheelColour;
-(NSColor *)noiseSoftenEnv2Colour;
-(NSColor *)noiseSoftenEnv3Colour;
-(NSColor *)noiseSoftenLfo1Colour;
-(NSColor *)noiseSoftenLfo2Colour;
-(NSColor *)noiseSoftenWheelColour;
-(NSColor *)noiseMixEnv3Colour;
-(NSColor *)noiseMixLfo1Colour;
-(NSColor *)noiseMixLfo2Colour;
-(NSColor *)noiseMixWheelColour;
-(NSColor *)osc1WheelLfo1Colour;
-(NSColor *)osc2WheelLfo1Colour;
-(NSColor *)osc3WheelLfo1Colour;
-(NSColor *)osc1AfterTouchLfo1Colour;
-(NSColor *)osc2AfterTouchLfo1Colour;
-(NSColor *)osc3AfterTouchLfo1Colour;
-(NSColor *)lfo1AfterTouchSpeedModColour;
-(NSColor *)lfo2AfterTouchSpeedModColour;
-(NSColor *)filterFrequencyWheelColour;
-(NSColor *)filterResonanceWheelColour;
-(NSColor *)filterFrequencyWheelLfo2Colour;
-(NSColor *)filterResonanceWheelLfo2Colour;
-(NSColor *)filterFrequencyAfterTouchLfo2Colour;
-(NSColor *)filterResonanceAfterTouchLfo2Colour;
-(NSColor *)filterFrequencyAfterTouchColour;
-(NSColor *)filterResonanceAfterTouchColour;
-(NSColor *)lfo1WheelSpeedModColour;
-(NSColor *)lfo2WheelSpeedModColour;
-(NSColor *)env1WheelColour;
-(NSColor *)env1AfterTouchColour;
-(void)setOsc1PitchEnv2Colour:(NSColor *)value;
-(void)setOsc1PitchEnv3Colour:(NSColor *)value;
-(void)setOsc1PitchLfo1Colour:(NSColor *)value;
-(void)setOsc1SoftenEnv2Colour:(NSColor *)value;
-(void)setOsc1WidthEnv2Colour:(NSColor *)value;
-(void)setOsc1WidthLfo1Colour:(NSColor *)value;
-(void)setOsc1WidthLfo2Colour:(NSColor *)value;
-(void)setOsc1SyncEnv2Colour:(NSColor *)value;
-(void)setOsc1SyncLfo1Colour:(NSColor *)value;
-(void)setOsc2PitchEnv2Colour:(NSColor *)value;
-(void)setOsc2PitchEnv3Colour:(NSColor *)value;
-(void)setOsc2PitchLfo1Colour:(NSColor *)value;
-(void)setOsc2SoftenEnv2Colour:(NSColor *)value;
-(void)setOsc2WidthEnv2Colour:(NSColor *)value;
-(void)setOsc2WidthLfo1Colour:(NSColor *)value;
-(void)setOsc2WidthLfo2Colour:(NSColor *)value;
-(void)setOsc2SyncEnv2Colour:(NSColor *)value;
-(void)setOsc2SyncLfo1Colour:(NSColor *)value;
-(void)setOsc3PitchEnv2Colour:(NSColor *)value;
-(void)setOsc3PitchEnv3Colour:(NSColor *)value;
-(void)setOsc3PitchLfo1Colour:(NSColor *)value;
-(void)setOsc3SoftenEnv2Colour:(NSColor *)value;
-(void)setOsc3WidthEnv2Colour:(NSColor *)value;
-(void)setOsc3WidthLfo1Colour:(NSColor *)value;
-(void)setOsc3WidthLfo2Colour:(NSColor *)value;
-(void)setOsc3SyncEnv2Colour:(NSColor *)value;
-(void)setOsc3SyncLfo1Colour:(NSColor *)value;
-(void)setOsc1MixEnv2Colour:(NSColor *)value;
-(void)setOsc2MixEnv2Colour:(NSColor *)value;
-(void)setOsc3MixEnv2Colour:(NSColor *)value;
-(void)setFilterFrequencyEnv2Colour:(NSColor *)value;
-(void)setFilterFrequencyEnv3Colour:(NSColor *)value;
-(void)setFilterFrequencyLfo1Colour:(NSColor *)value;
-(void)setFilterFrequencyLfo2Colour:(NSColor *)value;
-(void)setFilterResonanceEnv2Colour:(NSColor *)value;
-(void)setFilterResonanceEnv3Colour:(NSColor *)value;
-(void)setFilterResonanceLfo1Colour:(NSColor *)value;
-(void)setFilterResonanceLfo2Colour:(NSColor *)value;
-(void)setLfo1Env3SpeedModColour:(NSColor *)value;
-(void)setLfo2Env3SpeedModColour:(NSColor *)value;
-(void)setNoiseMixEnv2Colour:(NSColor *)value;
-(void)setOsc1PitchLfo2Colour:(NSColor *)value;
-(void)setOsc1PitchWheelColour:(NSColor *)value;
-(void)setOsc1WidthEnv3Colour:(NSColor *)value;
-(void)setOsc1WidthWheelColour:(NSColor *)value;
-(void)setOsc1SyncEnv3Colour:(NSColor *)value;
-(void)setOsc1SyncLfo2Colour:(NSColor *)value;
-(void)setOsc1SyncWheelColour:(NSColor *)value;
-(void)setOsc1SoftenEnv3Colour:(NSColor *)value;
-(void)setOsc1SoftenLfo1Colour:(NSColor *)value;
-(void)setOsc1SoftenLfo2Colour:(NSColor *)value;
-(void)setOsc1SoftenWheelColour:(NSColor *)value;
-(void)setOsc1MixEnv3Colour:(NSColor *)value;
-(void)setOsc1MixLfo1Colour:(NSColor *)value;
-(void)setOsc1MixLfo2Colour:(NSColor *)value;
-(void)setOsc1MixWheelColour:(NSColor *)value;
-(void)setOsc2PitchLfo2Colour:(NSColor *)value;
-(void)setOsc2PitchWheelColour:(NSColor *)value;
-(void)setOsc2WidthEnv3Colour:(NSColor *)value;
-(void)setOsc2WidthWheelColour:(NSColor *)value;
-(void)setOsc2SyncEnv3Colour:(NSColor *)value;
-(void)setOsc2SyncLfo2Colour:(NSColor *)value;
-(void)setOsc2SyncWheelColour:(NSColor *)value;
-(void)setOsc2SoftenEnv3Colour:(NSColor *)value;
-(void)setOsc2SoftenLfo1Colour:(NSColor *)value;
-(void)setOsc2SoftenLfo2Colour:(NSColor *)value;
-(void)setOsc2SoftenWheelColour:(NSColor *)value;
-(void)setOsc2MixEnv3Colour:(NSColor *)value;
-(void)setOsc2MixLfo1Colour:(NSColor *)value;
-(void)setOsc2MixLfo2Colour:(NSColor *)value;
-(void)setOsc2MixWheelColour:(NSColor *)value;
-(void)setOsc3PitchLfo2Colour:(NSColor *)value;
-(void)setOsc3PitchWheelColour:(NSColor *)value;
-(void)setOsc3WidthEnv3Colour:(NSColor *)value;
-(void)setOsc3WidthWheelColour:(NSColor *)value;
-(void)setOsc3SyncEnv3Colour:(NSColor *)value;
-(void)setOsc3SyncLfo2Colour:(NSColor *)value;
-(void)setOsc3SyncWheelColour:(NSColor *)value;
-(void)setOsc3SoftenEnv3Colour:(NSColor *)value;
-(void)setOsc3SoftenLfo1Colour:(NSColor *)value;
-(void)setOsc3SoftenLfo2Colour:(NSColor *)value;
-(void)setOsc3SoftenWheelColour:(NSColor *)value;
-(void)setOsc3MixEnv3Colour:(NSColor *)value;
-(void)setOsc3MixLfo1Colour:(NSColor *)value;
-(void)setOsc3MixLfo2Colour:(NSColor *)value;
-(void)setOsc3MixWheelColour:(NSColor *)value;
-(void)setRingMod13MixEnv2Colour:(NSColor *)value;
-(void)setRingMod13MixEnv3Colour:(NSColor *)value;
-(void)setRingMod13MixLfo1Colour:(NSColor *)value;
-(void)setRingMod13MixLfo2Colour:(NSColor *)value;
-(void)setRingMod13MixWheelColour:(NSColor *)value;
-(void)setRingMod23MixEnv2Colour:(NSColor *)value;
-(void)setRingMod23MixEnv3Colour:(NSColor *)value;
-(void)setRingMod23MixLfo1Colour:(NSColor *)value;
-(void)setRingMod23MixLfo2Colour:(NSColor *)value;
-(void)setRingMod23MixWheelColour:(NSColor *)value;
-(void)setNoiseSoftenEnv2Colour:(NSColor *)value;
-(void)setNoiseSoftenEnv3Colour:(NSColor *)value;
-(void)setNoiseSoftenLfo1Colour:(NSColor *)value;
-(void)setNoiseSoftenLfo2Colour:(NSColor *)value;
-(void)setNoiseSoftenWheelColour:(NSColor *)value;
-(void)setNoiseMixEnv3Colour:(NSColor *)value;
-(void)setNoiseMixLfo1Colour:(NSColor *)value;
-(void)setNoiseMixLfo2Colour:(NSColor *)value;
-(void)setNoiseMixWheelColour:(NSColor *)value;
-(void)setOsc1WheelLfo1Colour:(NSColor *)value;
-(void)setOsc2WheelLfo1Colour:(NSColor *)value;
-(void)setOsc3WheelLfo1Colour:(NSColor *)value;
-(void)setOsc1AfterTouchLfo1Colour:(NSColor *)value;
-(void)setOsc2AfterTouchLfo1Colour:(NSColor *)value;
-(void)setOsc3AfterTouchLfo1Colour:(NSColor *)value;
-(void)setLfo1AfterTouchSpeedModColour:(NSColor *)value;
-(void)setLfo2AfterTouchSpeedModColour:(NSColor *)value;
-(void)setFilterFrequencyWheelColour:(NSColor *)value;
-(void)setFilterResonanceWheelColour:(NSColor *)value;
-(void)setFilterFrequencyWheelLfo2Colour:(NSColor *)value;
-(void)setFilterResonanceWheelLfo2Colour:(NSColor *)value;
-(void)setFilterFrequencyAfterTouchLfo2Colour:(NSColor *)value;
-(void)setFilterResonanceAfterTouchLfo2Colour:(NSColor *)value;
-(void)setFilterFrequencyAfterTouchColour:(NSColor *)value;
-(void)setFilterResonanceAfterTouchColour:(NSColor *)value;
-(void)setLfo1WheelSpeedModColour:(NSColor *)value;
-(void)setLfo2WheelSpeedModColour:(NSColor *)value;
-(void)setEnv1WheelColour:(NSColor *)value;
-(void)setEnv1AfterTouchColour:(NSColor *)value;

@end
