//
//  CustomHeaderCell.m
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//

#import "CustomHeaderCell.h"


@implementation CustomHeaderCell

//NSFontAttributeName
// Default Helvetica 12-point

- (void)_drawInRect:(NSRect)rect
{
	[[NSColor orangeColor] set];
	NSRectFill(rect);
	
	NSMutableAttributedString* attributedString =
	[[NSMutableAttributedString alloc] initWithAttributedString:[self attributedStringValue]];

	NSDictionary* attributes =
	[NSDictionary dictionaryWithObjectsAndKeys:
	 [NSColor whiteColor], NSForegroundColorAttributeName,
	 [NSFont boldSystemFontOfSize:14.0], NSFontAttributeName,
	 nil];
	[attributedString addAttributes:attributes
							  range:NSMakeRange(0, [attributedString length])];
	
	rect.origin.y += 3;
	[attributedString drawInRect:rect];
	
}


#pragma mark -
#pragma mark Overridden methods (NSCell)
- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
//	[self _drawInRect:cellFrame];
}


- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	[self _drawInRect:cellFrame];
	
}

@end
