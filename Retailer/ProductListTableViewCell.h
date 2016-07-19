//
//  ProductListTableViewCell.h
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgProduct;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *lblProductPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;

@end
