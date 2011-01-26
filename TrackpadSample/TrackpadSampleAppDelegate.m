//
//  TrackpadSampleAppDelegate.m
//  TrackpadSample
//
//  Created by Hiroshi Hashiguchi on 11/01/26.
//  Copyright 2011 . All rights reserved.
//

#import "TrackpadSampleAppDelegate.h"

@implementation TrackpadSampleAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
	[imageView setFrameSize:[[imageView image] size]];
}

@end
