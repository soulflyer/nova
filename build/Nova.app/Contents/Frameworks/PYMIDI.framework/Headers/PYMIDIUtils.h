/*
    This software is distributed under the terms of Pete's Public License version 1.0, a
    copy of which is included with this software in the file "License.html".  A copy can
    also be obtained from http://pete.yandell.com/software/license/ppl-1_0.html
    
    If you did not receive a copy of the license with this software, please notify the
    author by sending e-mail to pete@yandell.com
    
    The current version of this software can be found at http://pete.yandell.com/software
     
    Copyright (c) 2002-2003 Peter Yandell.  All Rights Reserved.
    
    $Id: PYMIDIUtils.h,v 1.1.1.1 2004/11/24 14:43:24 ndiw Exp $
*/


#include <CoreMIDI/CoreMIDI.h>


MIDIEndpointRef PYMIDIGetSourceByEndpointRef (MIDIEndpointRef endpoint);
MIDIEndpointRef PYMIDIGetSourceByUniqueID (SInt32 uniqueID);
MIDIEndpointRef PYMIDIGetSourceByName (CFStringRef name);

MIDIEndpointRef PYMIDIGetDestinationByEndpointRef (MIDIEndpointRef endpoint);
MIDIEndpointRef PYMIDIGetDestinationByUniqueID (SInt32 uniqueID);
MIDIEndpointRef PYMIDIGetDestinationByName (CFStringRef name);

Boolean PYMIDIIsUniqueIDInUse (SInt32 uniqueID);
SInt32 PYMIDIAllocateUniqueID (void);
Boolean PYMIDIIsEndpointNameIsTaken (CFStringRef name);