//
//  ProductDetailViewController.h
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "ProductDetailTableViewCell.h"
#import "ProductDetailViewController.h"
#import "macros.h"
#import "AppDelegate.h"
#import "CommonFunctions.h"

@interface ProductDetailViewController : UIViewController{
    
    __weak IBOutlet UIButton *btnCart;
    
    __weak IBOutlet UITableView *tblProductDetail;
}

@property(strong,nonatomic)Product *detailProduct;
@end
