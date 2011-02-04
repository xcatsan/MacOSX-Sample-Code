//
//  EventMonitorSampleAppDelegate.m
//  EventMonitorSample
//
//  Created by Hiroshi Hashiguchi on 11/02/04.
//  Copyright 2011 . All rights reserved.
//

#import "EventMonitorSampleAppDelegate.h"

#import <AvailabilityMacros.h>
#import <CoreFoundation/CoreFoundation.h>
#import <ApplicationServices/ApplicationServices.h>

@implementation EventMonitorSampleAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	NSString* executablePath = [[NSBundle mainBundle] executablePath];
	int error = AXMakeProcessTrusted((CFStringRef)executablePath);
	if(error != kAXErrorSuccess)
	{
		NSLog(@"*** Could not make process trusted! Path: %@ Error:%i ***",executablePath,error);
		
		//fallback: ask the user to enable access for assistive devices manually
		int result = NSRunAlertPanel(@"Enable Access for Assistive Devices." , @"To continue, please enable access for assistive devices in the Universal Access pane in System Preferences. Then, relaunch the application." , @"Open System Preferences", @"Quit", nil);
		
		if(result == NSAlertDefaultReturn)
		{
			[[NSWorkspace sharedWorkspace]openFile:@"/System/Library/PreferencePanes/UniversalAccessPref.prefPane"];
		}
	}
	
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
