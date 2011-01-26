//
//  CustomHeaderSampleAppDelegate.h
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomHeaderSampleAppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate> {
    NSWindow *window;

	IBOutlet NSArrayController* arrayController_;
	IBOutlet NSTableView* tableView_;
	
	NSMutableArray* list;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)button:(id)sender;

@end
