//
//  AppController.m
//  ArrayControllerUndoSample
//
//  Created by Hiroshi Hashiguchi on 10/12/27.
//  Copyright 2010 . All rights reserved.
//

#import "AppController.h"
#import "CustomArrayController.h"
#import "Book.h"

@implementation AppController

- (id) init
{
	self = [super init];
	if (self != nil) {
		array = [[NSMutableArray alloc] init];
		NSLog(@"%@", array);
	}
	return self;
}

- (void)awakeFromNib
{
		//	arrayController_.keys = [NSArray arrayWithObjects:@"title", @"author",nil];
}

@end
