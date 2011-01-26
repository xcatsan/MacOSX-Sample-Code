//
//  TrackpadSampleAppDelegate.h
//  TrackpadSample
//
//  Created by Hiroshi Hashiguchi on 11/01/26.
//  Copyright 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TrackpadSampleAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	
	IBOutlet NSImageView* imageView;
}

@property (assign) IBOutlet NSWindow *window;

@end
