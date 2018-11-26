#import "IWDarkSliderCell.h"

//How about a setLit method? changes knobImage[VH] to be a version with a red centre
//This would be called before (and reset after) a slider is set by incoming midi, from
//buildCCCases etc.

@implementation IWDarkSliderCell
-(id)initWithCoder:(NSCoder *)encoder
{
    self=[super initWithCoder:(NSCoder *)encoder];
    knobImageVUnlit=[NSImage imageNamed:@"DarkKnobV"];
    knobImageHUnlit=[NSImage imageNamed:@"DarkKnobH"];
    knobImageVLit=[NSImage imageNamed:@"DarkKnobVLit"];
    knobImageHLit=[NSImage imageNamed:@"DarkKnobHLit"];
    knobImageV=knobImageVUnlit;
    knobImageH=knobImageHUnlit;
    slotImageV=[NSImage imageNamed:@"DarkSlotV"];
    slotImageH=[NSImage imageNamed:@"DarkSlotH"];
    [knobImageV setScalesWhenResized:YES];
    [knobImageH setScalesWhenResized:YES];
    [slotImageV setScalesWhenResized:YES];
    [slotImageH setScalesWhenResized:YES];
    [knobImageVLit setScalesWhenResized:YES];
    [knobImageHLit setScalesWhenResized:YES];
    lit=false;
    return self;
}

-(void)drawUnlit:(NSRect)knobRect
{
    //NSLog(@"In drawUnlit");
    if([super isVertical])
    {
        [knobImageVUnlit setSize:knobRect.size];
        [knobImageVUnlit compositeToPoint:NSMakePoint(knobRect.origin.x,knobRect.origin.y+knobRect.size.height)
                                operation:NSCompositingOperationSourceOver];
    }   
    else
    {
        [knobImageHUnlit setSize:knobRect.size];
        [knobImageHUnlit compositeToPoint:NSMakePoint(knobRect.origin.x,knobRect.origin.y+knobRect.size.height)
                                operation:NSCompositingOperationSourceOver];
    }    
}

-(void)drawLit:(NSRect)knobRect
{
    //NSLog(@"In drawLit");
    if([super isVertical])
    {
        [knobImageVLit setSize:knobRect.size];
        [knobImageVLit compositeToPoint:NSMakePoint(knobRect.origin.x,knobRect.origin.y+knobRect.size.height)
                              operation:NSCompositingOperationSourceOver];
    }   
    else
    {
        [knobImageHLit setSize:knobRect.size];
        [knobImageHLit compositeToPoint:NSMakePoint(knobRect.origin.x,knobRect.origin.y+knobRect.size.height)
                              operation:NSCompositingOperationSourceOver];
    }    
}


-(void)drawKnob:(NSRect)knobRect
{
    NSRunLoop * loop;
    loop = [NSRunLoop currentRunLoop];
    NSTimer * timer;
    NSMethodSignature * sig;
    NSInvocation * inv;
    [self drawUnlit:knobRect];

    sig=[self methodSignatureForSelector:@selector(drawUnlit:)];
    inv=[NSInvocation invocationWithMethodSignature:sig];
    [inv setArgument:&knobRect atIndex:2];
    [inv setSelector:@selector(drawLit:)];
    [inv setTarget:self];
    timer=[NSTimer timerWithTimeInterval:8 invocation:inv repeats:NO];
    //timer=[NSTimer timerWithTimeInterval:4 target:self selector:@selector(drawUnlit:) userInfo:nil repeats:NO];
    [loop addTimer:timer forMode:NSDefaultRunLoopMode];
}
-(void)drawBarInside:(NSRect)aRect flipped:(BOOL)flipped
{
    if([super isVertical])
    {
        [slotImageV setSize:aRect.size];
        [slotImageV compositeToPoint:NSMakePoint(aRect.origin.x,aRect.origin.y+aRect.size.height)
                           operation:NSCompositingOperationSourceOver];
    }   
    else
    {
        [slotImageH setSize:aRect.size];
        [slotImageH compositeToPoint:NSMakePoint(aRect.origin.x,aRect.origin.y+aRect.size.height)
                           operation:NSCompositingOperationSourceOver];
    }
}

-(void)flash
{
    NSRunLoop * loop;
    loop = [NSRunLoop currentRunLoop];
    NSTimer * timer;
    [self setLit];
    timer=[NSTimer timerWithTimeInterval:2 target:self selector:@selector(setUnlit) userInfo:nil repeats:NO];
    [loop addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void)setLit
{
    lit=true;
    //knobImageV=knobImageVLit;
    //knobImageH=knobImageHLit;
}

-(void)setUnlit
{
    lit=false;
    NSLog(@"Unlit");
    //knobImageV=knobImageVUnlit;
    //knobImageH=knobImageHUnlit;
}

/*-(void)setLit:(BOOL)value
{
    if(value)
    {
        knobImageV=knobImageVLit;
        knobImageH=knobImageHLit;
    }
    else
    {
        knobImageV=knobImageVUnlit;
        knobImageH=knobImageHUnlit;
    }
}*/
@end
