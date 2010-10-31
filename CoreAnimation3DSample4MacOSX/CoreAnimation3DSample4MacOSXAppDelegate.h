//
//  CoreAnimation3DSample4MacOSXAppDelegate.h
//  CoreAnimation3DSample4MacOSX
//
//  Created by Hiroshi Hashiguchi on 10/10/31.
//  Copyright 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CoreAnimation3DSample4MacOSXAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSView* view;

	BOOL fadeIn;
	CALayer* _baseLayer;
}

@property (assign) IBOutlet NSWindow *window;
@property (retain) IBOutlet NSView* view;

- (IBAction)turnFadeInOut:(id)sender;

@end
