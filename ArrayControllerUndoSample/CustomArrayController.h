//
//  CustomArrayController.h
//  SimpleCap
//
//  Created by Hiroshi Hashiguchi on 10/12/27.
//  Copyright 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CustomArrayController : NSArrayController {

	NSUndoManager* undoManager_;
	BOOL skipFlag_;
	NSArray* keys_;
}
@property (nonatomic, retain, readonly) NSUndoManager* undoManager;
@property (nonatomic, retain) NSArray* keys;

-(BOOL)undo;
-(BOOL)redo;

-(IBAction)undo:(id)sender;
-(IBAction)redo:(id)sender;

@end
