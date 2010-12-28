//
//  NSTableViewSampleAppDelegate.m
//  NSTableViewSample
//
//  Created by Hiroshi Hashiguchi on 10/12/03.
//  Copyright 2010 . All rights reserved.
//

#import "NSTableViewSampleAppDelegate.h"

@implementation NSTableViewSampleAppDelegate

@synthesize window;

+ (void)initialize
{
	NSValueTransformer* transformer = [NSValueTransformer valueTransformerForName:NSUnarchiveFromDataTransformerName];
	NSSortDescriptor* sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"email" ascending:NO] autorelease];
	NSData* data =[transformer reverseTransformedValue:[NSArray arrayWithObject:sortDescriptor]];
	
	NSDictionary* initialValues = [NSDictionary dictionaryWithObject:data forKey:@"sortDescriptor"];
	[[NSUserDefaultsController sharedUserDefaultsController] setInitialValues:initialValues];
	NSLog(@"%@", [[[NSUserDefaultsController sharedUserDefaultsController] defaults] dictionaryRepresentation]);
	
	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
	NSLog(@"launching..");
}

@end
