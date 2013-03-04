//
//  ViewController.h
//  PaperFlipDemo
//
//  Created by Leon on 13-3-4.
//  Copyright (c) 2013年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

- (IBAction)leftInTapped:(id)sender;
- (IBAction)leftOutTapped:(id)sender;
- (IBAction)rightInTapped:(id)sender;
- (IBAction)rightOutTapped:(id)sender;
- (IBAction)topInTapped:(id)sender;
- (IBAction)topOutTapped:(id)sender;
- (IBAction)bottomInTapped:(id)sender;
- (IBAction)bottomOutTapped:(id)sender;
- (IBAction)resetTapped:(id)sender;

@end
