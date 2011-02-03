//
//  EventMonitorSampleAppDelegate.m
//  EventMonitorSample
//
//  Created by Hiroshi Hashiguchi on 11/02/04.
//  Copyright 2011 . All rights reserved.
//

#import "EventMonitorSampleAppDelegate.h"

@implementation EventMonitorSampleAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
	[NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
										   handler:^(NSEvent* event) {
											   NSLog(@"GlobalMonitor: %@", event);
										   }];
	
	[NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask
										  handler:^(NSEvent* event) {
											  NSLog(@"LocalMonitor: %@", event);
											  return event;
										  }];
}

@end
