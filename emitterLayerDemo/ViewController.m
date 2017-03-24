//
//  ViewController.m
//  emitterLayerDemo
//
//  Created by gouzi on 2017/3/2.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) CAEmitterLayer *emitterLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view.layer addSublayer:self.emitterLayer];
}


- (CAEmitterLayer *)emitterLayer {
    if (!_emitterLayer) {
        _emitterLayer = [CAEmitterLayer layer];
        _emitterLayer.birthRate = 1;
        _emitterLayer.lifetime = arc4random() / 5 + 1;
        _emitterLayer.emitterPosition = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.8);
        _emitterLayer.emitterSize = CGSizeMake(20, 20);
        _emitterLayer.emitterDepth = 1.0f;
        
        _emitterLayer.emitterMode = kCAEmitterLayerUnordered;
        
        // 创建粒子
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        for (int i = 1; i < 10; ++i) {
            CAEmitterCell *cell = [CAEmitterCell emitterCell];
            cell.birthRate = 1.0f;
            cell.lifetime = arc4random() / 10 + 1;
            cell.lifetimeRange = 3.0f;
            cell.emissionLongitude = M_PI + M_PI_2;
            // 粒子发射角度的容差
            cell.emissionRange = M_PI_2;
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"good%d_30x30", i]];
            // 粒子显示的内容
            cell.contents = (id)[image CGImage];
            cell.velocity = arc4random_uniform(100) + 100;
            // 粒子速度的容差
            cell.velocityRange = 80;
            cell.scale = 0.4;
            [array addObject:cell];
            
        }
        _emitterLayer.emitterCells = [array copy];
        
    }
    return _emitterLayer;
}




@end
