//
//  GestureSampleAppDelegate.m
//  GestureSample
//
//  Created by Hiroshi Hashiguchi on 11/01/31.
//  Copyright 2011 . All rights reserved.
//

#import "GestureSampleAppDelegate.h"
#import "GestureView.h"

@implementation GestureSampleAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	GestureView* view = [[GestureView alloc] init];
	[self.window.contentView addSubview:view];
	[view release];
}

@end
