//
//  UINavigationController+UINavigationController_CustomAnimation.h
//  Retailer
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface UINavigationController (UINavigationController_CustomAnimation)

typedef enum
{
    CustomViewAnimationTransitionNone,
    CustomViewAnimationTransitionFlipFromLeft,
    CustomViewAnimationTransitionFlipFromRight,
    CustomViewAnimationTransitionCurlUp,
    CustomViewAnimationTransitionCurlDown,
    CustomViewAnimationTransitionFadeIn,
    CustomViewAnimationTransitionMoveIn,
    CustomViewAnimationTransitionPush,
    CustomViewAnimationTransitionReveal
} CustomViewAnimationTransition;

#define CustomViewAnimationSubtypeFromRight kCATransitionFromRight
#define CustomViewAnimationSubtypeFromLeft kCATransitionFromLeft
#define CustomViewAnimationSubtypeFromTop kCATransitionFromTop
#define CustomViewAnimationSubtypeFromBottom kCATransitionFromBottom

- (void)pushViewController:(UIViewController *)viewController withCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype;
- (void)popViewControllerWithCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype;
- (void)popToRootViewControllerWithCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype;
- (void)popToViewController:(UIViewController *)viewController withCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype;
@end

