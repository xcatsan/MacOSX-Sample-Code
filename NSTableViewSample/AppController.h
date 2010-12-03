//
//  AppController.h
//  NSTableViewSample
//
//  Created by Hiroshi Hashiguchi on 10/12/03.
//  Copyright 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {

	NSMutableArray* list;
	IBOutlet NSArrayController* arrayController;
	IBOutlet NSTableView* tableView;
}
@property (nonatomic, retain) NSMutableArray* list;

@end
