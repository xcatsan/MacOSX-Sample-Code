//
//  CustomHeaderSampleAppDelegate.m
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//

#import "CustomHeaderSampleAppDelegate.h"
#import "CustomHeaderCell.h"

@implementation CustomHeaderSampleAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}


- (id)init {
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, nil);
	self = [super init];

	if (self) {
		list = [[NSMutableArray alloc] init];
		
		int i;
		for (i=1; i <= 10; i++) {
			[list addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							 [NSString stringWithFormat:@"TITLE-%d", i], @"title",
							 [NSString stringWithFormat:@"AUTHOR-%d", i], @"author",
							 nil]];
		}		
	}
	return self;
}

- (IBAction)button:(id)sender
{
	for (NSTableColumn* column in [tableView_ tableColumns]) {
		
		NSLog(@"%s|%@", __PRETTY_FUNCTION__, [column sortDescriptorPrototype]);
	}
}

#pragma mark -
#pragma mark NSTableViewDelegate
- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn
{
	CustomHeaderCell* cell = nil;
	BOOL ascending;
	NSInteger priority;
	
	for (NSTableColumn* column in [tableView tableColumns]) {
		
		cell  = (CustomHeaderCell*)[column headerCell];
		
		if (column == tableColumn) {
			ascending = [[[arrayController_ sortDescriptors] objectAtIndex:0] ascending];
			priority = 0;
		} else {
			priority = 1;
		}
		
		[cell setSortAscending:ascending priority:priority];
	}
}


@end
