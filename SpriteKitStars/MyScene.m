// @author Simon Toens 12/15/13

#import "MyScene.h"
#import "StarLayerNode.h"

@implementation MyScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [UIColor blackColor];
        [StarLayerNode add:100 starsThatTake:5 secondsToCrossAndHaveAlpha:1 toParent:self];
        [StarLayerNode add:80 starsThatTake:8 secondsToCrossAndHaveAlpha:0.8 toParent:self];
        [StarLayerNode add:60 starsThatTake:10 secondsToCrossAndHaveAlpha:0.6 toParent:self];
        [StarLayerNode add:40 starsThatTake:12 secondsToCrossAndHaveAlpha:0.4 toParent:self];
    }
    return self;
}

@end