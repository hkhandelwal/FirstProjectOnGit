//
//  DWFParticleView.m
//  WaterAnimation
//
//  Created by Himanshu on 27/05/14.
//  Copyright (c) 2014 manoj. All rights reserved.
//

#import "DWFParticleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DWFParticleView
{
    CAEmitterLayer* fireEmitter; //1
}

-(void)awakeFromNib
{
    //configure the emitter layer
    
//    double delayInSeconds = 5.30;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        fireEmitter = (CAEmitterLayer*)self.layer; //2
        fireEmitter.emitterPosition = CGPointMake(15, 15);
        fireEmitter.emitterSize = CGSizeMake(100, 10);
        fireEmitter.renderMode = kCAEmitterLayerLine;
        fireEmitter.emitterShape = kCAEmitterLayerSurface;
        
        
        CAEmitterCell* fire = [CAEmitterCell emitterCell];
        fire.birthRate = 2000;
        fire.lifetime = 1.5;
        fire.lifetimeRange = 0;
        //    fire.color = [[UIColor whiteColor] CGColor];
        fire.contents = (id)[[UIImage imageNamed:@"UpwardWater.png"] CGImage];
        fire.velocity = 30;
        fire.velocityRange = 5;
        fire.emissionRange = 0.000;
        fire.xAcceleration = 50;
        fire.scaleSpeed = 0;
        fire.spin = 0.1;
        [fire setBeginTime:CACurrentMediaTime()+5.90];
        fire.emissionLatitude =0.0;
        fire.emissionLongitude = -138.25;
        [fire setName:@"fire"];
        fireEmitter.emitterCells = [NSArray arrayWithObject:fire];
//    });
    
    
}

//-(void) stopEmission
//{
//    [fireEmitter setValue:@0 forKeyPath:@"emitterCells.fire.birthRate"];
////    [fireEmitter setValue:@0 forKeyPath:@"emitterCells.water.birthRate"];
//    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startEmission) userInfo:nil repeats:NO];
//
//}
//
//- (void)startEmission
//{
//    [fireEmitter setValue:@600 forKeyPath:@"emitterCells.fire.birthRate"];
//    [fireEmitter setValue:@3.0 forKeyPath:@"emitterCells.fire.lifetime"];
//    [fireEmitter setValue:@0.5 forKeyPath:@"emitterCells.fire.lifetimeRange"];
//    [fireEmitter setValue:[UIColor blueColor] forKeyPath:@"emitterCells.fire.color"];
//    [fireEmitter setValue:(id)[[UIImage imageNamed:@"Particles_fire.png"] CGImage] forKeyPath:@"emitterCells.fire.contents"];
////    [fireEmitter setValue:@250 forKeyPath:@"emitterCells.water.birthRate"];
//    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(stopEmissionTwo) userInfo:nil repeats:NO];
//}
//
//-(void) stopEmissionTwo
//{
//    [fireEmitter setValue:@0 forKeyPath:@"emitterCells.fire.birthRate"];
////    [fireEmitter setValue:@0 forKeyPath:@"emitterCells.water.birthRate"];
//}


+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}

@end
