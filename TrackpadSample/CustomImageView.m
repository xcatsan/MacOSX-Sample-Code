//
//  CustomImageView.m
//  TrackpadSample
//
//  Created by Hiroshi Hashiguchi on 11/01/26.
//  Copyright 2011 . All rights reserved.
//

#import "CustomImageView.h"


@implementation CustomImageView

- (void)magnifyWithEvent:(NSEvent *)event
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
}
- (void)swipeWithEvent:(NSEvent *)event
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
}
- (void)rotateWithEvent:(NSEvent *)event
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, event);
}
@end
