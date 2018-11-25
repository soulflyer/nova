#import "IWGraphButton.h"
#import "IWNovaColour.h"

@implementation IWGraphButton
-(id)initWithCoder:(NSCoder *)encoder
{
    self=[super initWithCoder:(NSCoder *)encoder];
    lineWidth=4;
    buttonImage=[[NSImage alloc] initWithSize:[self bounds].size];
    [buttonImage setScalesWhenResized:true];
    [buttonImage setBackgroundColor:[NSColor clearColor]];
    [self setImage:buttonImage];
    [buttonImage lockFocus];
    [[NSColor novaGraphColour] set];
    [[NSBezierPath bezierPathWithRect:[self bounds]] fill];
    [buttonImage unlockFocus];

    //[self drawWave:1 soften:127 pulseWidth:0];
    
    return self;
}

-(void)drawEnv
{
    [self drawEnvWithAttack:65 decay:65 sustain:65 release:65];
}

-(void)drawLFO:(int)wave
{
    NSRect rect=NSMakeRect([self bounds].origin.x+lineWidth/2,[self bounds].origin.y+lineWidth/2,
                           [self bounds].size.width-lineWidth,[self bounds].size.height-lineWidth);
    int waves=2;
    int i;
    
    [buttonImage lockFocus];
    [[NSColor novaGraphColour] set];
    [[NSBezierPath bezierPathWithRect:[self bounds]] fill];
    [[NSColor novaLineColour] set];
    
    for(i=0;i<waves;i++)
    {
        rect=NSMakeRect([self bounds].origin.x+lineWidth/2+i*([self bounds].size.width-lineWidth)/waves,
                        [self bounds].origin.y+lineWidth/2,
                        ([self bounds].size.width-lineWidth)/waves,
                        [self bounds].size.height-lineWidth);
        switch(wave)
        {
            case 0://Square Wave
                [self drawSquareWaveInRect:rect];
                break;
            case 1: //Saw wave
                [self drawSawWaveInRect:rect];
                break;
            case 2:
                [self drawTriangleWaveInRect:rect];
                break;
            case 3:
                [self drawSampleandHoldInRect:rect];
                break;
        }
    }
    
    [buttonImage unlockFocus];
    [self setImage:buttonImage];
    [self setNeedsDisplay:YES]; 
}

-(void)drawEnvWithAttack:(int)attack decay:(int)decay sustain:(int)sustain release:(int)release
{
    NSRect rect=NSMakeRect([self bounds].origin.x+lineWidth/2,[self bounds].origin.y+lineWidth/2,
                           [self bounds].size.width-lineWidth,[self bounds].size.height-lineWidth);
    NSBezierPath *path;
    NSPoint start,end;
    NSPoint pointOne, pointTwo, pointThree;
    float attackF,decayF,sustainF,releaseF;
    attackF=attack/127.0;
    decayF=decay/127.0;
    sustainF=sustain/127.0;
    releaseF=release/127.0;
    start=rect.origin;
    end=NSMakePoint(rect.origin.x+rect.size.width,rect.origin.y);
    pointOne=NSMakePoint(rect.origin.x+rect.size.width*attackF/4,rect.origin.y+rect.size.height);
    pointTwo=NSMakePoint(rect.origin.x+rect.size.width*(attackF+decayF)/4,rect.origin.y+rect.size.height*sustainF);
    pointThree=NSMakePoint(rect.origin.x+rect.size.width*(1-releaseF/4),rect.origin.y+rect.size.height*sustainF);

    [buttonImage lockFocus];
    [[NSColor novaGraphColour] set];
    [[NSBezierPath bezierPathWithRect:[self bounds]] fill];
    [[NSColor novaLineColour] set];
        
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth];
    [path moveToPoint:start];
    [path lineToPoint:pointOne];
    [path lineToPoint:pointTwo];
    [path lineToPoint:pointThree];
    [path lineToPoint:end];
    [path stroke];
    [buttonImage unlockFocus];
    [self setImage:buttonImage];
    [self setNeedsDisplay:YES]; 
    
}

-(void)drawNoise
{
    [self drawNoiseWithSoften:0];
}
-(void)drawNoiseWithSoften:(int)soften
{
    int steps=60;
    int toggle=1;
    int i;
    float multiplier, softenF;
    NSRect rect=NSMakeRect([self bounds].origin.x+lineWidth/2,[self bounds].origin.y+lineWidth/2,
                           [self bounds].size.width-lineWidth,[self bounds].size.height-lineWidth);
    NSBezierPath *path;
    NSPoint start,end;
    softenF=soften/127.0;
    start=NSMakePoint(rect.origin.x,rect.origin.y+rect.size.height/2);
    end=NSMakePoint(rect.origin.x+rect.size.width,rect.origin.y+rect.size.height/2);
    [buttonImage lockFocus];
    [[NSColor novaGraphColour] set];
    [[NSBezierPath bezierPathWithRect:[self bounds]] fill];
    [[NSColor novaLineColour] set];
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth/4];
    [path moveToPoint:start];
    for(i=1;i<steps;i++)
    {
        multiplier=1-softenF*((float)i/steps);
        NSPoint point=NSMakePoint(rect.origin.x+rect.size.width*i/steps,
                                   rect.origin.y+rect.size.height/2+multiplier*(toggle*rect.size.height/2)*(1+(double)rand()/(double)RAND_MAX)/2);
        [path lineToPoint:point];
        if(toggle==1)
            toggle=-1;
        else
            toggle=1;
    }
    [path lineToPoint:end];
    [path stroke];
    [buttonImage unlockFocus];
    [self setImage:buttonImage];
    [self setNeedsDisplay:YES];    
}

-(void)drawFilter:(int)typeIn slope:(int)slope frequency:(int)frequency resonance:(int)resonance width:(int)width
{ 
    float maxWidthF=0.15;
    float widthF=((width-103)/5.0)*maxWidthF;
    float frequencyF=frequency/127.0;
    float resonanceF=resonance/127.0;

    
    //type is a value between 3 and 12 so:
    int type=typeIn;
    
    [buttonImage lockFocus];
    [[NSColor novaGraphColour] set];
    [[NSBezierPath bezierPathWithRect:[self bounds]] fill];
    [[NSColor novaLineColour] set];
    
    NSRect rect=NSMakeRect([self bounds].origin.x+lineWidth/2,[self bounds].origin.y+lineWidth/2,
                           [self bounds].size.width-lineWidth,[self bounds].size.height-lineWidth);
    /* These 2 statements create rects that expand as filterWidth changes. Looks good but isn't as "accurate" as the following 2 statements.    
        NSRect rect1=NSMakeRect([self bounds].origin.x+lineWidth/2,[self bounds].origin.y+lineWidth/2,
                                [self bounds].size.width-lineWidth-widthF*[self bounds].size.width,[self bounds].size.height-lineWidth);    
    NSRect rect2=NSMakeRect([self bounds].origin.x+lineWidth/2+widthF*[self bounds].size.width,[self bounds].origin.y+lineWidth/2,
                            [self bounds].size.width-lineWidth-widthF*[self bounds].size.width,([self bounds].size.height-lineWidth)*0.9);*/
    NSRect rect1=NSMakeRect([self bounds].origin.x+lineWidth/2,[self bounds].origin.y+lineWidth/2,
                            [self bounds].size.width-lineWidth-maxWidthF*[self bounds].size.width,[self bounds].size.height-lineWidth);    
    NSRect rect2=NSMakeRect([self bounds].origin.x+lineWidth/2+widthF*[self bounds].size.width,[self bounds].origin.y+lineWidth/2,
                            [self bounds].size.width-lineWidth-maxWidthF*[self bounds].size.width,([self bounds].size.height-lineWidth)*0.9);
    
    switch(type)
    {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            [self drawFilterInRect:rect type:type slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            break;
        case 7:
            [self drawFilterInRect:rect2 type:0 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            [self drawFilterInRect:rect1 type:0 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            break;
        case 8:
            [self drawFilterInRect:rect2 type:1 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            [self drawFilterInRect:rect1 type:1 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            break;
        case 9:
            [self drawFilterInRect:rect2 type:2 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            [self drawFilterInRect:rect1 type:2 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            break;
        case 10:
            [self drawFilterInRect:rect2 type:1 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            [self drawFilterInRect:rect1 type:0 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            break;
        case 11:
            [self drawFilterInRect:rect2 type:2 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            [self drawFilterInRect:rect1 type:1 slope:slope frequency:frequencyF resonance:resonanceF width:widthF];
            break;
    }
    [buttonImage unlockFocus];
    [self setImage:buttonImage];
    [self setNeedsDisplay:YES];            
}

    
/*-(void)drawFilterInRect:(NSRect)rect type:(int)type slope:(int)slope frequency:(int)frequency resonance:(int)resonance width:(int)width
{
    float peakX,rectHeight,height,frequencyF,resonanceF,availableWidth,margin,slopeX,y0,y1,y2,y3,y4,y5,y6,y7,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,xa,xb,xc,xd,xe,xf,xg;
    float maxWidthF=0.15;
    //type is a value between 3 and 12 so:
    //int type=typeIn-3;
    float widthF=(width/127.0)*maxWidthF;
    //float widthF=(width-102)*0.2*maxWidthF;
    
    NSBezierPath *path;
    switch(type)
    {
        case 0:
        case 2:
        case 6:
            widthF=0;
            height=0.7;
            break;
        case 1: 
            widthF=0;
            height=0.1;
            break;
        case 4:
            height=0.1;
            break;
        case 3:
        case 5:
            height=0.55;
            break;
    }
    //height=0.6;
    margin=0.2;
    frequencyF=frequency/127.0;
    resonanceF=resonance/127.0;
    slopeX=margin*(slope+1)/3.0;
    
    availableWidth=1-2*margin-widthF;
    peakX=frequencyF*availableWidth+margin;
    rectHeight=rect.size.height;
    
    y0=rect.origin.y-lineWidth;
    y2=rect.origin.y+height*rectHeight;
    y3=y2+resonanceF*(1-height)*0.5*rectHeight;
    y4=y2+resonanceF*(1-height)*rectHeight;
    y1=y4*0.5;
    y5=y2-resonanceF*height*0.5*rectHeight;
    y6=y2-resonanceF*height*rectHeight;
    y7=y4-widthF*rectHeight*2;
    
    x0=rect.origin.x-rect.size.width;
    x1=rect.origin.x+(peakX-slopeX)*rect.size.width;
    x5=rect.origin.x+(peakX-0.1*slopeX)*rect.size.width;
    x3=x1+(x5-x1)*height;
    x2=x1+(x5-x1)*0.5;
    x4=x3+(x5-x3)*0.5;
    x6=rect.origin.x+peakX*rect.size.width;
    xa=x6+widthF*rect.size.width;
    xb=rect.origin.x+(peakX+0.1*slopeX)*rect.size.width+widthF*rect.size.width;
    xf=rect.origin.x+(peakX+slopeX)*rect.size.width+widthF*rect.size.width;
    xd=xf-(xf-xb)*height;
    xc=xd-(xd-xb)*0.5;
    xe=xf-(xf-xb)*0.5;
    xg=rect.origin.x+2*rect.size.width+widthF*rect.size.width;
    x8=x6+(xa-x6)*0.5;
    x9=xa-(xa-x8)*0.5;
    x7=x6+(x8-x6)*0.5;
    
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth];

    switch(type)
    {
        case 0:
        case 3:
            [path moveToPoint:NSMakePoint(x0,y2)];
            [path lineToPoint:NSMakePoint(x1,y2)];
            [path curveToPoint:NSMakePoint(x4,y3) controlPoint1:NSMakePoint(x3,y2) controlPoint2:NSMakePoint(x3,y2)];
            [path curveToPoint:NSMakePoint(xe,y1) controlPoint1:NSMakePoint(x5,y4) controlPoint2:NSMakePoint(xb,y4)];
            [path lineToPoint:NSMakePoint(xf,y0)];
            break;
        case 1:
        case 4:
            [path moveToPoint:NSMakePoint(x1,y0)];
            [path curveToPoint:NSMakePoint(x6,y4) controlPoint1:NSMakePoint(x4,y4) controlPoint2:NSMakePoint(x5,y4)];
            [path curveToPoint:NSMakePoint(x8,y7) controlPoint1:NSMakePoint(x7,y4) controlPoint2:NSMakePoint(x7,y7)];
            [path curveToPoint:NSMakePoint(xa,y4) controlPoint1:NSMakePoint(x9,y7) controlPoint2:NSMakePoint(x9,y4)];
            //[path lineToPoint:NSMakePoint(xa,y4)];
            [path curveToPoint:NSMakePoint(xf,y0) controlPoint1:NSMakePoint(xb,y4) controlPoint2:NSMakePoint(xc,y4)];
            break;
        case 2:
        case 5:
            [path moveToPoint:NSMakePoint(x1,y0)];
            [path lineToPoint:NSMakePoint(x2,y1)];
            [path curveToPoint:NSMakePoint(xc,y3) controlPoint1:NSMakePoint(x5,y4) controlPoint2:NSMakePoint(xb,y4)];
            [path curveToPoint:NSMakePoint(xf,y2) controlPoint1:NSMakePoint(xd,y2) controlPoint2:NSMakePoint(xd,y2)];
            [path lineToPoint:NSMakePoint(xg,y2)];
            break;
        case 6:
            [path moveToPoint:NSMakePoint(x0,y2)];
            [path lineToPoint:NSMakePoint(x1,y2)];
            [path curveToPoint:NSMakePoint(x4,y5) controlPoint1:NSMakePoint(x3,y2) controlPoint2:NSMakePoint(x3,y2)];
            [path curveToPoint:NSMakePoint(x6,y6) controlPoint1:NSMakePoint(x5,y6) controlPoint2:NSMakePoint(x5,y6)];
            [path curveToPoint:NSMakePoint(xc,y5) controlPoint1:NSMakePoint(xb,y6) controlPoint2:NSMakePoint(xb,y6)];
            [path curveToPoint:NSMakePoint(xf,y2) controlPoint1:NSMakePoint(xd,y2) controlPoint2:NSMakePoint(xd,y2)];
            [path lineToPoint:NSMakePoint(xg,y2)];
            break;
    }    
    [path stroke];    
}*/

-(void)drawFilterInRect:(NSRect)rect type:(int)type slope:(int)slope frequency:(float)frequencyF resonance:(float)resonanceF width:(float)width
{
    float widthF,peakX,rectHeight,height,availableWidth,margin,slopeX,y0,y1,y2,y3,y4,y5,y6,y7,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,xa,xb,xc,xd,xe,xf,xg;
    //float maxWidthF=0.15;
    //type is a value between 3 and 12 so:
    //int type=typeIn-3;
    //float widthF=(width/127.0)*maxWidthF;
    //float widthF=(width-102)*0.2*maxWidthF;
    widthF=width;
    NSBezierPath *path;
    switch(type)
    {
        case 0:
        case 2:
        case 6:
            widthF=0;
            height=0.7;
            break;
        case 1: 
            widthF=0;
            height=0.1;
            break;
        case 4:
            height=0.1;
            break;
        case 3:
        case 5:
            height=0.55;
            break;
    }
    //height=0.6;
    margin=0.2;
    //frequencyF=frequency/127.0;
    //resonanceF=resonance/127.0;
    slopeX=margin*(slope+1)/3.0;
    
    availableWidth=1-2*margin-widthF;
    peakX=frequencyF*availableWidth+margin;
    rectHeight=rect.size.height;
    
    y0=rect.origin.y-lineWidth;
    y2=rect.origin.y+height*rectHeight;
    y3=y2+resonanceF*(1-height)*0.5*rectHeight;
    y4=y2+resonanceF*(1-height)*rectHeight;
    y1=y4*0.5;
    y5=y2-resonanceF*height*0.5*rectHeight;
    y6=y2-resonanceF*height*rectHeight;
    y7=y4-widthF*rectHeight*2;
    
    x0=rect.origin.x-rect.size.width;
    x1=rect.origin.x+(peakX-slopeX)*rect.size.width;
    x5=rect.origin.x+(peakX-0.1*slopeX)*rect.size.width;
    x3=x1+(x5-x1)*height;
    x2=x1+(x5-x1)*0.5;
    x4=x3+(x5-x3)*0.5;
    x6=rect.origin.x+peakX*rect.size.width;
    xa=x6+widthF*rect.size.width;
    xb=rect.origin.x+(peakX+0.1*slopeX)*rect.size.width+widthF*rect.size.width;
    xf=rect.origin.x+(peakX+slopeX)*rect.size.width+widthF*rect.size.width;
    xd=xf-(xf-xb)*height;
    xc=xd-(xd-xb)*0.5;
    xe=xf-(xf-xb)*0.5;
    xg=rect.origin.x+2*rect.size.width+widthF*rect.size.width;
    x8=x6+(xa-x6)*0.5;
    x9=xa-(xa-x8)*0.5;
    x7=x6+(x8-x6)*0.5;
    
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth];
    
    switch(type)
    {
        case 0:
        case 3:
            [path moveToPoint:NSMakePoint(x0,y2)];
            [path lineToPoint:NSMakePoint(x1,y2)];
            [path curveToPoint:NSMakePoint(x4,y3) controlPoint1:NSMakePoint(x3,y2) controlPoint2:NSMakePoint(x3,y2)];
            [path curveToPoint:NSMakePoint(xe,y1) controlPoint1:NSMakePoint(x5,y4) controlPoint2:NSMakePoint(xb,y4)];
            [path lineToPoint:NSMakePoint(xf,y0)];
            break;
        case 1:
        case 4:
            [path moveToPoint:NSMakePoint(x1,y0)];
            [path curveToPoint:NSMakePoint(x6,y4) controlPoint1:NSMakePoint(x4,y4) controlPoint2:NSMakePoint(x5,y4)];
            [path curveToPoint:NSMakePoint(x8,y7) controlPoint1:NSMakePoint(x7,y4) controlPoint2:NSMakePoint(x7,y7)];
            [path curveToPoint:NSMakePoint(xa,y4) controlPoint1:NSMakePoint(x9,y7) controlPoint2:NSMakePoint(x9,y4)];
            //[path lineToPoint:NSMakePoint(xa,y4)];
            [path curveToPoint:NSMakePoint(xf,y0) controlPoint1:NSMakePoint(xb,y4) controlPoint2:NSMakePoint(xc,y4)];
            break;
        case 2:
        case 5:
            [path moveToPoint:NSMakePoint(x1,y0)];
            [path lineToPoint:NSMakePoint(x2,y1)];
            [path curveToPoint:NSMakePoint(xc,y3) controlPoint1:NSMakePoint(x5,y4) controlPoint2:NSMakePoint(xb,y4)];
            [path curveToPoint:NSMakePoint(xf,y2) controlPoint1:NSMakePoint(xd,y2) controlPoint2:NSMakePoint(xd,y2)];
            [path lineToPoint:NSMakePoint(xg,y2)];
            break;
        case 6:
            [path moveToPoint:NSMakePoint(x0,y2)];
            [path lineToPoint:NSMakePoint(x1,y2)];
            [path curveToPoint:NSMakePoint(x4,y5) controlPoint1:NSMakePoint(x3,y2) controlPoint2:NSMakePoint(x3,y2)];
            [path curveToPoint:NSMakePoint(x6,y6) controlPoint1:NSMakePoint(x5,y6) controlPoint2:NSMakePoint(x5,y6)];
            [path curveToPoint:NSMakePoint(xc,y5) controlPoint1:NSMakePoint(xb,y6) controlPoint2:NSMakePoint(xb,y6)];
            [path curveToPoint:NSMakePoint(xf,y2) controlPoint1:NSMakePoint(xd,y2) controlPoint2:NSMakePoint(xd,y2)];
            [path lineToPoint:NSMakePoint(xg,y2)];
            break;
    }    
    [path stroke];    
}


-(void)drawWave:(int)wave soften:(int)soften pulseWidth:(int)pulseWidth
{
    int waves=2;
    int i;
    NSRect rect;
    
    [buttonImage lockFocus];
    [[NSColor novaGraphColour] set];
    [[NSBezierPath bezierPathWithRect:[self bounds]] fill];
    [[NSColor novaLineColour] set];
    
    
    switch(wave)
    {
        case 0://Square Wave
            for(i=0;i<waves;i++)
            {
               rect=NSMakeRect([self bounds].origin.x+lineWidth/2+i*([self bounds].size.width-lineWidth)/waves,
                                [self bounds].origin.y+lineWidth/2,
                                ([self bounds].size.width-lineWidth)/waves,
                                [self bounds].size.height-lineWidth);
                [self drawSquareWaveInRect:rect soften:soften pulseWidth:pulseWidth];
            }
            
            break;
        case 1: //Saw wave
            for(i=0;i<waves;i++)
            {
                rect=NSMakeRect([self bounds].origin.x+lineWidth/2+i*([self bounds].size.width-lineWidth)/waves,
                                [self bounds].origin.y+lineWidth/2,
                                ([self bounds].size.width-lineWidth)/waves,
                                [self bounds].size.height-lineWidth);
                [self drawSawWaveInRect:rect soften:soften];
            }
            break;
        case 2:
        case 3:
            [self drawInput:wave];
            break;
        case 4:
            for(i=-1;i<waves;i++)
            {
                rect=NSMakeRect([self bounds].origin.x+lineWidth/2+i*([self bounds].size.width-lineWidth)/waves,
                                [self bounds].origin.y+lineWidth/2,
                                ([self bounds].size.width-lineWidth)/waves,
                                [self bounds].size.height-lineWidth);
                [self drawSawWaveInRect:rect soften:soften];
                rect=NSMakeRect([self bounds].origin.x+lineWidth/2+i*([self bounds].size.width-lineWidth)/waves+pulseWidth/4,
                                [self bounds].origin.y+lineWidth/2,
                                ([self bounds].size.width-lineWidth)/waves,
                                [self bounds].size.height-lineWidth);
                [self drawSawWaveInRect:rect soften:soften];
                
            }
            
            break;
    }    
    [buttonImage unlockFocus];
    [self setImage:buttonImage];
    [self setNeedsDisplay:YES];
}

-(void)drawInput:(int)input
{
    NSAttributedString* input1;
    NSString* input2;
    NSPoint before;
    NSBezierPath* path;
    
    input1=[[NSAttributedString alloc] initWithString:@"Input 1"];
    input2=@"Input 2";
    
    before=NSMakePoint([self bounds].origin.x,[self bounds].origin.y+[self bounds].size.height/2);
    
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:1];
    [path moveToPoint:before];
    [path appendBezierPathWithGlyph:44 inFont:[NSFont systemFontOfSize:24]];
    [path appendBezierPathWithGlyph:81 inFont:[NSFont systemFontOfSize:24]];
    [path appendBezierPathWithGlyph:83 inFont:[NSFont systemFontOfSize:24]];
    [path appendBezierPathWithGlyph:88 inFont:[NSFont systemFontOfSize:24]];
    [path appendBezierPathWithGlyph:87 inFont:[NSFont systemFontOfSize:24]];
    [path relativeMoveToPoint:NSMakePoint(10,0)];
    [path appendBezierPathWithGlyph:18+input inFont:[NSFont systemFontOfSize:24]];
    [path stroke];
    [path fill];
    
}
-(void)drawSquareWaveInRect:(NSRect)rect soften:(int)soften pulseWidth:(int)pulseWidth
{
    float centreUpperWave, centreLowerWave;
    float softenF,pulseWidthF;
    NSPoint firstControl,secondControl,thirdControl,fourthControl,a,b,c,d;
    NSPoint before,after,beforeControl,afterControl;
    NSBezierPath *path;
    softenF=soften/127.0;
    pulseWidthF=pulseWidth/127.0;
    
    centreUpperWave=(1+pulseWidthF)/2;
    centreLowerWave=(1-pulseWidthF)/2;

    firstControl=NSMakePoint(rect.origin.x,rect.size.height+rect.origin.y);
    fourthControl=NSMakePoint(rect.size.width+rect.origin.x,rect.origin.y);
    beforeControl=NSMakePoint(rect.origin.x,rect.origin.y);
    afterControl=NSMakePoint(rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    a=NSMakePoint(((centreUpperWave*softenF)/2)*rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    b=NSMakePoint(((1+pulseWidthF-centreUpperWave*softenF)/2)*rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    c=NSMakePoint(((1+pulseWidthF+centreLowerWave*softenF)/2)*rect.size.width+rect.origin.x,rect.origin.y);
    d=NSMakePoint(((2-centreLowerWave*softenF)/2)*rect.size.width+rect.origin.x,rect.origin.y);
    before=NSMakePoint(((-centreLowerWave*softenF)/2)*rect.size.width+rect.origin.x,rect.origin.y);
    after=NSMakePoint(((2+centreUpperWave*softenF)/2)*rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    secondControl=NSMakePoint(((1+pulseWidthF)/2)*rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    thirdControl=NSMakePoint(((1+pulseWidthF)/2)*rect.size.width+rect.origin.x,rect.origin.y);    
    
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth];
    [path moveToPoint:before];
    [path curveToPoint:a controlPoint1:beforeControl controlPoint2:firstControl];
    [path lineToPoint:b];
    [path curveToPoint:c controlPoint1:secondControl controlPoint2:thirdControl];
    [path lineToPoint:d];
    [path curveToPoint:after controlPoint1:fourthControl controlPoint2:afterControl];
    [path stroke];
}

-(void)drawSawWaveInRect:(NSRect)rect soften:(int)soften
{
    float softenF;
    NSPoint firstControl,secondControl,thirdControl,fourthControl,a,c;
    NSPoint before,after,beforeControl,afterControl;
    NSBezierPath *path;
    softenF=soften/127.0;

    firstControl=NSMakePoint(rect.origin.x,rect.size.height+rect.origin.y);
    fourthControl=NSMakePoint(rect.size.width+rect.origin.x,rect.origin.y);
    beforeControl=NSMakePoint(rect.origin.x,rect.origin.y);
    afterControl=NSMakePoint(rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    a=NSMakePoint((softenF*0.25)*rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    c=NSMakePoint((1-softenF*0.25)*rect.size.width+rect.origin.x,rect.origin.y);
    secondControl=NSMakePoint(rect.size.width*0.5+rect.origin.x,((softenF+1)*0.5)*rect.size.height+rect.origin.y);
    thirdControl=NSMakePoint(rect.size.width*0.5+rect.origin.x,((-softenF+1)*0.5)*rect.size.height+rect.origin.y);
    before=NSMakePoint((-softenF*0.25)*rect.size.width+rect.origin.x,rect.origin.y);
    after=NSMakePoint((1+softenF*0.25)*rect.size.width+rect.origin.x,rect.size.height+rect.origin.y);
    
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth];
    [path moveToPoint:before];
    [path curveToPoint:a controlPoint1:beforeControl controlPoint2:firstControl];
    [path curveToPoint:c controlPoint1:secondControl controlPoint2:thirdControl];
    [path curveToPoint:after controlPoint1:fourthControl controlPoint2:afterControl];
    [path stroke];
    
}

-(void)drawTriangleWaveInRect:(NSRect)rect
{
    NSPoint start,end,top,bottom;
    NSBezierPath *path;
    start=NSMakePoint(rect.origin.x,rect.origin.y+rect.size.height/2);
    end=NSMakePoint(rect.origin.x+rect.size.width,rect.origin.y+rect.size.height/2);
    top=NSMakePoint(rect.origin.x+rect.size.width*.25,rect.origin.y+rect.size.height);
    bottom=NSMakePoint(rect.origin.x+rect.size.width*.75,rect.origin.y);
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth];
    [path moveToPoint:start];
    [path lineToPoint:top];
    [path lineToPoint:bottom];
    [path lineToPoint:end];
    [path stroke];
}

-(void)drawSampleandHoldInRect:(NSRect)rect
{
    NSPoint start,end,point;
    NSBezierPath *path;
    int steps,i;
    float y;
    
    steps=5;
    start=NSMakePoint(rect.origin.x,rect.origin.y+rect.size.height/2);
    //start=rect.origin;
    end=NSMakePoint(rect.origin.x+rect.size.width,rect.origin.y+rect.size.height/2);
    
    path=[NSBezierPath bezierPath];
    [path init];
    [path setLineWidth:lineWidth];
    [path moveToPoint:start];
    for(i=0;i<steps;i++)
    {
        y=rect.size.height*(double)rand()/(double)RAND_MAX;
        //The first point should be above half way
        if(i==0)
            y=y/2+rect.size.height/2;
        //The last point should be below half way
        if(i==(steps-1))
            y=y/2;
        point=NSMakePoint(rect.origin.x+rect.size.width*i/steps,
                                  rect.origin.y+y); 
        [path lineToPoint:point];
        point=NSMakePoint(rect.origin.x+rect.size.width*(i+1)/steps,
                          rect.origin.y+y); 
        [path lineToPoint:point];
    }
    [path lineToPoint:end];
    [path stroke];
}

-(void)drawSawWaveInRect:(NSRect)rect
{
    [self drawSawWaveInRect:rect soften:0];
}

-(void)drawSquareWaveInRect:(NSRect)rect
{
    [self drawSquareWaveInRect:rect soften:0 pulseWidth:0];
}
@end
