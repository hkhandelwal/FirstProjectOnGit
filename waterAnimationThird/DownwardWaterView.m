//
//  DownwardWaterView.m
//  waterAnimationSecond
//
//  Created by Himanshu on 04/06/14.
//  Copyright (c) 2014 DMI. All rights reserved.
//

#import "DownwardWaterView.h"

@implementation DownwardWaterView
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
    smokeEmitter = (CAEmitterLayer*)self.layer; //2
    smokeEmitter.emitterPosition = CGPointMake(12, -20);
    smokeEmitter.emitterSize = self.layer.frame.size;
    smokeEmitter.renderMode = kCAEmitterLayerLine;
    smokeEmitter.emitterShape = kCAEmitterLayerSurface;
    [smokeEmitter setMasksToBounds:YES];
    [smokeEmitter setCornerRadius:12.0f];
    
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    fire.birthRate = 5000;
    fire.lifetime = 1.5;
    fire.lifetimeRange = 0;
    fire.color = [[UIColor colorWithRed:40.0/255.0 green:49.0/255.0 blue:29.0/255.0 alpha:0.5] CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"Particles_fire.png"] CGImage];
    fire.velocity = 5;
    fire.velocityRange = 5;
    fire.emissionRange = 0.000;
    fire.xAcceleration = 0;
    fire.yAcceleration =200;
    fire.scaleSpeed = 0;
    fire.spin = 0;
    [fire setBeginTime:CACurrentMediaTime()+2.3];
    fire.emissionLatitude =0.0;
    fire.emissionLongitude = -139.50;
    [fire setName:@"fire"];
    smokeEmitter.emitterCells = [NSArray arrayWithObject:fire];
    
//    UIView *upwardView = [[UIView alloc] initWithFrame:CGRectMake(250, 40, 22, 165)];
    
    
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
