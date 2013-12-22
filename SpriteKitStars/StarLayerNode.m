// @author Simon Toens 12/15/13

#import "StarLayerNode.h"

@interface StarLayerNode() {
    CGRect _frame;
    UIColor *_starColor;
}
@end

@implementation StarLayerNode : SKNode

+ (void)add:(NSUInteger)numStars starsThatTake:(CGFloat)duration secondsToCrossAndHaveAlpha:(CGFloat)alpha
   toParent:(SKNode *)parent
{
    StarLayerNode *starLayer = [[StarLayerNode alloc] initWithFrame:parent.frame];
    starLayer.numberOfStars = numStars;
    starLayer.animationDuration = duration;
    starLayer.alpha = alpha;
    [starLayer addSprites];
    [parent addChild:starLayer];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
        _numberOfStars = 100;
        _animationDuration = 5;
        _starAlpha = 1;
        _frame = frame;
    }
    return self;
}

- (void)addSprites {
    _starColor = [UIColor colorWithWhite:1.0 alpha:_starAlpha];
    [self addStarSprites];
    [self setupStarAnimation];
}

- (void)addStarSprites {
    for (int i = 0; i < _numberOfStars; i++) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:_starColor size:CGSizeMake(1, 1)];
        sprite.position = CGPointMake(_frame.origin.x + arc4random() % (int)_frame.size.width,
                                      _frame.origin.y + arc4random() % (int)_frame.size.height);
        [self addChild:sprite];
    }
}

- (void)setupStarAnimation {
    for (SKSpriteNode *star in self.children) {
        [self setupStarAnimation:star];
    }
}

- (void)setupStarAnimation:(SKSpriteNode *)sprite {
    int xdelta = _frame.origin.x + _frame.size.width - sprite.position.x;
    CGFloat duration = xdelta / _frame.size.width * _animationDuration;
    SKAction *action1 = [SKAction moveByX:xdelta y:0 duration:duration];
    SKAction *action2 = [SKAction moveToX:_frame.origin.x duration:0];
    SKAction *action3 = [SKAction moveByX:_frame.size.width y:0 duration:_animationDuration];
    SKAction *repeatingActions = [SKAction repeatActionForever:[SKAction sequence:@[action2, action3]]];
    SKAction *actionSequence = [SKAction sequence:@[action1, repeatingActions]];
    [sprite runAction:actionSequence];
}

@end