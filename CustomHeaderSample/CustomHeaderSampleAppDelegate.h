//
//  CustomHeaderSampleAppDelegate.h
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomHeaderSampleAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;

	IBOutlet NSArrayController* arrayController;
	IBOutlet NSTableView* tableView;
	
	NSMutableArray* list;
}

@property (assign) IBOutlet NSWindow *window;

@end
