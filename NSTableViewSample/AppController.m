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
			
			NSString* name = [NSString stringWithFormat:@"%c%d-name", 'a'+(i/2), i];
			NSString* email = [NSString stringWithFormat:@"email-%d", i];
			
			NSMutableDictionary* dict = [NSMutableDictionary
										 dictionaryWithObjectsAndKeys:name, @"name", email, @"email", nil];
			[list addObject:dict];
		}
	}
	return self;
}

- (void)awakeFromNib
{
			[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidEnd:)
	 												 name:NSControlTextDidEndEditingNotification object:nil];
}

- (void)editingDidEnd:(NSNotification *)notification
{
	NSLog(@"%s|%@", __PRETTY_FUNCTION__, notification);
}

- (BOOL)control:(NSControl *)control textShouldBeginEditing:(NSText *)fieldEditor
{
	NSLog(@"%s|%@|%@", __PRETTY_FUNCTION__, control, fieldEditor);
	return YES;
}

- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor
{
	NSLog(@"%s|%@|%@", __PRETTY_FUNCTION__, control, fieldEditor);
	return YES;
}

- (BOOL)tableView:(NSTableView *)aTableView shouldEditTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
	NSLog(@"%s|%@|%@|%d", __PRETTY_FUNCTION__, aTableView, aTableColumn, rowIndex);
	return YES;
}

@end
