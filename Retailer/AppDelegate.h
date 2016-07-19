//
//  AppDelegate.h
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCartViewController.h"
#import "UINavigationController+UINavigationController_CustomAnimation.h"
#import "CommonFunctions.h"
#define appDel (AppDelegate*)[[UIApplication sharedApplication] delegate]


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)UILabel *lblTotalAmount;
@property (strong, nonatomic)UILabel *lblCartCount;
@property (strong, nonatomic)NSMutableArray *arrSavedProducts;
@property (strong, nonatomic)UIButton *btnCart;

@end

