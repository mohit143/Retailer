//
//  MyCartViewController.h
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCartTableViewCell.h"
#import "AppDelegate.h"
#import "Product.h"
#import "CommonFunctions.h"
#import "ProductDetailViewController.h"
#import "HomeViewController.h"

@interface MyCartViewController : UIViewController{
    
    __weak IBOutlet UITableView *tblCart;
    
    __weak IBOutlet UIView *noCartView;
    __weak IBOutlet UIButton *btnContinueShopping;
}

@end
