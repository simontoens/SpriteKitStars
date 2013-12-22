//
//  MyScene.m
//  SpriteKitStars
//
//  Created by Simon Toens on 12/15/13.
//  Copyright (c) 2013 Simon Toens. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [UIColor blackColor];
        
        NSArray *starSpriteNodes = [self addSprites:1000];
        [self setupStarAnimation:starSpriteNodes];
    }
    return self;
}

- (void)setupStarAnimation:(NSArray *)starSpriteNodes {
    int durationFactor = 5;
    for (SKSpriteNode *star in starSpriteNodes) {
        [self setupStarAnimation:star durationFactor:durationFactor];
        durationFactor += 2;
        if (durationFactor == 15) {
            durationFactor = 5;
        }
    }
}

- (void)setupStarAnimation:(SKSpriteNode *)sprite durationFactor:(int)durationFactor {
    CGRect space = self.frame;
    int xdelta = space.origin.x + space.size.width - sprite.position.x;
    CGFloat duration = xdelta / space.size.width * durationFactor;
    SKAction *action1 = [SKAction moveByX:xdelta y:0 duration:duration];
    SKAction *action2 = [SKAction moveToX:space.origin.x duration:0];
    SKAction *action3 = [SKAction moveByX:space.size.width y:0 duration:durationFactor];
    SKAction *repeatingActions = [SKAction repeatActionForever:[SKAction sequence:@[action2, action3]]];
    SKAction *actionSequence = [SKAction sequence:@[action1, repeatingActions]];
    [sprite runAction:actionSequence];
}

- (NSArray *)addSprites:(int)numSprites {
    NSMutableArray *starSpriteNodes = [[NSMutableArray alloc] initWithCapacity:numSprites];
    CGRect space = self.frame;
    for (int i = 0; i < numSprites; i++) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)];
        sprite.position = CGPointMake(space.origin.x + arc4random() % (int)space.size.width,
                                      space.origin.y + arc4random() % (int)space.size.height);
        [self addChild:sprite];
        [starSpriteNodes addObject:sprite];
    }
    return starSpriteNodes;
}

@end