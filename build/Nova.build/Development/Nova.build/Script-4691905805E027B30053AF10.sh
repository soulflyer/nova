#!/bin/sh
echo "*********** Building files for inclusion in NovaController.m ******************"
echo "*********** Building IBActions ************************************************"

awk '{printf "-(IBAction)%sIn:(id)sender\
\{\
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;\
    MIDIPacket *packet;\
    //[%s flash];\
    packet=MIDIPacketListInit (packetList);\
    midiMessage[0]=175+channel;\
    midiMessage[1]=98;\
    midiMessage[2]=%s;\
    midiMessage[3]=175+channel;\
    midiMessage[4]=6;\
    midiMessage[5]=[sender intValue]+%s;\
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,0,6,midiMessage);\
    [program set%s:[sender intValue]];\
    [destination processMIDIPacketList:packetList sender:self];\
    [display2 insertText:\[NSString localizedStringWithFormat:@\"\\nNRPN %%d %%d %%d %%d %%d %%d\",midiMessage[0],midiMessage[1],midiMessage[2],midiMessage[3],midiMessage[4],midiMessage[5]]];\
    [display insertText:[NSString localizedStringWithFormat:@\"\\n\\n%s %%d\",[sender intValue]]];\
    [defaults setInteger:[sender intValue] forKey:@\"%s\"];\
    //NSLog(@\"****%%@****\",previousSlider);\
    //if(![previousSlider isEqual:@\"%s\"])\
         //[self setAllUnlit];\
    //[previousSlider setString:@\"%s\"];\
    [self initAll];\
    ",$1,$1,$5,$6,toupper(substr($1,1,1)) substr($1,2),$1,$1,$1,$1;\
    for(i=9;i<=NF;i++) printf("%s ",$i);\
    printf( "\
\}\n")}' parameters/NRPN parameters/NRPNParts >GeneratedFiles/IBActions

awk '{printf "-(IBAction)%sIn:(id)sender\
\{\
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;\
    MIDIPacket *packet;\
    //[%s flash];\
    packet=MIDIPacketListInit (packetList);\
    midiMessage[0]=175+channel;\
    midiMessage[1]=98;\
    midiMessage[2]=%s;\
    midiMessage[3]=175+channel;\
    midiMessage[4]=6;\
    midiMessage[5]=[sender intValue];\
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,0,6,midiMessage);\
    [program set%s:[sender intValue]];\
    [destination processMIDIPacketList:packetList sender:self];\
    [display2 insertText:\[NSString localizedStringWithFormat:@\"\\nNRPN %%d %%d %%d %%d %%d %%d\",midiMessage[0],midiMessage[1],midiMessage[2],midiMessage[3],midiMessage[4],midiMessage[5]]];\
    [display insertText:[NSString localizedStringWithFormat:@\"\\n\\n%s %%d\",midiMessage[5]]];\
    [cableView setNeedsDisplay:true];\
    [defaults setInteger:[sender intValue] forKey:@\"%s\"];\
    //NSLog(@\"****%%@****\",previousSlider);\
    //if(![previousSlider isEqual:@\"%s\"])\
         //[self setAllUnlit];\
    //[previousSlider setString:@\"%s\"];\
    [self initAll];\
    ",$1,$1,$5,toupper(substr($1,1,1)) substr($1,2),$1,$1,$1,$1;\
    for(i=9;i<=NF;i++) printf("%s ",$i);\
    printf( "\
\}\n")}' parameters/NRPNConnections >>GeneratedFiles/IBActions

awk '{printf "-(IBAction)%sIn:(id)sender\
\{\
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;\
    MIDIPacket *packet;\
    packet=MIDIPacketListInit (packetList);\
    midiMessage[0]=175+channel;\
    midiMessage[1]=98;\
    midiMessage[2]=%s;\
    midiMessage[3]=175+channel;\
    midiMessage[4]=6;\
    midiMessage[5]=[[sender selectedCell] tag]+%s;\
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,0,6,midiMessage);\
    [program set%s:[sender selectedTag]];\
    [destination processMIDIPacketList:packetList sender:self];\
    [display2 insertText:\[NSString localizedStringWithFormat:@\"\\nNRPN %%d %%d %%d %%d %%d %%d\",midiMessage[0],midiMessage[1],midiMessage[2],midiMessage[3],midiMessage[4],midiMessage[5]]];\
    [display insertText:[NSString localizedStringWithFormat:@\"\\n\\n%s %%d\",[[sender selectedCell] tag]]];\
    [defaults setInteger:[[sender selectedCell] tag] forKey:@\"%s\"];\
    [self initAll];\
    ",$1,$5,$6,toupper(substr($1,1,1)) substr($1,2),$1,$1;\
    for(i=9;i<=NF;i++) printf("%s ",$i);\
    printf( "\
\}\n")}' parameters/NRPNButtons >>GeneratedFiles/IBActions

awk '{printf "-(IBAction)%sIn:(id)sender\
\{\
    MIDITimeStamp now = 0;\
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;\
    MIDIPacket *packet;\
    //[%s flash];\
    packet=MIDIPacketListInit (packetList);\
    midiMessage[0]=175+channel;\
    midiMessage[2]=[sender intValue];\
    midiMessage[1]=%s;\
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,now,6,midiMessage);\
    [program set%s:[sender intValue]];\
    [destination processMIDIPacketList:packetList sender:self];\
    [display2 insertText:\[NSString localizedStringWithFormat:@\"\\nCC   %%d %%d %%d \",midiMessage[0],midiMessage[1],midiMessage[2]]];\
    [display insertText:[NSString localizedStringWithFormat:@\"\\n\\n%s %%d\",[sender intValue]]];\
    [defaults setInteger:[sender intValue] forKey:@\"%s\"];\
    //NSLog(@\"****%%@****\",previousSlider);\
    //if(![previousSlider isEqual:@\"%s\"])\
         //[self setAllUnlit];\
    //[previousSlider setString:@\"%s\"];\
    //[self setAllNeedsDisplay];\
    [self initAll];\
    ",$1,$1,$5,toupper(substr($1,1,1)) substr($1,2),$1,$1,$1,$1;\
    for(i=9;i<=NF;i++) printf("%s ",$i);\
    printf( "\
\}\n")}' parameters/CC >>GeneratedFiles/IBActions

awk '{printf "-(IBAction)%sIn:(id)sender\
\{\
    MIDITimeStamp now = 0;\
    MIDIPacketList *packetList=(MIDIPacketList *)messageBuffer;\
    MIDIPacket *packet;\
    //[%s flash];\
    packet=MIDIPacketListInit (packetList);\
    midiMessage[0]=175+channel;\
    midiMessage[2]=[sender intValue];\
    midiMessage[1]=%s;\
    MIDIPacketListAdd(packetList,sizeof(messageBuffer),packet,now,6,midiMessage);\
    [program set%s:[sender intValue]];\
    [destination processMIDIPacketList:packetList sender:self];\
    [display2 insertText:\[NSString localizedStringWithFormat:@\"\\nCC   %%d %%d %%d \",midiMessage[0],midiMessage[1],midiMessage[2]]];\
    [display insertText:[NSString localizedStringWithFormat:@\"\\n\\n%s %%d\",[sender intValue]]];\
    [cableView setNeedsDisplay:true];\
    [defaults setInteger:[sender intValue] forKey:@\"%s\"];\
    //NSLog(@\"****%%@****\",previousSlider);\
    //if(![previousSlider isEqual:@\"%s\"])\
         //[self setAllUnlit];\
    //[previousSlider setString:@\"%s\"];\
    [self initAll];\
    ",$1,$1,$5,toupper(substr($1,1,1)) substr($1,2),$1,$1,$1,$1;\
    for(i=9;i<=NF;i++) printf("%s ",$i);\
    printf( "\
\}\n")}' parameters/CCConnections >>GeneratedFiles/IBActions

echo "*********** Building Cases ****************************************************"

awk '{printf "        case %s:\
            //[%s setLit];\
            [%s setIntValue:value];\
            [progr set%s:value];\
            ",$5,$1,$1,toupper(substr($1,1,1)) substr($1,2);\
            for(i=9;i<=NF;i++) printf("%s ",$i);\
            printf( "\
            break;\
\n")}' parameters/NRPN parameters/NRPNConnections >GeneratedFiles/NrpnCases
            
awk '{printf "        case %s:\
            //[%s setLit];\
            [%s setIntValue:value];\
            [progr set%s:value];\
            ",$5,$1,$1,toupper(substr($1,1,1)) substr($1,2),$1;\
            for(i=9;i<=NF;i++) printf("%s ",$i);\
            printf( "\
            break;\
\n")}' parameters/CC parameters/CCConnections >GeneratedFiles/CcCases

awk '{
      if ($5!=this)
      {
          if (first==0)
          {
              print "            }"
              print "            break;"
          }
          print "        case " $5 ":\
            switch(value)\
            {";\
      }
      this=$5;
      first=0;
      for (i = $6; i <= $7; i++)
      {
            print "                case " i":";\
      }
      print "                   ["$1 " selectCellWithTag:(value-" $6 ")];";
      print "                   [progr set" toupper(substr($1,1,1)) substr($1,2) ":(value-" $6 ")];";
      print "                   break;";
} END {
      print "            }"
      print "            break;"
}' this=9999 first=1 parameters/NRPNButtons > GeneratedFiles/NrpnCases2

echo "*********** Building InitIBOutlets ********************************************"
awk '{printf "    [%s setIntValue:[program %s]];\
    //[%s setUnlit];\
",$1,$1,$1}'  parameters/CC parameters/NRPN parameters/CCConnections parameters/NRPNConnections                 >GeneratedFiles/InitIBOutlets
awk '{printf "    [%s setIntValue:([program %s]+%s)];\
    //[%s setUnlit];\
",$1,$1,$6,$1}'  parameters/NRPNParts                                                                          >>GeneratedFiles/InitIBOutlets
awk '{printf "    [%s selectCellWithTag:[program %s]];\n",$1,$1}'  parameters/NRPNButtons                         >>GeneratedFiles/InitIBOutlets

echo "*********** Building SetAllUnlit **********************************************"
awk '{printf "    [%s setUnlit];\
",$1}'  parameters/NRPNParts parameters/CC parameters/NRPN parameters/CCConnections parameters/NRPNConnections >>GeneratedFiles/SetAllUnlit

echo "*********** Creating files for IWCableView ************************************"

awk '{\
print "   " $1 "Start=NSMakePoint(0,y1);";\
print "   " $1 "End=NSMakePoint(0,y2);";\
print "   " $1 "Colour=[NSColor blueColor];";\
}' parameters/NRPNConnections parameters/CCConnections >GeneratedFiles/IWCableViewVariablesInit

awk '{\
print "-(void)draw" toupper(substr($1,1,1)) substr($1,2) ":(int)width colour:(NSColor *)colour";\
print "{";\
print "    [self drawLine:width colour:colour start:" $1 "Start end:" $1 "End];";\
print "}";\
print "-(void)draw" toupper(substr($1,1,1)) substr($1,2) ":(int)width";\
print "{";\
print "    [self drawLine:width colour:[self " $1 "Colour] start:" $1 "Start end:" $1 "End];";\
print "}";\
}' parameters/NRPNConnections parameters/CCConnections >GeneratedFiles/IWCableViewProcs

awk '{\
print "-(void)set" toupper(substr($1,1,1)) substr($1,2) "Colour:(NSColor *)value";\
print "{";\
print "    " $1 "Colour=value;";\
print "}";\
}' parameters/NRPNConnections parameters/CCConnections >GeneratedFiles/IWCableViewSetMethods

awk '{\
print "-(NSColor *)" $1 "Colour";\
print "{";\
print "    return " $1 "Colour;";\
print "}";\
}' parameters/NRPNConnections parameters/CCConnections >GeneratedFiles/IWCableViewAccessMethods

awk '{\
print "[self draw" toupper(substr($1,1,1)) substr($1,2) ":abs([program " $1 "]-64)];"\
}' parameters/NRPNConnections parameters/CCConnections >GeneratedFiles/IWCableViewDrawRect
