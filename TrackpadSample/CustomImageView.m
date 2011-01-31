//
//  CustomImageView.m
//  TrackpadSample
//
//  Created by Hiroshi Hashiguchi on 11/01/26.
//  Copyright 2011 . All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

- (void)awakeFromNib{
	[self setAcceptsTouchEvents:YES];
}
/*
- (void)magnifyWithEvent:(NSEvent *)event {
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);

    NSSize newSize;
    newSize.height = self.frame.size.height * ([event magnification] + 1.0);
    newSize.width = self.frame.size.width * ([event magnification] + 1.0);
    [self setFrameSize:newSize];
}

- (void)rotateWithEvent:(NSEvent *)event {
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
    [self setBoundsRotation:([self boundsRotation] + [event rotation]*2)];
	[self setNeedsDisplay:YES];
}

- (void)swipeWithEvent:(NSEvent *)event {
 NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
}
 */


- (void)touchesBeganWithEvent:(NSEvent *)event
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
	[super touchesBeganWithEvent:event];
}
- (void)touchesMovedWithEvent:(NSEvent *)event
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
	[super touchesMovedWithEvent:event];
}
- (void)touchesEndedWithEvent:(NSEvent *)event
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
	[super touchesEndedWithEvent:event];
}
- (void)touchesCancelledWithEvent:(NSEvent *)event
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
	[super touchesCancelledWithEvent:event];
}
@end
