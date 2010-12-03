//
//  AppController.m
//  NSTableViewSample
//
//  Created by Hiroshi Hashiguchi on 10/12/03.
//  Copyright 2010 . All rights reserved.
//

#import "AppController.h"


@implementation AppController

@synthesize list;
- (id)init
{
	if (self = [super init]) {
		list = [[NSMutableArray alloc] init];
		
		int i;
		
		for (i=0; i < 10; i++) {
			
			NSString* name = [NSString stringWithFormat:@"name-%d", i];
			NSString* email = [NSString stringWithFormat:@"email-%d", i];
			
			NSMutableDictionary* dict = [NSMutableDictionary
										 dictionaryWithObjectsAndKeys:name, @"name", email, @"email", nil];
			[list addObject:dict];
		}
	}
	return self;
}

@end
