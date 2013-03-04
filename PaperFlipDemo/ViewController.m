//
//  ViewController.m
//  PaperFlipDemo
//
//  Created by Leon on 13-3-4.
//  Copyright (c) 2013年 Leon. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FlipAnimation.h"
#import <QuartzCore/QuartzCore.h>

#define kDuration  3.5

@interface ViewController ()

@end

@implementation ViewController
{
    CGRect _leftViewFrame;
    CGRect _rightViewFrame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.bgImageView.layer.zPosition = -400;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _leftViewFrame = self.leftView.frame;
    _rightViewFrame = self.rightView.frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftInTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideLeft direction:PageFlipDirectionIn];
    [self.rightView flipWithDuration:kDuration side:PageFlipSideRight direction:PageFlipDirectionIn];
}

- (IBAction)leftOutTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideLeft direction:PageFlipDirectionOut];
}

- (IBAction)rightInTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideRight direction:PageFlipDirectionIn];
}

- (IBAction)rightOutTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideRight direction:PageFlipDirectionOut];
}

- (IBAction)topInTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideTop direction:PageFlipDirectionIn];
}

- (IBAction)topOutTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideTop direction:PageFlipDirectionOut];
}

- (IBAction)bottomInTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideBottom direction:PageFlipDirectionIn];
}

- (IBAction)bottomOutTapped:(id)sender {
    [self.leftView flipWithDuration:kDuration side:PageFlipSideBottom direction:PageFlipDirectionOut];
}

- (IBAction)resetTapped:(id)sender {
    [self.leftView.layer removeAllAnimations];
    self.leftView.hidden = NO;
    self.leftView.frame = _leftViewFrame;
}

@end
