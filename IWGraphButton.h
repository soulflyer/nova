/* GraphButton */

#import <Cocoa/Cocoa.h>

@interface IWGraphButton : NSButton
{
    NSImage * buttonImage;
    float lineWidth;
}
-(void)drawEnv;
-(void)drawEnvWithAttack:(int)attack decay:(int)decay sustain:(int)sustain release:(int)release;
-(void)drawWave:(int)wave soften:(int)soften pulseWidth:(int)pulseWidth;
-(void)drawNoise;
-(void)drawNoiseWithSoften:(int)soften;
-(void)drawSquareWaveInRect:(NSRect)rect soften:(int)soften pulseWidth:(int)pulseWidth;
-(void)drawSawWaveInRect:(NSRect)rect soften:(int)soften;
-(void)drawSawWaveInRect:(NSRect)rect;
-(void)drawSquareWaveInRect:(NSRect)rect;
-(void)drawTriangleWaveInRect:(NSRect)rect;
-(void)drawLFO:(int)wave;
-(void)drawSampleandHoldInRect:(NSRect)rect;
-(void)drawFilter:(int)type slope:(int)slope frequency:(int)frequency resonance:(int)resonance width:(int)width; 
//-(void)drawFilterInRect:(NSRect)rect type:(int)type slope:(int)slope frequency:(int)frequency resonance:(int)resonance width:(int)width; 
-(void)drawFilterInRect:(NSRect)rect type:(int)type slope:(int)slope frequency:(float)frequencyF resonance:(float)resonanceF width:(float)width;
-(void)drawInput:(int)input;

@end
