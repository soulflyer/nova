#import "IWPanel.h"

@implementation IWPanel

-(void)keyDown:(NSEvent *)theEvent
{
    if([[theEvent characters] isEqualToString:@" "])
    {
        if (![theEvent isARepeat])
        {
            [novaController sendMidiNoteOn];
        }
    }
    else
    {
        [super keyDown:theEvent];
    }
}

-(void)keyUp:(NSEvent *)theEvent
{
    if([[theEvent characters] isEqualToString:@" "])
    {
        [novaController sendMidiNoteOff];
    }
    else
    {
        [super keyUp:theEvent];
    }
}

-(id)initWithContentRect:(NSRect)contentRect styleMask:(unsigned int)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    [self setInitialFirstResponder:(id)self];
    return [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
}

@end
