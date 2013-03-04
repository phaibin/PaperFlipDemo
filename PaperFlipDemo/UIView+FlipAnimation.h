//
//  UIView+FlipAnimation.h
//  FiveStar
//
//  Created by Leon on 13-3-4.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    PageFlipSideLeft = 0,
    PageFlipSideRight,
    PageFlipSideTop,
    PageFlipSideBottom,
} PageFlipSide;

typedef enum {
    PageFlipDirectionIn = 0,
    PageFlipDirectionOut,
} PageFlipDirection;

@interface UIView (FlipAnimation)

- (void)flipWithDuration:(NSTimeInterval)duration side:(PageFlipSide)side direction:(PageFlipDirection)direction;

@end
