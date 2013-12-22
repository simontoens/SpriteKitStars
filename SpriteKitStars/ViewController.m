// @author Simon Toens 12/15/13

#import "ViewController.h"
#import "MyScene.h"

@interface ViewController()
@property (nonatomic, strong) IBOutlet SKView *skView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _skView.showsFPS = YES;
    _skView.showsNodeCount = YES;
    
    SKScene * scene = [MyScene sceneWithSize:_skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [_skView presentScene:scene];
}

@end
