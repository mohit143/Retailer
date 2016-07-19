//
//  UINavigationController+UINavigationController_CustomAnimation.m
//  Retailer
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "UINavigationController+UINavigationController_CustomAnimation.h"

@interface UINavigationController()

- (void)standardAnimationWithController:(UIViewController*)viewController
                               duration:(NSTimeInterval)duration
                                options:(UIViewAnimationOptions)options
                           changesBlock:(void (^)(void))block;
- (void)coreAnimationWithController:(UIViewController*)viewController
                           duration:(NSTimeInterval)duration
                               type:(NSString*)type
                            subtype:(NSString*)subtype
                       changesBlock:(void (^)(void))block;
@end

@implementation UINavigationController (UINavigationController_CustomAnimation)
#pragma mark -
#pragma mark pushing

- (void)pushViewController:(UIViewController *)viewController withCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype {
    // Adding Custom animations in pushing a ViewController
    switch (transition) {
        case CustomViewAnimationTransitionNone:{
            
            //Default Transition Case
            [self standardAnimationWithController:viewController duration:0.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromLeft:{
            
            //Flip From Left Transition
            [self standardAnimationWithController:viewController duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromRight:{
            //Flip From Right Transition
            [self standardAnimationWithController:viewController duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlUp:{
            //Curl Up Transition
            [self standardAnimationWithController:viewController duration:0.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlDown:{
            //Curl Down Transition
            [self standardAnimationWithController:viewController duration:0.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFadeIn:{
            
            //Fading Transition
            [self coreAnimationWithController:viewController duration:0.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionMoveIn:{
            
            //Move In Transition
            [self coreAnimationWithController:viewController duration:0.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionPush:{
            //Sliding Transition
            [self coreAnimationWithController:viewController duration:0.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionReveal:{
            //Reveal View Type Transition in specified direction
            [self coreAnimationWithController:viewController duration:0.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}

#pragma mark -
#pragma mark popping

- (void)popViewControllerWithCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype {
    
    // Adding Custom animations in popping a ViewController
    switch (transition) {
        case CustomViewAnimationTransitionNone:{
            
            // Default Transition Case
            [self standardAnimationWithController:nil duration:0.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromLeft:{
            
            // Flip From Left Transition
            [self standardAnimationWithController:nil duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromRight:{
            // Flip From Right Transition
            [self standardAnimationWithController:nil duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlUp:{
            // Curl Up Transition
            [self standardAnimationWithController:nil duration:0.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlDown:{
            // Curl Down Transition
            [self standardAnimationWithController:nil duration:0.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFadeIn:{
            // Fading Transition
            [self coreAnimationWithController:nil duration:0.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionMoveIn:{
            // Move In Transition
            [self coreAnimationWithController:nil duration:0.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionPush:{
            // Sliding Transition
            [self coreAnimationWithController:nil duration:0.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionReveal:{
            // Reveal View Type Transition
            [self coreAnimationWithController:nil duration:0.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}
- (void)popToRootViewControllerWithCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype {
    
    // Adding Custom animations in popping to RootViewController
    
    switch (transition) {
            // Default Transition Case
        case CustomViewAnimationTransitionNone:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromLeft:{
            // Flip From Left Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromRight:{
            // Flip From Right Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlUp:{
            // Curl Up Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlDown:{
            // Curl Down Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFadeIn:{
            // Fading Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionMoveIn:{
            // Move In Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionPush:{
            // Sliding Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionReveal:{
            // Reveal View Type Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}

- (void)popToViewController:(UIViewController *)viewController withCustomTransition:(CustomViewAnimationTransition)transition subtype:(NSString*)subtype {
    // Adding Custom animations in popping to particular ViewController
    switch (transition) {
        case CustomViewAnimationTransitionNone:{
            // Default Transition Case
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromLeft:{
            // Flip From Left Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFlipFromRight:{
            // Flip From Right Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlUp:{
            // Curl Up Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionCurlDown:{
            // Curl Down Transition
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case CustomViewAnimationTransitionFadeIn:{
            // Fading Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionMoveIn:{
            // Move In Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionPush:{
            // Sliding Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        case CustomViewAnimationTransitionReveal:{
            // Reveal View Type Transition
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}

#pragma mark -
#pragma mark private
- (void)standardAnimationWithController:(UIViewController*)viewController
                               duration:(NSTimeInterval)duration
                                options:(UIViewAnimationOptions)options
                           changesBlock:(void (^)(void))block {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView transitionWithView:self.view duration:duration options:options animations:block completion:NULL];
    [UIView commitAnimations];
}

- (void)coreAnimationWithController:(UIViewController*)viewController
                           duration:(NSTimeInterval)duration
                               type:(NSString*)type
                            subtype:(NSString*)subtype
                       changesBlock:(void (^)(void))block {
    CATransition* trans = [CATransition animation];
    [trans setDuration:duration];
    [trans setType:type];
    [trans setSubtype:subtype];
    [self.view.layer addAnimation:trans forKey:kCATransition];
    block();
}
@end
