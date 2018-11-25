/*
    This software is distributed under the terms of Pete's Public License version 1.0, a
    copy of which is included with this software in the file "License.html".  A copy can
    also be obtained from http://pete.yandell.com/software/license/ppl-1_0.html
    
    If you did not receive a copy of the license with this software, please notify the
    author by sending e-mail to pete@yandell.com
    
    The current version of this software can be found at http://pete.yandell.com/software
     
    Copyright (c) 2002-2003 Peter Yandell.  All Rights Reserved.
    
    $Id: PYMIDIEndpoint.h,v 1.1.1.1 2004/11/24 14:43:24 ndiw Exp $
*/


#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>


@class PYMIDIEndpointDescriptor;


@interface PYMIDIEndpoint : NSObject <NSCoding> {
    MIDIEndpointRef		midiEndpointRef;
    NSString*			name;
    SInt32				uniqueID;
    
    NSMutableSet*		receivers;
    NSMutableSet*		senders;
}


- (id)init;
- (id)initWithName:(NSString*)newName uniqueID:(SInt32)newUniqueID;
- (id)initWithMIDIEndpointRef:(MIDIEndpointRef)newMIDIEndpointRef;
- (void)dealloc;

- (id)initWithCoder:(NSCoder*)coder;
- (void)encodeWithCoder:(NSCoder*)coder;

/* Resets the name and uniqueID from the MIDIEndpointRef */
- (void)setPropertiesFromMIDIEndpoint;


- (MIDIEndpointRef)midiEndpointRef;
- (BOOL)isOffline;

- (NSString*)displayName;
- (NSString*)name;
- (BOOL)setName:(NSString*)newName;
- (NSComparisonResult)compareByDisplayName:(PYMIDIEndpoint*)endpoint;

- (SInt32)uniqueID;
- (BOOL)setUniqueID:(SInt32)newUniqueID;

- (PYMIDIEndpointDescriptor*)descriptor;


- (void)addReceiver:(id)receiver;
- (void)removeReceiver:(id)receiver;
- (void)addSender:(id)sender;
- (void)removeSender:(id)sender;
- (BOOL)isInUse;

/* Override these to do the hard work */
- (BOOL)ioIsRunning;
- (void)startIO;
- (void)stopIO;
- (void)processMIDIPacketList:(const MIDIPacketList*)packetList sender:(id)sender;

@end
