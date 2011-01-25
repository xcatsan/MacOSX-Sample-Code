//
//  CustomHeaderCell.h
//  CustomHeaderSample
//
//  Created by Hiroshi Hashiguchi on 11/01/25.
//  Copyright 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CustomHeaderCell : NSTableHeaderCell {

	BOOL _ascending;
	NSInteger _priority;
}

- (id)initWithCell:(NSTableHeaderCell*)cell;
- (void)setSortAscending:(BOOL)ascending priority:(NSInteger)priority;

@end
