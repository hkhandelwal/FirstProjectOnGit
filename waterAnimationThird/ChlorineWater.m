//
//  ChlorineWater.m
//  waterAnimationThird
//
//  Created by Himanshu on 04/06/14.
//  Copyright (c) 2014 DMI. All rights reserved.
//

#import "ChlorineWater.h"

@implementation ChlorineWater
{
    CAEmitterLayer *fireEmitter;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)awakeFromNib
{
//    double delayInSeconds = 1.5;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //configure the emitter layer
        fireEmitter = (CAEmitterLayer*)self.layer; //2
        fireEmitter.emitterPosition = CGPointMake(3, 15);
        fireEmitter.emitterSize = CGSizeMake(100, 10);
        fireEmitter.renderMode = kCAEmitterLayerLine;
        fireEmitter.emitterShape = kCAEmitterLayerSurface;
        
        
        CAEmitterCell* fire = [CAEmitterCell emitterCell];
        fire.birthRate = 500;
        fire.lifetime = 1.2;
        fire.color = [[UIColor magentaColor] CGColor];
        fire.contents = (id)[[UIImage imageNamed:@"UpwardWater.png"] CGImage];
        fire.velocity = 40;
        fire.xAcceleration = 10;
    fire.beginTime = CACurrentMediaTime()+1.5;
        [fire setName:@"fire"];
        fireEmitter.emitterCells = [NSArray arrayWithObject:fire];
//    });
}

+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}



@end
