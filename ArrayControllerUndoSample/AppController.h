//
//  AppController.h
//  ArrayControllerUndoSample
//
//  Created by Hiroshi Hashiguchi on 10/12/27.
//  Copyright 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CustomArrayController;
@interface AppController : NSObject {

	NSMutableArray* array;

	IBOutlet CustomArrayController* arrayController_;
	IBOutlet NSTableView* tableView_;
}

- (IBAction)setSelection:(id)sender;
- (IBAction)addSelection:(id)sender;
- (IBAction)undo:(id)sender;
- (IBAction)redo:(id)sender;

@end
