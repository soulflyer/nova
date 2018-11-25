#!/bin/sh
echo "************Building Prog Methods***********************************************"

awk '{\
print "-(void)set" toupper(substr($1,1,1)) substr($1,2) ":(Byte)value";\
print "{";\
print "    "$1"=value;";\
print "}";\
}' parameters/NRPN parameters/NRPNButtons parameters/NRPNConnections parameters/NRPNParts parameters/CC parameters/CCConnections > GeneratedFiles/ProgSetMethods

awk '{\
print "-(Byte)" $1;\
print "{";\
print "    return " $1 ";";\
print "}";\
}' parameters/NRPN parameters/NRPNButtons parameters/NRPNConnections parameters/NRPNParts parameters/CC parameters/CCConnections > GeneratedFiles/ProgAccessMethods

awk '{\
print "    [dict setObject:@\"" $8 "\"   forKey:@\"" $1 "\"];"\
}' parameters/NRPN parameters/NRPNButtons parameters/NRPNConnections parameters/NRPNParts parameters/CC parameters/CCConnections > GeneratedFiles/ProgInitialize

awk '{\
print "    " $1 "=[defaults integerForKey:@\"" $1 "\"];"\
}' parameters/NRPN parameters/NRPNButtons parameters/NRPNConnections parameters/NRPNParts parameters/CC parameters/CCConnections > GeneratedFiles/ProgInit

awk '{\
if ($2!=0)\
{;\
 print "    " $1 "=sysexBuffer[ " $2 " ]-" $6 ";";\
 print "    NSLog(@\"" $1 "-%d\",sysexBuffer[ "$2 " ]);";\
};\
}' parameters/NRPN parameters/NRPNButtons parameters/NRPNConnections parameters/NRPNParts parameters/CC parameters/CCConnections | sort -n +1  > GeneratedFiles/ProgInitWithSysex

awk '{\
print "    [dict setObject:[NSNumber numberWithInt:" $1 "] forKey:@\"" $1 "\"];"\
}' parameters/NRPN parameters/NRPNButtons parameters/NRPNConnections parameters/NRPNParts parameters/CC parameters/CCConnections > GeneratedFiles/ProgAsDictionary

awk '{\
print "    if(value=[dict valueForKey:@\"" $1 "\"])";\
print "        [self set" toupper(substr($1,1,1)) substr($1,2) ":[value intValue]];";\
print "    else";\
print "        NSLog(@\"No Value for " $1 "\");";\
}' parameters/NRPN parameters/NRPNButtons parameters/NRPNConnections parameters/NRPNParts parameters/CC parameters/CCConnections > GeneratedFiles/ProgFromDictionary

