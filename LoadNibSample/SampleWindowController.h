//
//  SampleWindowController.h
//  LoadNibSample
//
//  Created by Hiroshi Hashiguchi on 10/11/11.
//  Copyright 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SampleWindowController : NSObject {

	IBOutlet NSWindow* sampleWindow_;
}
- (IBAction)showWindow:(id)sender;

@end
