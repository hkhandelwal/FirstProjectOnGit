//
//  UpwardWaterView.m
//  waterAnimationSecond
//
//  Created by Himanshu on 04/06/14.
//  Copyright (c) 2014 DMI. All rights reserved.
//

#import "UpwardWaterView.h"

@implementation UpwardWaterView
{
    CAEmitterLayer *smokeEmitter;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    //configure the emitter layer
//    double delayInSeconds = 4.25;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        smokeEmitter = (CAEmitterLayer*)self.layer; //2
        smokeEmitter.emitterPosition = CGPointMake(5, 175);
        smokeEmitter.emitterSize = CGSizeMake(1,1);
        smokeEmitter.renderMode = kCAEmitterLayerAdditive;
        smokeEmitter.emitterShape = kCAEmitterLayerLine;
//        smokeEmitter.masksToBounds = YES;
        [smokeEmitter setCornerRadius:3.0f];
        
        CAEmitterCell* fire = [CAEmitterCell emitterCell];
        fire.birthRate = 5000;
        fire.lifetime = 10;
//        fire.color = [[UIColor magentaColor] CGColor];
        fire.contents = (id)[[UIImage imageNamed:@"UpwardWater.png"] CGImage];
        fire.velocity = 50;
        fire.xAcceleration = 0;
        fire.yAcceleration = -30;
        fire.beginTime = CACurrentMediaTime()+4.25;
        [fire setName:@"fire"];
        smokeEmitter.emitterCells = [NSArray arrayWithObject:fire];
//    });
    
    
}

+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
