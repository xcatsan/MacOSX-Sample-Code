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

#define LINE_MARGIN_Y	2

- (void)_drawInRect:(NSRect)rect
{
	NSArray* colorArray = [NSArray arrayWithObjects:
						   [NSColor colorWithDeviceWhite:0.6 alpha:1.0],
						   [NSColor colorWithDeviceWhite:0.3 alpha:1.0],
						   [NSColor colorWithDeviceWhite:0.2 alpha:1.0],
						   nil];
	NSGradient* gradient = [[NSGradient alloc] initWithColors:colorArray];
	[gradient drawInRect:rect angle:90.0];
	
	NSGraphicsContext* gc = [NSGraphicsContext currentContext];
	[gc saveGraphicsState];
	[gc setShouldAntialias:NO];
	
	NSBezierPath* path = [NSBezierPath bezierPath];
	[path setLineWidth:1.0];
	NSPoint p = NSMakePoint(rect.origin.x, rect.origin.y+2.0);
	[path moveToPoint:p];
	
	p.y += rect.size.height-2.0;
	[path lineToPoint:p];
	p.x += rect.size.width;
	[path lineToPoint:p];
	
	p = NSMakePoint(rect.origin.x, rect.origin.y+1.0);
	[path moveToPoint:p];
	p.x += rect.size.width;
	[path lineToPoint:p];
	
	[[NSColor colorWithDeviceWhite:0.0 alpha:0.2] set];
	[path stroke];
	
	[gc restoreGraphicsState];
	
	
	// [2] draw string
	NSMutableAttributedString* attributedString =
	[[NSMutableAttributedString alloc] initWithAttributedString:[self attributedStringValue]];NSDictionary* attributes =
	[NSDictionary dictionaryWithObjectsAndKeys:
	 [NSColor whiteColor], NSForegroundColorAttributeName,
	 nil];
	[attributedString addAttributes:attributes
							  range:NSMakeRange(0, [attributedString length])];
	
	NSRect stringFrame = rect;
	stringFrame.origin.y += LINE_MARGIN_Y;
	[attributedString drawInRect:stringFrame];
}


#pragma mark -
#pragma mark Overridden methods (NSCell)
/*
 - (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	[self _drawInRect:cellFrame];
}
*/

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	[self _drawInRect:cellFrame];
	
}

@end
