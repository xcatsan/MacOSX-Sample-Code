//
//  Book.h
//  ArrayControllerUndoSample
//
//  Created by Hiroshi Hashiguchi on 10/12/29.
//  Copyright 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Book : NSObject {

	NSString* titile_;
	NSString* author_;
}
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* author;

@end
