//
//  IWNovaColour.m
//  Nova
//
//  Created by Iain Wood on Mon Mar 08 2004.
//  Copyright (c) 2004 ArmageddonZoo. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@implementation NSColor (IWNovaColour)
+(NSColor *)novaBodyColour
{
    NSColor *colour;
    colour=[NSColor colorWithDeviceRed:25.0/255 green:30.0/255 blue:60.0/255 alpha:1.0];
    [colour retain];
    return colour;
}

+(NSColor *)novaLedColour
{
    NSColor *colour;
    colour=[NSColor colorWithDeviceRed:0.0/255 green:0.0/255 blue:255.0/255 alpha:1.0];
    [colour retain];
    return colour;
}

+(NSColor *)novaGraphColour
{
    return [NSColor novaBodyColour];
}

+(NSColor *)novaLineColour
{
    return [NSColor novaLedColour];
}

@end
