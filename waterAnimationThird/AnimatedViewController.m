//
//  AnimatedViewController.m
//  waterAnimationSecond
//
//  Created by Himanshu on 04/06/14.
//  Copyright (c) 2014 DMI. All rights reserved.
//

#import "AnimatedViewController.h"
#import "TMSmokeView.h"

@interface AnimatedViewController ()

@end

@implementation AnimatedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    TMSmokeView *smk = [[TMSmokeView alloc] init];
//    [smk setUp];
//    [smk setUpClean];
//    [smk setUpDust];
//    UIView *upwardView = [[UIView alloc] initWithFrame:CGRectMake(270, 40, 10, 165)];
//    upwardView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:upwardView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
