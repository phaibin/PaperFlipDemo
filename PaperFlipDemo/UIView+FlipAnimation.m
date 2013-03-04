//
//  UIView+FlipAnimation.m
//  FiveStar
//
//  Created by Leon on 13-3-4.
//
//

#import "UIView+FlipAnimation.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (FlipAnimation)

- (void)flipWithDuration:(NSTimeInterval)duration side:(PageFlipSide)side direction:(PageFlipDirection)direction
{
    [CATransaction begin];
    
    [CATransaction setCompletionBlock:^{
        self.hidden = YES;
    }];
    
    // Remove existing animations before stating new animation
    [self.layer removeAllAnimations];
    
    // Make sure view is visible
    self.hidden = NO;
    
    // disable the view so it’s not doing anythign while animating
    self.userInteractionEnabled = NO;
    
    // create an animation to hold the page turning
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.removedOnCompletion = NO;
    transformAnimation.fillMode = kCAFillModeForwards;
    transformAnimation.duration = duration;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // start the animation from the current state
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    CATransform3D endTransform;
    
    // Set the CALayer anchorPoint to the left edge and
    // translate the button to account for the new
    // anchorPoint. In case you want to reuse the animation
    // for this button, we only do the translation and
    // anchor point setting once.
    switch (side) {
        case PageFlipSideLeft: {
            if (self.layer.anchorPoint.x != 0.0f) {
                self.layer.anchorPoint = CGPointMake(0.0f, 0.5f);
                self.center = CGPointMake(self.center.x - self.bounds.size.width/2.0f, self.center.y);
            }
            // this is the basic rotation by 90 degree along the y-axis
            if (direction == PageFlipDirectionIn) {
                endTransform = CATransform3DMakeRotation(-3.141f/2.0f,
                                                         0.0f,
                                                         -1.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m14 = 0.0015f;
            } else if (direction == PageFlipDirectionOut) {
                endTransform = CATransform3DMakeRotation(3.141f/2.0f,
                                                         0.0f,
                                                         -1.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m14 = -0.0015f;
            }
            break;
        }
        case PageFlipSideRight: {
            if (self.layer.anchorPoint.x != 1.0f) {
                self.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
                self.center = CGPointMake(self.center.x + self.bounds.size.width/2.0f, self.center.y);
            }
            // this is the basic rotation by 90 degree along the y-axis
            if (direction == PageFlipDirectionIn) {
                endTransform = CATransform3DMakeRotation(3.141f/2.0f,
                                                         0.0f,
                                                         -1.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m14 = -0.0015f;
            } else if (direction == PageFlipDirectionOut) {
                endTransform = CATransform3DMakeRotation(-3.141f/2.0f,
                                                         0.0f,
                                                         -1.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m14 = 0.0015f;
            }
            break;
        }
        case PageFlipSideTop: {
            if (self.layer.anchorPoint.y != 0.0f) {
                self.layer.anchorPoint = CGPointMake(0.5f, 0.0f);
                self.center = CGPointMake(self.center.x, self.center.y - self.bounds.size.height/2.0f);
            }
            // this is the basic rotation by 90 degree along the y-axis
            if (direction == PageFlipDirectionIn) {
                endTransform = CATransform3DMakeRotation(-3.141f/2.0f,
                                                         1.0f,
                                                         -0.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m24 = 0.0015f;
            } else if (direction == PageFlipDirectionOut) {
                endTransform = CATransform3DMakeRotation(3.141f/2.0f,
                                                         1.0f,
                                                         -0.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m24 = -0.0015f;
            }
            break;
        }
        case PageFlipSideBottom: {
            if (self.layer.anchorPoint.y != 1.0f) {
                self.layer.anchorPoint = CGPointMake(0.5f, 1.0f);
                self.center = CGPointMake(self.center.x, self.center.y + self.bounds.size.height/2.0f);
            }
            // this is the basic rotation by 90 degree along the y-axis
            if (direction == PageFlipDirectionIn) {
                endTransform = CATransform3DMakeRotation(3.141f/2.0f,
                                                         1.0f,
                                                         -0.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m24 = -0.0015f;
            } else if (direction == PageFlipDirectionOut) {
                endTransform = CATransform3DMakeRotation(-3.141f/2.0f,
                                                         1.0f,
                                                         -0.0f,
                                                         0.0f);
                // these values control the 3D projection outlook
                endTransform.m34 = 0.001f;
                endTransform.m24 = 0.0015f;
            }
            break;
        }
        default:
            break;
    }
    
    transformAnimation.toValue = [NSValue valueWithCATransform3D:endTransform];
    [self.layer addAnimation:transformAnimation forKey:@"flipViewOpen"];
    [CATransaction commit];
}

@end
