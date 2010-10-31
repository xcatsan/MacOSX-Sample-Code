//
//  CoreAnimation3DSample4MacOSXAppDelegate.m
//  CoreAnimation3DSample4MacOSX
//
//  Created by Hiroshi Hashiguchi on 10/10/31.
//  Copyright 2010 . All rights reserved.
//

#import "CoreAnimation3DSample4MacOSXAppDelegate.h"
#import <Quartz/Quartz.h>
#import <QuartzCore/CATransform3D.h>

@implementation CoreAnimation3DSample4MacOSXAppDelegate

@synthesize window;
@synthesize view;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

#define IMAGE_WIDTH		100
#define IMAGE_HEIGHT	75
#define PADDING_X			10
#define PADDING_Y			10
#define OFFSET_X  85
#define OFFSET_Y  50

CGFloat x[9] = {
	0, IMAGE_WIDTH+PADDING_X, (IMAGE_WIDTH+PADDING_X)*2,
	0, IMAGE_WIDTH+PADDING_X, (IMAGE_WIDTH+PADDING_X)*2,
	0, IMAGE_WIDTH+PADDING_X, (IMAGE_WIDTH+PADDING_X)*2
};

CGFloat y[9] = {
	100, 100, 100,
	100+IMAGE_HEIGHT+PADDING_Y, 100+IMAGE_HEIGHT+PADDING_Y, 100+IMAGE_HEIGHT+PADDING_Y,
	100+(IMAGE_HEIGHT+PADDING_Y)*2, 100+(IMAGE_HEIGHT+PADDING_Y)*2, 100+(IMAGE_HEIGHT+PADDING_Y)*2
};


#define DURATION 0.5
- (void)animateFadeInOut:(BOOL)flag
{
	CGFloat zPositionFrom = flag ? -1000 : 0;
	CGFloat zPositionTo = flag ? 0 : -1000;
	CGFloat opacityFrom = flag ? 0.25 : 1.0;
	CGFloat opacityTo = flag ? 1.0 : 0.25;
	
//	CALayer* layer = [self.view.layer.sublayers objectAtIndex:0];
//	CALayer* layer = self.view.layer;

	for (CALayer* layer in self.view.layer.sublayers) {
		CABasicAnimation *animation;
		animation=[CABasicAnimation animationWithKeyPath:@"zPosition"];
		animation.fromValue=[NSNumber numberWithFloat:zPositionFrom];
		animation.toValue=[NSNumber numberWithFloat:zPositionTo];
		animation.duration=DURATION;
		animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
		animation.repeatCount = 1;
		animation.delegate = self;
		animation.removedOnCompletion = NO;
		[layer addAnimation:animation forKey:@"zPosition"];
		
		animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
		animation.fromValue=[NSNumber numberWithFloat:opacityFrom];
		animation.toValue=[NSNumber numberWithFloat:opacityTo];
		animation.duration=DURATION;
		animation.repeatCount = 1;
		animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
		[layer addAnimation:animation forKey:@"opacity"];		

	}
}

- (void)awakeFromNib
{
	CALayer* baseLayer = [CALayer layer];
	 
	CGColorRef colorRef = CGColorCreateGenericGray(0.0f, 1.0f);
	baseLayer.backgroundColor = colorRef;
	CGColorRelease(colorRef);
	
	CATransform3D transform = CATransform3DMakeRotation(0, 0, 0, 0); 
	float zDistance = 1000; 
	transform.m34 = 1.0 / zDistance;
	baseLayer.sublayerTransform = transform;
	
	self.view.layer = baseLayer;
	[self.view setWantsLayer:YES];

	
	for (int i=0; i < 9; i++) {
		NSImage* image = [NSImage imageNamed:[NSString stringWithFormat:@"image%02ds.jpg", i+1]];
		CALayer* layer = [CALayer layer];
		
		NSBitmapImageRep* bitmapImage =
			[NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]];
		layer.contents = (id)[bitmapImage CGImage];
		layer.frame = CGRectMake(x[i]+OFFSET_X, y[i]-OFFSET_Y, IMAGE_WIDTH, IMAGE_HEIGHT);
		[baseLayer addSublayer:layer];
	}
	
	fadeIn = YES;
	[self animateFadeInOut:fadeIn];
}


- (IBAction)turnFadeInOut:(id)sender
{
	fadeIn = !fadeIn;
	[self animateFadeInOut:fadeIn];
}

@end
