//
//  CustomHeaderCell.m
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//

#import "CustomHeaderCell.h"


@implementation CustomHeaderCell

#define TRIANGLE_WIDTH	8
#define TRIANGLE_HEIGHT	7
#define MARGIN_X		4
#define MARGIN_Y		5

#define LINE_MARGIN_Y	2

- (id)initWithCell:(NSTableHeaderCell*)cell
{
	self = [super initTextCell:[cell stringValue]];
	if (self) {
		NSMutableAttributedString* attributedString =
		[[[NSMutableAttributedString alloc] initWithAttributedString:
		  [cell attributedStringValue]] autorelease];
		[attributedString addAttributes:
		 [NSDictionary dictionaryWithObject:[NSColor whiteColor]
									 forKey:NSForegroundColorAttributeName]
								  range:NSMakeRange(0, [attributedString length])];
		[self setAttributedStringValue: attributedString];
		
		_ascending = YES;
		_priority = 1;
	}
	return self;
	
}

- (void)_drawInRect:(NSRect)rect hilighted:(BOOL)hilighted
{
	CGFloat delta = hilighted ? -0.1 : 0;
	NSArray* colorArray = [NSArray arrayWithObjects:
						   [NSColor colorWithDeviceWhite:0.6+delta alpha:1.0],
						   [NSColor colorWithDeviceWhite:0.3+delta alpha:1.0],
						   [NSColor colorWithDeviceWhite:0.2+delta alpha:1.0],
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
	NSRect stringFrame = rect;
	if (_priority == 0) {
		stringFrame.size.width -= TRIANGLE_WIDTH;
	}
	stringFrame.origin.y += LINE_MARGIN_Y;
	[[self attributedStringValue] drawInRect:stringFrame];
}


#pragma mark -
#pragma mark Overridden methods (NSCell)
- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	[self _drawInRect:cellFrame hilighted:NO];
	
}

- (void)highlight:(BOOL)flag withFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	[self _drawInRect:cellFrame hilighted:YES];
}


- (void)drawSortIndicatorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView ascending:(BOOL)ascending priority:(NSInteger)priority
{
	NSBezierPath* path = [NSBezierPath bezierPath];
	
	if (ascending) {
		NSPoint p = NSMakePoint(cellFrame.origin.x + cellFrame.size.width - TRIANGLE_WIDTH - MARGIN_X,
								cellFrame.origin.y + cellFrame.size.height - MARGIN_Y);
		[path moveToPoint:p];
		
		
		p.x += TRIANGLE_WIDTH/2.0;
		p.y -= TRIANGLE_HEIGHT;
		[path lineToPoint:p];
		
		p.x += TRIANGLE_WIDTH/2.0;
		p.y += TRIANGLE_HEIGHT;
		[path lineToPoint:p];
		
	} else {
		NSPoint p = NSMakePoint(cellFrame.origin.x + cellFrame.size.width - TRIANGLE_WIDTH - MARGIN_X,
								cellFrame.origin.y + MARGIN_Y);
		[path moveToPoint:p];
		
		
		p.x += TRIANGLE_WIDTH/2.0;
		p.y += TRIANGLE_HEIGHT;
		[path lineToPoint:p];
		
		p.x += TRIANGLE_WIDTH/2.0;
		p.y -= TRIANGLE_HEIGHT;
		[path lineToPoint:p];
		
	}
	
	[path closePath];
	
	if (_priority == 0) {
		[[NSColor whiteColor] set];
	} else {
		[[NSColor clearColor] set];
	}
	[path fill];
}

- (void)setSortAscending:(BOOL)ascending priority:(NSInteger)priority
{
	_ascending = ascending;
	_priority = priority;
}
@end
