/* IWDarkSliderCell */

#import <Cocoa/Cocoa.h>

@interface IWDarkSliderCell : NSSliderCell
{
    NSImage * knobImage;
    NSImage * knobImageV;
    NSImage * knobImageH;
    NSImage * knobImageVUnlit;
    NSImage * knobImageHUnlit;
    NSImage * knobImageVLit;
    NSImage * knobImageHLit;
    NSImage * slotImageV;
    NSImage * slotImageH;
    BOOL lit;
}
//-(void)setLit:(BOOL)value;
-(void)setLit;
-(void)setUnlit;
-(void)flash;
-(void)drawUnlit:(NSRect)knobRect;
-(void)drawLit:(NSRect)knobRect;

@end
