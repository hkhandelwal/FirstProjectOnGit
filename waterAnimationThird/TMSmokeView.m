//
//  TMSmokeView.m
//  3MWaterDealeriOS
//
//  Created by Ankit Thakur on 01/03/14.
//  Copyright (c) 2014 Golden Gekko. All rights reserved.
//

#import "TMSmokeView.h"
#import <QuartzCore/QuartzCore.h>

//#import "TMStringConstants.h"

@interface TMSmokeView (){
    
	CAEmitterLayer *smokeEmitter;
}

@end


@implementation TMSmokeView
// 507, 170

-(void)awakeFromNib
{
    //configure the emitter layer
    smokeEmitter = (CAEmitterLayer*)self.layer; //2
    smokeEmitter.emitterPosition = CGPointMake(15, 15);
    smokeEmitter.emitterSize = CGSizeMake(100, 10);
    smokeEmitter.renderMode = kCAEmitterLayerLine;
    smokeEmitter.emitterShape = kCAEmitterLayerSurface;
    
    
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    fire.birthRate = 500;
    fire.lifetime = 1.5;
    fire.lifetimeRange = 0;
    fire.color = [[UIColor colorWithRed:40.0/255.0 green:49.0/255.0 blue:29.0/255.0 alpha:0.5] CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"UpwardWater.png"] CGImage];
    fire.velocity = 15;
    fire.velocityRange = 20;
    fire.emissionRange = 0.000;
    fire.xAcceleration = 115;
    fire.scaleSpeed = 0;
    fire.spin = 0.1;
    [fire setBeginTime:CACurrentMediaTime()];
    fire.emissionLatitude =0.0;
    fire.emissionLongitude = -138.25;
    [fire setName:@"fire"];
    smokeEmitter.emitterCells = [NSArray arrayWithObject:fire];
    
}


- (CAEmitterLayer*) getEmitterLayer{
    //Create the smoke emitter layer
	CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    
    emitterLayer.emitterPosition = CGPointMake(-20, 01);//self.layer.frame.size.height-10);
	emitterLayer.emitterMode = kCAEmitterLayerPoints;
    
    //Size of Emitter
    emitterLayer.emitterSize = CGSizeMake(10, 10);
    
    return emitterLayer;
}


- (CAEmitterCell*) getEmitterCell{
    
    CAEmitterCell* smoke = [CAEmitterCell emitterCell];
	smoke.birthRate = 1000;
	smoke.lifetime = 0;
	smoke.velocity = 1;
//	smoke.spin = 1;
	smoke.spinRange = .7;
	smoke.yAcceleration = 0;
    smoke.xAcceleration = 15;
//	smoke.contents = (id) [UIImage imageNamed:@"Particles_fire"].CGImage;
	smoke.scale = 0.1;
	smoke.alphaSpeed = -0.15;
    smoke.alphaRange = .3;
	smoke.scaleSpeed = .5;
    smoke.scaleRange = .3;
	[smoke setBeginTime:CACurrentMediaTime()];
	//Name the cell so that it can be animated later using keypaths
	[smoke setName:@"smoke"];
    
    return smoke;

}

+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}

//===============================================================
//Creates emitter layer and set up its properties
//===============================================================
-(void) setUp{
    smokeEmitter = [self getEmitterLayer];
    smokeEmitter.emitterCells = @[[self getEmitterCell]];
    [smokeEmitter setValue:[NSNumber numberWithInt:5] forKeyPath:@"emitterCells.smoke.lifetime"];
	[self.layer addSublayer:smokeEmitter];
}

- (void) setUpDust{
    [smokeEmitter setValue:(id) [UIImage imageNamed:@"Particles_fire"].CGImage forKeyPath:@"emitterCells.smoke.contents"];
    [smokeEmitter setValue:(id) [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f].CGColor forKeyPath:@"emitterCells.smoke.color"];
}

- (void) setUpClean{
    [smokeEmitter setValue:(id) [UIImage imageNamed:@"Particles_fire"].CGImage forKeyPath:@"emitterCells.smoke.contents"];
    [smokeEmitter setValue:(id) [[UIColor whiteColor] colorWithAlphaComponent:0.5f].CGColor forKeyPath:@"emitterCells.smoke.color"];
}

- (void) dealloc{
    smokeEmitter = nil;
}

@end
