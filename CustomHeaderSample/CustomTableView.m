//
//  CustomTableView.m
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//

#import "CustomTableView.h"
#import "CustomHeaderCell.h"

@implementation CustomTableView

- (void)_setupHeaderCell
{
	for (NSTableColumn* column in [self tableColumns]) {
		NSTableHeaderCell* cell = [column headerCell];
		CustomHeaderCell* newCell = [[CustomHeaderCell alloc] initWithCell:cell];
		[column setHeaderCell:newCell];
		[newCell release];
	}
	
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, nil);
	
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		[self _setupHeaderCell];
	}
	return self;
}

@end
