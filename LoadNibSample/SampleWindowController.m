//
//  SampleWindowController.m
//  LoadNibSample
//
//  Created by Hiroshi Hashiguchi on 10/11/11.
//  Copyright 2010 . All rights reserved.
//

#import "SampleWindowController.h"


@implementation SampleWindowController

- (IBAction)showWindow:(id)sender
{
	if (sampleWindow_ == nil) {
		NSNib* nib = [[NSNib alloc] initWithNibNamed:@"SampleWindow"
											  bundle:nil];
		NSArray* array;
		BOOL result = [nib instantiateNibWithOwner:self
								   topLevelObjects:&array];
		NSLog(@"%@", array);
		[nib release];
		
		if (result) {
			NSLog(@"success");
		} else {
			NSLog(@"failed");
		}
	}
	[sampleWindow_ makeKeyAndOrderFront:self];
}


@end
