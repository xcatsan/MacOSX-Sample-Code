
#import "CustomCornerView.h"
#import "CustomHeaderCell.h"

@implementation CustomCornerView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	
	[CustomHeaderCell drawBackgroundInRect:self.bounds
								 hilighted:NO];
}

- (BOOL)isFlipped
{
	return YES;
}

@end
