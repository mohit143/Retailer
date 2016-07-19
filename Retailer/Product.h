//
//  Product.h
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject{
//    NSString *productId;
}

//Declaring Product Object Attributes{

@property(strong,nonatomic)NSString *productImage;
@property(strong,nonatomic)NSString *productImageLarge;
@property(strong,nonatomic)NSString *productDescription;
@property(strong,nonatomic)NSString *productName;
@property(strong,nonatomic)NSString *productTotalPrice;
@property(strong,nonatomic)NSString *productId;
@property(nonatomic)int productQuantity;
@property(nonatomic)float price;

- (id)initWithObject:(Product*)object;
-(void)setValue:(NSString *)key withValue:(NSString *)value;



@end
