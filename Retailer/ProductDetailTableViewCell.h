//
//  ProductDetailTableViewCell.h
//  Retailer
//
//  Created by MOHIT MATHUR on 08/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgProductDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblProductPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblProductDescription;

@end
