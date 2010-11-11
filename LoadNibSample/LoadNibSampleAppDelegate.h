//
//  LoadNibSampleAppDelegate.h
//  LoadNibSample
//
//  Created by Hiroshi Hashiguchi on 10/11/11.
//  Copyright 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LoadNibSampleAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
