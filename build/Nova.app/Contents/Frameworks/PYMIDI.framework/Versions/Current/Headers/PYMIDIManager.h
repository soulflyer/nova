/*
    This software is distributed under the terms of Pete's Public License version 1.0, a
    copy of which is included with this software in the file "License.html".  A copy can
    also be obtained from http://pete.yandell.com/software/license/ppl-1_0.html
    
    If you did not receive a copy of the license with this software, please notify the
    author by sending e-mail to pete@yandell.com
    
    The current version of this software can be found at http://pete.yandell.com/software
     
    Copyright (c) 2002-2003 Peter Yandell.  All Rights Reserved.
    
    $Id: PYMIDIManager.h,v 1.1.1.1 2004/11/24 14:43:24 ndiw Exp $
*/


#import <AppKit/AppKit.h>
#import <CoreMIDI/CoreMIDI.h>


@class PYMIDIEndpointDescriptor;
@class PYMIDIEndpoint;


@interface PYMIDIManager : NSObject {
    BOOL			notificationsEnabled;
    MIDIClientRef	midiClientRef;

    NSArray*		realSourceArray;
    NSArray*		onlineRealSourceArray;
    
    NSArray*		realDestinationArray;
    NSArray*		onlineRealDestinationArray;

    NSArray*		noteNamesArray;
}

+ (PYMIDIManager*)sharedInstance;

- (PYMIDIManager*)init;
- (void)dealloc;

- (void)disableNotifications;
- (void)enableNotifications;
- (void)processMIDINotification:(const MIDINotification*)message;
- (MIDIClientRef)midiClientRef;

- (void)updateRealSources;
- (NSArray*)onlineRealSources;
- (PYMIDIEndpoint*)realSourceWithDescriptor:(PYMIDIEndpointDescriptor*)descriptor;

- (void)updateRealDestinations;
- (NSArray*)onlineRealDestinations;
- (PYMIDIEndpoint*)realDestinationWithDescriptor:(PYMIDIEndpointDescriptor*)descriptor;

- (void)buildNoteNamesArray;
- (NSString*)nameOfNote:(Byte)note;

@end