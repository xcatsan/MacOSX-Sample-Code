// Copyright (c) 2011 Hiroshi Hashiguchi
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "GestureView.h"

#define kThresholdOfDoubleTouches	1.0

@implementation GestureView
@synthesize previousTouch = previousTouch_;

- (id)init
{
	NSRect frame = NSZeroRect;
	NSImage* image = [NSImage imageNamed:@"sample"];
	frame.size = image.size;
	frame.origin = NSMakePoint(50, 50);

    self = [super initWithFrame:frame];
    if (self) {
		image_ = image;
		[self setAcceptsTouchEvents:YES];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	[image_ drawAtPoint:NSZeroPoint
			   fromRect:NSZeroRect
			  operation:NSCompositeSourceOver
			   fraction:1.0];
}

#pragma mark -
#pragma mark (private)

- (void)_cancelTracking {
    if (isTracking_) {
        isTracking_ = NO;
        self.previousTouch = nil;
    }
}


#pragma mark -
#pragma mark NSResponder

- (void)touchesBeganWithEvent:(NSEvent *)event {

    NSSet *touches = [event touchesMatchingPhase:NSTouchPhaseTouching inView:self];
    
    if (touches.count == 2) {
		NSLog(@"%s|%@", __PRETTY_FUNCTION__, @"began two touches...");
		
        self.previousTouch = [touches anyObject];
    }
//	[super touchesBeganWithEvent:event];

}

- (void)touchesMovedWithEvent:(NSEvent *)event {
    
    NSSet *touches = [event touchesMatchingPhase:NSTouchPhaseTouching inView:self];
    
    if (touches.count == 2 && self.previousTouch) {
		NSLog(@"%s|%@", __PRETTY_FUNCTION__, @"moved two touches...");
		
		NSTouch *currentTouch = nil;
		for (currentTouch in [touches allObjects]) {
			if ([currentTouch.identity isEqual:self.previousTouch.identity]) {
				break;
			}
		}

		/* {297.638, 215.433}
		NSLog(@"%s|%@", __PRETTY_FUNCTION__, NSStringFromSize(deviceSize));
		*/

		NSSize deviceSize = self.previousTouch.deviceSize;
		CGFloat dx = (currentTouch.normalizedPosition.x -
					  self.previousTouch.normalizedPosition.x) * deviceSize.width * 2; //(114/72);
		CGFloat dy = (currentTouch.normalizedPosition.y -
					  self.previousTouch.normalizedPosition.y) * deviceSize.height * 2; //(114/72);
		
        if (!isTracking_) {

			if (fabs(dx) > kThresholdOfDoubleTouches || fabs(dy) > kThresholdOfDoubleTouches) {
                isTracking_ = YES;
				NSLog(@"%s|%@", __PRETTY_FUNCTION__, @"start tracking...");
            }

        } else {
			NSLog(@"%s|%@", __PRETTY_FUNCTION__, @"update tracking...");
			NSRect frame = self.frame;
			frame.origin.x += dx;
			frame.origin.y += dy;
			self.frame = frame;
        }
		self.previousTouch = currentTouch;
    }
//	[super touchesMovedWithEvent:event];
}
- (void)touchesEndedWithEvent:(NSEvent *)event {
	if (isTracking_) {
		NSLog(@"%s|%@", __PRETTY_FUNCTION__, @"ended tracking...");
		[self _cancelTracking];		
	}
}

- (void)touchesCancelledWithEvent:(NSEvent *)event {
	if (isTracking_) {
		NSLog(@"%s|%@", __PRETTY_FUNCTION__, @"canceled tracking...");
		[self _cancelTracking];
	}
}


@end
