// @author Simon Toens 12/15/13

#import <SpriteKit/SpriteKit.h>

@interface StarLayerNode : SKNode

+ (void)add:(NSUInteger)stars starsThatTake:(CGFloat)duration secondsToCrossAndHaveAlpha:(CGFloat)alpha
   toParent:(SKNode *)parent;

- (id)init __unavailable;
- (id)initWithFrame:(CGRect)frame;

- (void)addSprites;

@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, assign) NSUInteger numberOfStars;
@property (nonatomic, assign) CGFloat starAlpha;

@end