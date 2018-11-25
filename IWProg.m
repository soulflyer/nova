//
//  Prog.m
//  Nova
//
//  Created by Iain Wood on Fri Jan 30 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "IWProg.h"
#import "MIDIConst.h"


@implementation IWProg

#include "GeneratedFiles/ProgSetMethods":
#include "GeneratedFiles/ProgAccessMethods";

+(void)initialize
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"7"   forKey:@"channel"];
    // Include the contents of GeneratedFiles/progInitialize
    // Do it by hand so it is poss to change the values
#include "GeneratedFiles/progInitialize";
/*    [dict setObject:@"0"   forKey:@"osc1Pitch"];
    [dict setObject:@"0"   forKey:@"osc2Pitch"];
    [dict setObject:@"0"   forKey:@"osc3Pitch"];
    [dict setObject:@"0"   forKey:@"osc1FormantWidth"];
    [dict setObject:@"0"   forKey:@"osc2FormantWidth"];
    [dict setObject:@"0"   forKey:@"osc3FormantWidth"];
    [dict setObject:@"0"   forKey:@"osc1SyncKeyFollow"];
    [dict setObject:@"0"   forKey:@"osc2SyncKeyFollow"];
    [dict setObject:@"0"   forKey:@"osc3SyncKeyFollow"];
    [dict setObject:@"0"   forKey:@"osc1SyncSkew"];
    [dict setObject:@"0"   forKey:@"osc2SyncSkew"];
    [dict setObject:@"0"   forKey:@"osc3SyncSkew"];
    [dict setObject:@"0"   forKey:@"combFrequency"];
    [dict setObject:@"0"   forKey:@"combBoost"];
    [dict setObject:@"0"   forKey:@"panDryLevel"];
    [dict setObject:@"0"   forKey:@"panSpeed"];
    [dict setObject:@"0"   forKey:@"panDepth"];
    [dict setObject:@"0"   forKey:@"delayStereoWidth"];
    [dict setObject:@"0"   forKey:@"vocoderBalance"];
    [dict setObject:@"0"   forKey:@"eqTreble"];
    [dict setObject:@"0"   forKey:@"eqBass"];
    [dict setObject:@"0"   forKey:@"partSemiDetune"];
    [dict setObject:@"0"   forKey:@"partDetune"];
    [dict setObject:@"0"   forKey:@"partRangeHigh"];
    [dict setObject:@"0"   forKey:@"partRangeLow"];
    [dict setObject:@"0"   forKey:@"masterTune"];
    [dict setObject:@"0"   forKey:@"breathControlRemap"];
    [dict setObject:@"0"   forKey:@"arpTransposeMidi"];
    [dict setObject:@"0"   forKey:@"arpTransposeRef"];
    [dict setObject:@"0"   forKey:@"programMapEditLoc"];
    [dict setObject:@"0"   forKey:@"programMapProgram"];
    [dict setObject:@"0"   forKey:@"arpUserPatternEditLoc"];
    [dict setObject:@"0"   forKey:@"arpUserPatternStep"];
    [dict setObject:@"0"   forKey:@"arpUserPatternNote"];
    [dict setObject:@"0"   forKey:@"arpUserPatternVel"];
    [dict setObject:@"0"   forKey:@"arpUserPatternSteps"];
    [dict setObject:@"0"   forKey:@"filterQNorm"];
    [dict setObject:@"0"   forKey:@"osc1Wave"];
    [dict setObject:@"2"   forKey:@"osc2Wave"];
    [dict setObject:@"0"   forKey:@"osc3Wave"];
    [dict setObject:@"0"   forKey:@"osc1Oct"];
    [dict setObject:@"0"   forKey:@"osc2Oct"];
    [dict setObject:@"0"   forKey:@"osc3Oct"];
    [dict setObject:@"0"   forKey:@"portamentoType"];
    [dict setObject:@"0"   forKey:@"lfo1DelayTrigger"];
    [dict setObject:@"0"   forKey:@"lfo2DelayTrigger"];
    [dict setObject:@"0"   forKey:@"filterDB"];
    [dict setObject:@"3"   forKey:@"filterType"];
    [dict setObject:@"3"   forKey:@"lfo1Shape"];
    [dict setObject:@"0"   forKey:@"lfo2Shape"];
    [dict setObject:@"0"   forKey:@"lfo1Trigger"];
    [dict setObject:@"0"   forKey:@"lfo2Trigger"];
    [dict setObject:@"0"   forKey:@"lfo1Range"];
    [dict setObject:@"0"   forKey:@"lfo2Range"];
    [dict setObject:@"0"   forKey:@"env1Trigger"];
    [dict setObject:@"0"   forKey:@"env2Trigger"];
    [dict setObject:@"0"   forKey:@"env3Trigger"];
    [dict setObject:@"0"   forKey:@"glide"];
    [dict setObject:@"0"   forKey:@"chorusType"];
    [dict setObject:@"0"   forKey:@"panType"];
    [dict setObject:@"0"   forKey:@"arpConstPitch"];
    [dict setObject:@"0"   forKey:@"arpOn"];
    [dict setObject:@"0"   forKey:@"arpKeyReset"];
    [dict setObject:@"0"   forKey:@"arpPatternBank"];
    [dict setObject:@"0"   forKey:@"arpLatchType"];
    [dict setObject:@"0"   forKey:@"arpQuantize"];
    [dict setObject:@"0"   forKey:@"arpVelocity"];
    [dict setObject:@"0"   forKey:@"arpMute"];
    [dict setObject:@"0"   forKey:@"arpRealTimeTranspose"];
    [dict setObject:@"0"   forKey:@"arpUserPatternGate"];
    [dict setObject:@"0"   forKey:@"partOutput"];
    [dict setObject:@"0"   forKey:@"arpOutput"];
    [dict setObject:@"0"   forKey:@"clock"];
    [dict setObject:@"0"   forKey:@"programMapBank"];
    [dict setObject:@"0"   forKey:@"arpFillin"];
    [dict setObject:@"0"   forKey:@"partFx"];
    [dict setObject:@"0"   forKey:@"partSustainMode"];
    [dict setObject:@"0"   forKey:@"oscTrigger"];
    [dict setObject:@"0"   forKey:@"polyphony"];
    [dict setObject:@"0"   forKey:@"sysexTxOption"];
    [dict setObject:@"0"   forKey:@"delaySync"];
    [dict setObject:@"0"   forKey:@"arpOctRange"];
    [dict setObject:@"0"   forKey:@"arpGateTime"];
    [dict setObject:@"0"   forKey:@"sysexRx"];
    [dict setObject:@"0"   forKey:@"partVelCurve"];
    [dict setObject:@"0"   forKey:@"delayRatio"];
    [dict setObject:@"0"   forKey:@"arpSync"];
    [dict setObject:@"0"   forKey:@"globalIncomingProgChange"];
    [dict setObject:@"0"   forKey:@"progMapBank"];
    [dict setObject:@"0"   forKey:@"lfo1Sync"];
    [dict setObject:@"0"   forKey:@"globalIncomingContChange"];
    [dict setObject:@"0"   forKey:@"partProgChangeFilter"];
    [dict setObject:@"0"   forKey:@"arpOutputRanging"];
    [dict setObject:@"0"   forKey:@"lfo2Sync"];
    [dict setObject:@"0"   forKey:@"partControlChangeFilt"];
    [dict setObject:@"0"   forKey:@"partPedal"];
    [dict setObject:@"0"   forKey:@"partSustain"];
    [dict setObject:@"0"   forKey:@"partPolyphony"];
    [dict setObject:@"0"   forKey:@"pedalMode"];
    [dict setObject:@"0"   forKey:@"vocoderSibilanceType"];
    [dict setObject:@"0"   forKey:@"vocoderInput"];
    [dict setObject:@"0"   forKey:@"vocoderInsert"];
    [dict setObject:@"0"   forKey:@"fxConfig"];
    [dict setObject:@"0"   forKey:@"partMute"];
    [dict setObject:@"0"   forKey:@"fxSend"];
    [dict setObject:@"0"   forKey:@"partSelect"];
    [dict setObject:@"0"   forKey:@"arpEdit"];
    [dict setObject:@"0"   forKey:@"breathMode"];
    [dict setObject:@"0"   forKey:@"phonesOutput"];
    [dict setObject:@"0"   forKey:@"bankSelect"];
    [dict setObject:@"0"   forKey:@"sustain"];
    [dict setObject:@"0"   forKey:@"masterVolume"];
    [dict setObject:@"0"   forKey:@"portamento"];
    [dict setObject:@"0"   forKey:@"osc1Fine"];
    [dict setObject:@"55"  forKey:@"osc1Soften"];
    [dict setObject:@"0"   forKey:@"osc1Width"];
    [dict setObject:@"0"   forKey:@"osc1Sync"];
    [dict setObject:@"0"   forKey:@"osc2Fine"];
    [dict setObject:@"0"   forKey:@"osc2Soften"];
    [dict setObject:@"0"   forKey:@"osc2Width"];
    [dict setObject:@"0"   forKey:@"osc2Sync"];
    [dict setObject:@"0"   forKey:@"osc3Fine"];
    [dict setObject:@"0"   forKey:@"osc3Soften"];
    [dict setObject:@"0"   forKey:@"osc3Width"];
    [dict setObject:@"0"   forKey:@"osc3Sync"];
    [dict setObject:@"0"   forKey:@"osc1Mix"];
    [dict setObject:@"0"   forKey:@"osc2Mix"];
    [dict setObject:@"0"   forKey:@"osc3Mix"];
    [dict setObject:@"0"   forKey:@"ring13Mix"];
    [dict setObject:@"0"   forKey:@"ring23Mix"];
    [dict setObject:@"0"   forKey:@"noiseMix"];
    [dict setObject:@"0"   forKey:@"lfo1Delay"];
    [dict setObject:@"0"   forKey:@"lfo1Offset"];
    [dict setObject:@"0"   forKey:@"lfo1Speed"];
    [dict setObject:@"0"   forKey:@"lfo2Delay"];
    [dict setObject:@"0"   forKey:@"lfo2Offset"];
    [dict setObject:@"0"   forKey:@"lfo2Speed"];
    [dict setObject:@"30"  forKey:@"env3Attack"];
    [dict setObject:@"10"  forKey:@"env3Decay"];
    [dict setObject:@"100" forKey:@"env3Sustain"];
    [dict setObject:@"30"  forKey:@"env3Release"];
    [dict setObject:@"0"   forKey:@"env3Velocity"];
    [dict setObject:@"0"   forKey:@"env3Delay"];
    [dict setObject:@"10"  forKey:@"env2Attack"];
    [dict setObject:@"100" forKey:@"env2Decay"];
    [dict setObject:@"20"  forKey:@"env2Sustain"];
    [dict setObject:@"10"  forKey:@"env2Release"];
    [dict setObject:@"0"   forKey:@"env2Velocity"];
    [dict setObject:@"0"   forKey:@"env2Delay"];
    [dict setObject:@"15"  forKey:@"env1Attack"];
    [dict setObject:@"50"  forKey:@"env1Decay"];
    [dict setObject:@"120" forKey:@"env1Sustain"];
    [dict setObject:@"127" forKey:@"env1Release"];
    [dict setObject:@"0"   forKey:@"env1Velocity"];
    [dict setObject:@"12"  forKey:@"noiseSoften"];
    [dict setObject:@"0"   forKey:@"filterOverdrive"];
    [dict setObject:@"0"   forKey:@"filterFrequency"];
    [dict setObject:@"0"   forKey:@"filterTracking"];
    [dict setObject:@"0"   forKey:@"filterResonance"];
    [dict setObject:@"0"   forKey:@"arpSpeed"];
    [dict setObject:@"0"   forKey:@"arpPattern"];
    [dict setObject:@"0"   forKey:@"arpLatch"];
    [dict setObject:@"0"   forKey:@"distortionSend"];
    [dict setObject:@"0"   forKey:@"distortionWheel"];
    [dict setObject:@"0"   forKey:@"panPosition"];
    [dict setObject:@"0"   forKey:@"reverbSend"];
    [dict setObject:@"0"   forKey:@"reverbWheel"];
    [dict setObject:@"0"   forKey:@"reverbDecay"];
    [dict setObject:@"0"   forKey:@"reverbHfDamp"];
    [dict setObject:@"0"   forKey:@"chorusSend"];
    [dict setObject:@"0"   forKey:@"chorusWheel"];
    [dict setObject:@"0"   forKey:@"chorusSpeed"];
    [dict setObject:@"0"   forKey:@"chorusModDepth"];
    [dict setObject:@"0"   forKey:@"chorusFeedback"];
    [dict setObject:@"0"   forKey:@"delaySend"];
    [dict setObject:@"0"   forKey:@"delayWheel"];
    [dict setObject:@"0"   forKey:@"delayTime"];
    [dict setObject:@"0"   forKey:@"delayFeedback"];
    [dict setObject:@"0"   forKey:@"delayHfDamp"];
    [dict setObject:@"0"   forKey:@"configMorph"];
    [dict setObject:@"0"   forKey:@"osc1PitchEnv2"];
    [dict setObject:@"0"   forKey:@"osc1PitchEnv3"];
    [dict setObject:@"0"   forKey:@"osc1PitchLfo1"];
    [dict setObject:@"0"   forKey:@"osc1SoftenEnv2"];
    [dict setObject:@"0"   forKey:@"osc1WidthEnv2"];
    [dict setObject:@"0"   forKey:@"osc1WidthLfo1"];
    [dict setObject:@"0"   forKey:@"osc1WidthLfo2"];
    [dict setObject:@"0"   forKey:@"osc1SyncEnv2"];
    [dict setObject:@"0"   forKey:@"osc1SyncLfo1"];
    [dict setObject:@"0"   forKey:@"osc2PitchEnv2"];
    [dict setObject:@"0"   forKey:@"osc2PitchEnv3"];
    [dict setObject:@"0"   forKey:@"osc2PitchLfo1"];
    [dict setObject:@"0"   forKey:@"osc2SoftenEnv2"];
    [dict setObject:@"0"   forKey:@"osc2WidthEnv2"];
    [dict setObject:@"0"   forKey:@"osc2WidthLfo1"];
    [dict setObject:@"0"   forKey:@"osc2WidthLfo2"];
    [dict setObject:@"0"   forKey:@"osc2SyncEnv2"];
    [dict setObject:@"0"   forKey:@"osc2SyncLfo1"];
    [dict setObject:@"0"   forKey:@"osc3PitchEnv2"];
    [dict setObject:@"0"   forKey:@"osc3PitchEnv3"];
    [dict setObject:@"0"   forKey:@"osc3PitchLfo1"];
    [dict setObject:@"0"   forKey:@"osc3SoftenEnv2"];
    [dict setObject:@"0"   forKey:@"osc3WidthEnv2"];
    [dict setObject:@"0"   forKey:@"osc3WidthLfo1"];
    [dict setObject:@"0"   forKey:@"osc3WidthLfo2"];
    [dict setObject:@"0"   forKey:@"osc3SyncEnv2"];
    [dict setObject:@"0"   forKey:@"osc3SyncLfo1"];
    [dict setObject:@"0"   forKey:@"osc1MixEnv2"];
    [dict setObject:@"0"   forKey:@"osc2MixEnv2"];
    [dict setObject:@"0"   forKey:@"osc3MixEnv2"];
    [dict setObject:@"0"   forKey:@"filterFrequencyEnv2"];
    [dict setObject:@"0"   forKey:@"filterFrequencyEnv3"];
    [dict setObject:@"0"   forKey:@"filterFrequencyLfo1"];
    [dict setObject:@"0"   forKey:@"filterFrequencyLfo2"];
    [dict setObject:@"0"   forKey:@"filterResonanceEnv2"];
    [dict setObject:@"0"   forKey:@"filterResonanceEnv3"];
    [dict setObject:@"0"   forKey:@"filterResonanceLfo1"];
    [dict setObject:@"0"   forKey:@"filterResonanceLfo2"];
    [dict setObject:@"0"   forKey:@"lfo1Env3SpeedMod"];
    [dict setObject:@"0"   forKey:@"lfo2Env3SpeedMod"];
    [dict setObject:@"0"   forKey:@"noiseMixEnv2"];
    [dict setObject:@"57"   forKey:@"osc1Semi"];
    [dict setObject:@"0"   forKey:@"osc2Semi"];
    [dict setObject:@"0"   forKey:@"osc3Semi"];
    [dict setObject:@"0"   forKey:@"breathSens"];
    [dict setObject:@"0"   forKey:@"osc1PitchbendRange"];
    [dict setObject:@"0"   forKey:@"osc2PitchbendRange"];
    [dict setObject:@"0"   forKey:@"osc3PitchbendRange"];
    [dict setObject:@"0"   forKey:@"input1Trim"];
    [dict setObject:@"0"   forKey:@"input2Trim"];
    [dict setObject:@"0"   forKey:@"filterWidth"];
    [dict setObject:@"0"   forKey:@"globalMidi"];
    [dict setObject:@"5"   forKey:@"partMidi"];
    [dict setObject:@"0"   forKey:@"vocoderSibilanceLevel"];
    [dict setObject:@"0"   forKey:@"vocoderWidth"];
    [dict setObject:@"0"   forKey:@"osc1PitchLfo2"];
    [dict setObject:@"0"   forKey:@"osc1PitchWheel"];
    [dict setObject:@"0"   forKey:@"osc1WidthEnv3"];
    [dict setObject:@"0"   forKey:@"osc1WidthWheel"];
    [dict setObject:@"0"   forKey:@"osc1SyncEnv3"];
    [dict setObject:@"0"   forKey:@"osc1SyncLfo2"];
    [dict setObject:@"0"   forKey:@"osc1SyncWheel"];
    [dict setObject:@"0"   forKey:@"osc1SoftenEnv3"];
    [dict setObject:@"0"   forKey:@"osc1SoftenLfo1"];
    [dict setObject:@"0"   forKey:@"osc1SoftenLfo2"];
    [dict setObject:@"0"   forKey:@"osc1SoftenWheel"];
    [dict setObject:@"0"   forKey:@"osc1MixEnv3"];
    [dict setObject:@"0"   forKey:@"osc1MixLfo1"];
    [dict setObject:@"0"   forKey:@"osc1MixLfo2"];
    [dict setObject:@"0"   forKey:@"osc1MixWheel"];
    [dict setObject:@"0"   forKey:@"osc2PitchLfo2"];
    [dict setObject:@"0"   forKey:@"osc2PitchWheel"];
    [dict setObject:@"0"   forKey:@"osc2WidthEnv3"];
    [dict setObject:@"0"   forKey:@"osc2WidthWheel"];
    [dict setObject:@"0"   forKey:@"osc2SyncEnv3"];
    [dict setObject:@"0"   forKey:@"osc2SyncLfo2"];
    [dict setObject:@"0"   forKey:@"osc2SyncWheel"];
    [dict setObject:@"0"   forKey:@"osc2SoftenEnv3"];
    [dict setObject:@"0"   forKey:@"osc2SoftenLfo1"];
    [dict setObject:@"0"   forKey:@"osc2SoftenLfo2"];
    [dict setObject:@"0"   forKey:@"osc2SoftenWheel"];
    [dict setObject:@"0"   forKey:@"osc2MixEnv3"];
    [dict setObject:@"0"   forKey:@"osc2MixLfo1"];
    [dict setObject:@"0"   forKey:@"osc2MixLfo2"];
    [dict setObject:@"0"   forKey:@"osc2MixWheel"];
    [dict setObject:@"0"   forKey:@"osc3PitchLfo2"];
    [dict setObject:@"0"   forKey:@"osc3PitchWheel"];
    [dict setObject:@"0"   forKey:@"osc3WidthEnv3"];
    [dict setObject:@"0"   forKey:@"osc3WidthWheel"];
    [dict setObject:@"0"   forKey:@"osc3SyncEnv3"];
    [dict setObject:@"0"   forKey:@"osc3SyncLfo2"];
    [dict setObject:@"0"   forKey:@"osc3SyncWheel"];
    [dict setObject:@"0"   forKey:@"osc3SoftenEnv3"];
    [dict setObject:@"0"   forKey:@"osc3SoftenLfo1"];
    [dict setObject:@"0"   forKey:@"osc3SoftenLfo2"];
    [dict setObject:@"0"   forKey:@"osc3SoftenWheel"];
    [dict setObject:@"0"   forKey:@"osc3MixEnv3"];
    [dict setObject:@"0"   forKey:@"osc3MixLfo1"];
    [dict setObject:@"0"   forKey:@"osc3MixLfo2"];
    [dict setObject:@"0"   forKey:@"osc3MixWheel"];
    [dict setObject:@"0"   forKey:@"ringMod13MixEnv2"];
    [dict setObject:@"0"   forKey:@"ringMod13MixEnv3"];
    [dict setObject:@"0"   forKey:@"ringMod13MixLfo1"];
    [dict setObject:@"0"   forKey:@"ringMod13MixLfo2"];
    [dict setObject:@"0"   forKey:@"ringMod13MixWheel"];
    [dict setObject:@"0"   forKey:@"ringMod23MixEnv2"];
    [dict setObject:@"0"   forKey:@"ringMod23MixEnv3"];
    [dict setObject:@"0"   forKey:@"ringMod23MixLfo1"];
    [dict setObject:@"0"   forKey:@"ringMod23MixLfo2"];
    [dict setObject:@"0"   forKey:@"ringMod23MixWheel"];
    [dict setObject:@"0"   forKey:@"noiseSoftenEnv2"];
    [dict setObject:@"0"   forKey:@"noiseSoftenEnv3"];
    [dict setObject:@"0"   forKey:@"noiseSoftenLfo1"];
    [dict setObject:@"0"   forKey:@"noiseSoftenLfo2"];
    [dict setObject:@"0"   forKey:@"noiseSoftenWheel"];
    [dict setObject:@"0"   forKey:@"noiseMixEnv3"];
    [dict setObject:@"0"   forKey:@"noiseMixLfo1"];
    [dict setObject:@"0"   forKey:@"noiseMixLfo2"];
    [dict setObject:@"0"   forKey:@"noiseMixWheel"];
    [dict setObject:@"0"   forKey:@"osc1WheelLfo1"];
    [dict setObject:@"0"   forKey:@"osc2WheelLfo1"];
    [dict setObject:@"0"   forKey:@"osc3WheelLfo1"];
    [dict setObject:@"0"   forKey:@"osc1AfterTouchLfo1"];
    [dict setObject:@"0"   forKey:@"osc2AfterTouchLfo1"];
    [dict setObject:@"0"   forKey:@"osc3AfterTouchLfo1"];
    [dict setObject:@"0"   forKey:@"lfo1AfterTouchSpeedMod"];
    [dict setObject:@"0"   forKey:@"lfo2AfterTouchSpeedMod"];
    [dict setObject:@"0"   forKey:@"filterFrequencyWheel"];
    [dict setObject:@"0"   forKey:@"filterResonanceWheel"];
    [dict setObject:@"0"   forKey:@"filterFrequencyWheelLfo2"];
    [dict setObject:@"0"   forKey:@"filterResonanceWheelLfo2"];
    [dict setObject:@"0"   forKey:@"filterFrequencyAfterTouchLfo2"];
    [dict setObject:@"0"   forKey:@"filterResonanceAfterTouchLfo2"];
    [dict setObject:@"0"   forKey:@"filterFrequencyAfterTouch"];
    [dict setObject:@"0"   forKey:@"filterResonanceAfterTouch"];
    [dict setObject:@"0"   forKey:@"lfo1WheelSpeedMod"];
    [dict setObject:@"0"   forKey:@"lfo2WheelSpeedMod"];
    [dict setObject:@"0"   forKey:@"env1Wheel"];
    [dict setObject:@"0"   forKey:@"env1AfterTouch"];
*/
    [defaults registerDefaults:dict];
}

-(id)init
{
    self=[super init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
#include "GeneratedFiles/ProgInit";
    return self;
}

-(id)initWithSysex:(NSData *)sysex
{
    Byte sysexBuffer[SYSEXBUFSIZE];
    [sysex getBytes:sysexBuffer];
    [self init];
    
    //[self setVocoderBalance:sysexBuffer[25]];
#include "GeneratedFiles/ProgInitWithSysex";  
    //This lot should be set automatically !!!!!!
    //and maybe need to be offset by $6
  /*  vocoderBalance                  =sysexBuffer[25];
    osc1Wave                        =sysexBuffer[31];
    osc1Oct                         =sysexBuffer[32];
    osc1Semi                        =sysexBuffer[33];
    osc1Fine                        =sysexBuffer[34];
    osc1PitchbendRange              =sysexBuffer[35];
    osc1Pitch                       =sysexBuffer[36];
    osc1PitchWheel                  =sysexBuffer[37];
    osc1PitchEnv2                   =sysexBuffer[38];
    osc1PitchEnv3                   =sysexBuffer[39];
    osc1PitchLfo1                   =sysexBuffer[40];
    osc1PitchLfo2                   =sysexBuffer[41];
    osc1WheelLfo1                   =sysexBuffer[42];
    osc1AfterTouchLfo1              =sysexBuffer[43];
    osc1Soften                      =sysexBuffer[44];
    osc1SoftenWheel                 =sysexBuffer[45];
    osc1SoftenEnv2                  =sysexBuffer[46];
    osc1SoftenEnv3                  =sysexBuffer[47];
    osc1SoftenLfo1                  =sysexBuffer[48];
    osc1SoftenLfo2                  =sysexBuffer[49];
    osc1Width                       =sysexBuffer[50];
    osc1WidthWheel                  =sysexBuffer[51];
    osc1WidthEnv2                   =sysexBuffer[52];
    osc1WidthEnv3                   =sysexBuffer[53];
    osc1WidthLfo1                   =sysexBuffer[54];
    osc1WidthLfo2                   =sysexBuffer[55];
    osc1Sync                        =sysexBuffer[56];
    osc1SyncWheel                   =sysexBuffer[57];
    osc1SyncEnv2                    =sysexBuffer[58];
    osc1SyncEnv3                    =sysexBuffer[59];
    osc1SyncLfo1                    =sysexBuffer[60];
    osc1SyncLfo2                    =sysexBuffer[61];
    osc1SyncKeyFollow               =sysexBuffer[62];
    osc1SyncSkew                    =sysexBuffer[63];
    osc1FormantWidth                =sysexBuffer[64];
    osc2Wave                        =sysexBuffer[65];
    osc2Oct                         =sysexBuffer[66];
    osc2Semi                        =sysexBuffer[67];
    osc2Fine                        =sysexBuffer[68];
    osc2PitchbendRange              =sysexBuffer[69];
    osc2Pitch                       =sysexBuffer[70];
    osc2PitchWheel                  =sysexBuffer[71];
    osc2PitchEnv2                   =sysexBuffer[72];
    osc2PitchEnv3                   =sysexBuffer[73];
    osc2PitchLfo1                   =sysexBuffer[74];
    osc2PitchLfo2                   =sysexBuffer[75];
    osc2WheelLfo1                   =sysexBuffer[76];
    osc2AfterTouchLfo1              =sysexBuffer[77];
    osc2Soften                      =sysexBuffer[78];
    osc2SoftenWheel                 =sysexBuffer[79];
    osc2SoftenEnv2                  =sysexBuffer[80];
    osc2SoftenEnv3                  =sysexBuffer[81];
    osc2SoftenLfo1                  =sysexBuffer[82];
    osc2SoftenLfo2                  =sysexBuffer[83];
    osc2Width                       =sysexBuffer[84];
    osc2WidthWheel                  =sysexBuffer[85];
    osc2WidthEnv2                   =sysexBuffer[86];
    osc2WidthEnv3                   =sysexBuffer[87];
    osc2WidthLfo1                   =sysexBuffer[88];
    osc2WidthLfo2                   =sysexBuffer[89];
    osc2Sync                        =sysexBuffer[90];
    osc2SyncWheel                   =sysexBuffer[91];
    osc2SyncEnv2                    =sysexBuffer[92];
    osc3SyncEnv3                    =sysexBuffer[93];
    osc2SyncLfo1                    =sysexBuffer[94];
    osc2SyncLfo2                    =sysexBuffer[95];
    osc2SyncKeyFollow               =sysexBuffer[96];
    osc2SyncSkew                    =sysexBuffer[97];
    osc2FormantWidth                =sysexBuffer[98];
    osc3Wave                        =sysexBuffer[99];
    osc3Oct                         =sysexBuffer[100];
    osc3Semi                        =sysexBuffer[101];
    osc3Fine                        =sysexBuffer[102];
    osc3PitchbendRange              =sysexBuffer[103];
    osc3Pitch                       =sysexBuffer[104];
    osc3PitchWheel                  =sysexBuffer[105];
    osc3PitchEnv2                   =sysexBuffer[106];
    osc3PitchEnv3                   =sysexBuffer[107];
    osc3PitchLfo1                   =sysexBuffer[108];
    osc3PitchLfo2                   =sysexBuffer[109];
    osc3WheelLfo1                   =sysexBuffer[110];
    osc3AfterTouchLfo1              =sysexBuffer[111];
    osc3Soften                      =sysexBuffer[112];
    osc3SoftenWheel                 =sysexBuffer[113];
    osc3SoftenEnv2                  =sysexBuffer[114];
    osc3SoftenEnv3                  =sysexBuffer[115];
    osc3SoftenLfo1                  =sysexBuffer[116];
    osc3SoftenLfo2                  =sysexBuffer[117];
    osc3Width                       =sysexBuffer[118];
    osc3WidthWheel                  =sysexBuffer[119];
    osc3WidthEnv2                   =sysexBuffer[120];
    osc3WidthEnv3                   =sysexBuffer[121];
    osc3WidthLfo1                   =sysexBuffer[122];
    osc3WidthLfo2                   =sysexBuffer[123];
    osc3Sync                        =sysexBuffer[124];
    osc3SyncWheel                   =sysexBuffer[125];
    osc3SyncEnv2                    =sysexBuffer[126];
    osc3SyncEnv3                    =sysexBuffer[127];
    osc3SyncLfo1                    =sysexBuffer[128];
    osc3SyncLfo2                    =sysexBuffer[129];
    osc3SyncKeyFollow               =sysexBuffer[130];
    osc3SyncSkew                    =sysexBuffer[131];
    osc3FormantWidth                =sysexBuffer[132];
    osc1Mix                         =sysexBuffer[133];
    osc1MixWheel                    =sysexBuffer[134];
    osc1MixEnv2                     =sysexBuffer[135];
    osc1MixEnv3                     =sysexBuffer[136];
    osc1MixLfo1                     =sysexBuffer[137];
    osc1MixLfo2                     =sysexBuffer[138];
    osc2Mix                         =sysexBuffer[139];
    osc2MixWheel                    =sysexBuffer[140];
    osc2MixEnv2                     =sysexBuffer[141];
    osc2MixEnv3                     =sysexBuffer[142];
    osc2MixLfo1                     =sysexBuffer[143];
    osc2MixLfo2                     =sysexBuffer[144];
    osc3Mix                         =sysexBuffer[145];
    osc3MixWheel                    =sysexBuffer[146];
    osc3MixEnv2                     =sysexBuffer[147];
    osc3MixEnv3                     =sysexBuffer[148];
    osc3MixLfo1                     =sysexBuffer[149];
    osc3MixLfo2                     =sysexBuffer[150];
    lfo1Delay                       =sysexBuffer[169];
    lfo1Shape                       =sysexBuffer[170];
    lfo1Offset                      =sysexBuffer[171];
    lfo1Speed                       =sysexBuffer[172];
    lfo1Env3SpeedMod                =sysexBuffer[173];
    lfo1WheelSpeedMod               =sysexBuffer[174];
    lfo1AfterTouchSpeedMod          =sysexBuffer[175];
    lfo1Sync                        =sysexBuffer[176];
    lfo1Trigger                     =sysexBuffer[177];
    lfo1DelayTrigger                =sysexBuffer[178];
    lfo2Delay                       =sysexBuffer[179];
    lfo2Shape                       =sysexBuffer[180];
    lfo2Offset                      =sysexBuffer[181];
    lfo2Speed                       =sysexBuffer[182];
    lfo2Env3SpeedMod                =sysexBuffer[183];
    lfo2WheelSpeedMod               =sysexBuffer[184];
    lfo2AfterTouchSpeedMod          =sysexBuffer[185];
    lfo2Sync                        =sysexBuffer[186];
    lfo2Trigger                     =sysexBuffer[187];
    lfo2DelayTrigger                =sysexBuffer[188];
    lfo1Range                       =sysexBuffer[189];
    lfo2Range                       =sysexBuffer[190];
    env3Attack                      =sysexBuffer[191];
    env3Decay                       =sysexBuffer[192];
    env3Sustain                     =sysexBuffer[193];
    env3Release                     =sysexBuffer[194];
    env3Velocity                    =sysexBuffer[195];
    env3Delay                       =sysexBuffer[196];
    env2Attack                      =sysexBuffer[197];
    env2Decay                       =sysexBuffer[198];
    env2Sustain                     =sysexBuffer[199];
    env2Release                     =sysexBuffer[200];
    env2Velocity                    =sysexBuffer[201];
    env2Delay                       =sysexBuffer[202];
    env1Attack                      =sysexBuffer[203];
    env1Decay                       =sysexBuffer[204];
    env1Sustain                     =sysexBuffer[205];
    env1Release                     =sysexBuffer[206];
    env1Velocity                    =sysexBuffer[207];
    env1Wheel                       =sysexBuffer[208];
    env1AfterTouch                  =sysexBuffer[209];
    filterType                      =sysexBuffer[216];
    filterDB                        =sysexBuffer[217];
    //setArpOutputRanging           =sysexBuffer[];
    //setArpConstPitch              =sysexBuffer[];
    //setVocoderSibilanceType       =sysexBuffer[];
    //setFilterWidth                =sysexBuffer[];
    filterOverdrive                 =sysexBuffer[219];
    filterFrequency                 =sysexBuffer[220];
    filterFrequencyWheel            =sysexBuffer[221];
    filterFrequencyAfterTouch       =sysexBuffer[222];
    filterFrequencyEnv2             =sysexBuffer[223];
    filterFrequencyEnv3             =sysexBuffer[224];
    filterFrequencyLfo1             =sysexBuffer[225];
    filterFrequencyLfo2             =sysexBuffer[226];
    filterFrequencyWheelLfo2        =sysexBuffer[227];
    filterFrequencyAfterTouchLfo2   =sysexBuffer[228];
    filterTracking                  =sysexBuffer[229];
    filterResonance                 =sysexBuffer[230];
    filterResonanceWheel            =sysexBuffer[231];
    filterResonanceAfterTouch       =sysexBuffer[232];
    filterResonanceEnv2             =sysexBuffer[233];
    filterResonanceEnv3             =sysexBuffer[234];
    filterResonanceLfo1             =sysexBuffer[235];
    filterResonanceLfo2             =sysexBuffer[236];
    filterResonanceWheelLfo2        =sysexBuffer[237];
    filterResonanceAfterTouchLfo2   =sysexBuffer[238];
    filterQNorm                     =sysexBuffer[239];
    portamento                      =sysexBuffer[240];
    //setEnv1Trigger                =sysexBuffer[];
    //setEnv2Trigger                =sysexBuffer[];
    //setEnv3Trigger                =sysexBuffer[];
    polyphony                       =sysexBuffer[247];
    arpSpeed                        =sysexBuffer[248];
    arpPatternBank                  =sysexBuffer[249];
    arpPattern                      =sysexBuffer[250];
    arpVelocity                     =sysexBuffer[251];
    arpKeyReset                     =sysexBuffer[252];
    arpFillin                       =sysexBuffer[253];
    arpQuantize                     =sysexBuffer[254];
    arpLatch                        =sysexBuffer[255];
    arpLatchType                    =sysexBuffer[256];
    arpOn                           =sysexBuffer[258];
    arpRealTimeTranspose            =sysexBuffer[259];
    arpSync                         =sysexBuffer[260];
    arpGateTime                     =sysexBuffer[261];
    vocoderWidth                    =sysexBuffer[262];
    distortionSend                  =sysexBuffer[263];
    distortionWheel                 =sysexBuffer[264];
    eqBass                          =sysexBuffer[265];
    eqTreble                        =sysexBuffer[266];
    combFrequency                   =sysexBuffer[267];
    combBoost                       =sysexBuffer[268];
    panDryLevel                     =sysexBuffer[269];
    panPosition                     =sysexBuffer[270];
    panSpeed                        =sysexBuffer[271];
    panDepth                        =sysexBuffer[272];
    panType                         =sysexBuffer[273];
    reverbSend                      =sysexBuffer[274];
    reverbWheel                     =sysexBuffer[275];
    reverbDecay                     =sysexBuffer[276];
    reverbHfDamp                    =sysexBuffer[277];
    //
    chorusSend                      =sysexBuffer[279];
    chorusWheel                     =sysexBuffer[280];
    chorusSpeed                     =sysexBuffer[281];
    chorusModDepth                  =sysexBuffer[282];
    chorusFeedback                  =sysexBuffer[283];
    //
    delaySend                       =sysexBuffer[285];
    delayWheel                      =sysexBuffer[286];
    delayTime                       =sysexBuffer[287];
    delayFeedback                   =sysexBuffer[288];
    delayHfDamp                     =sysexBuffer[289];
    delayRatio                      =sysexBuffer[290];
    delayStereoWidth                =sysexBuffer[291];
    delaySync                       =sysexBuffer[292];
    fxConfig                        =sysexBuffer[293];
    configMorph                     =sysexBuffer[294];
    */
    return self;
    
}

-(NSDictionary *)asDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
#include "GeneratedFiles/ProgAsDictionary";
    return dict;
}

-(void)fromDictionary:(NSDictionary*)dict
{
    id value;
#include "GeneratedFiles/ProgFromDictionary";
    }

@end
