//
//  CustomTableView.m
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//
#import "CustomTableView.h"
#import "CustomHeaderCell.h"
#import "CustomCornerView.h"

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
- (void)_setupCornerView
{
	NSView* cornerView = [self cornerView];
	CustomCornerView* newCornerView =
		[[CustomCornerView alloc] initWithFrame:cornerView.frame];
	[self setCornerView:newCornerView];
	[newCornerView release];
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		[self _setupHeaderCell];
		[self _setupCornerView];
	}
	return self;
}

@end
