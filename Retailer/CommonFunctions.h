//
//  CommonFunctions.h
//  Retailer
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Product.h"
#import "macros.h"
#import "AppDelegate.h"

@interface CommonFunctions : NSObject


+ (void)archiveData:(NSMutableArray *)arr;
+ (void)unArchiveData;
+ (void)getProductCount;
+ (NSDictionary *)checkController:(UIViewController *)myController withNavigation:(UINavigationController *)mainNavigation;
+ (void) displayAlert: (NSString *)messageString;

@end
