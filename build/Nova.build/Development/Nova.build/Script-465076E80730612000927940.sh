#!/bin/sh
echo "//  IWCableView.h
// Don't edit this file directly, go to the 3rd shell script build phase
// and edit that instead

#import <Cocoa/Cocoa.h>
#import \"IWProg.h\"

@interface IWCableView : NSView
{
   int y0, y1, y2;
   int lfo1X, lfo2X, env2X, env3X, wheelX, noiseX, osc1X, osc2X, osc3X, env1X, filterX, ring13X, ring23X, afterTouchX;
   float maxLineWidth;
   int offset;
   IWProg *program;"> IWCableView.h

awk '{printf "\n   NSPoint %sStart;\n   NSPoint %sEnd;\n   NSColor * %sColour;\n",$1,$1,$1}' parameters/CCConnections   >>IWCableView.h
awk '{printf "\n   NSPoint %sStart;\n   NSPoint %sEnd;\n   NSColor * %sColour;\n",$1,$1,$1}' parameters/NRPNConnections >>IWCableView.h
#sed -f sedCommands/buildIWCableViewVariables parameters/NRPNConnections >> IWCableView.h
#sed -f sedCommands/buildIWCableViewVariables parameters/CCConnections   >> IWCableView.h

echo "  
}">> IWCableView.h

echo "
-(void)drawLine:(int)width colour:(NSColor *)colour start:(NSPoint)start end:(NSPoint)end;
-(void)setProg:(IWProg *)progr;

">>IWCableView.h

awk '{printf "-(void)draw%s:(int)width colour:(NSColor *)colour;\n-(void)draw%s:(int)width;\n"\
     ,toupper(substr($1,1,1)) substr($1,2),toupper(substr($1,1,1)) substr($1,2)}' parameters/CCConnections   >>IWCableView.h
awk '{printf "-(void)draw%s:(int)width colour:(NSColor *)colour;\n-(void)draw%s:(int)width;\n"\
     ,toupper(substr($1,1,1)) substr($1,2),toupper(substr($1,1,1)) substr($1,2)}' parameters/NRPNConnections   >>IWCableView.h

#awk '{printf "-(void)draw%s:(int)width colour:(NSColor *)colour\n\{\n    [self drawLine:width colour:colour start:%sStart end:%sEnd];\n\}\n-(void)draw%s:(int)width\n\{\n    [self drawLine:width colour:[self %sColour] start:%sStart end:%sEnd];\n\}\n",toupper(substr($1,1,1)) substr($1,2),$1,$1,toupper(substr($1,1,1)) substr($1,2),$1,$1,$1}' parameters/CCConnections   >>IWCableView.h

#sed -f sedCommands/buildIWCableViewProcsH parameters/NRPNConnections         >> IWCableView.h
#sed -f sedCommands/buildIWCableViewProcsH parameters/CCConnections           >> IWCableView.h

awk '{printf "-(NSColor *)%sColour;\n",$1}' parameters/CCConnections     >>IWCableView.h
awk '{printf "-(NSColor *)%sColour;\n",$1}' parameters/NRPNConnections   >>IWCableView.h

#sed -f sedCommands/buildIWCableViewAccessMethodsH parameters/NRPNConnections >> IWCableView.h
#sed -f sedCommands/buildIWCableViewAccessMethodsH parameters/CCConnections   >> IWCableView.h

awk '{printf "-(void)set%sColour:(NSColor *)value;\n",toupper(substr($1,1,1)) substr($1,2)}' parameters/CCConnections   >> IWCableView.h
awk '{printf "-(void)set%sColour:(NSColor *)value;\n",toupper(substr($1,1,1)) substr($1,2)}' parameters/NRPNConnections >> IWCableView.h

#sed -f sedCommands/buildIWCableViewSetMethodsH parameters/NRPNConnections    >> IWCableView.h
#sed -f sedCommands/buildIWCableViewSetMethodsH parameters/CCConnections      >> IWCableView.h

echo "
@end">> IWCableView.h
