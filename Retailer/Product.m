//
//  Product.m
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "Product.h"

@implementation Product

#pragma mark - Custom Object Encoding, Decoding

- (id)init {
    self = [super init];
    if (self) {
       //Initialising Product Object
        self.productId =@"";
        self.productImage =@"";
        self.productName = @"";
        self.productTotalPrice = @"";
        self.productQuantity = 0;
        self.price = 0;
        self.productImageLarge =@"";
        self.productDescription =@"";
        
    }
    return self;
}

- (id)initWithObject:(Product*)object {
    //Copying Object
    self = [super init];
    if (self) {
        self.productId = object.productId;
        self.productImage = object.productImage;
        self.productName = object.productName;
        self.price = object.price;
        self.productImageLarge = object.productImageLarge;
        self.productDescription = object.productDescription;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    //Encoding Custom Object
    [encoder encodeObject:self.productId forKey:@"productId"];
    [encoder encodeObject:self.productImage forKey:@"productImage"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f",self.price] forKey:@"price"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d",self.productQuantity] forKey:@"productQuantity"];
    [encoder encodeObject:self.productTotalPrice forKey:@"productTotalPrice"];
    [encoder encodeObject:self.productDescription forKey:@"productDescription"];
    [encoder encodeObject:self.productImageLarge forKey:@"productImageLarge"];
    [encoder encodeObject:self.productName forKey:@"productName"];
    
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init]))
    {
        //Decoding Custom Object
        self.productName = [decoder decodeObjectForKey:@"productName"];
        self.productImageLarge = [decoder decodeObjectForKey:@"productImageLarge"];
        self.productTotalPrice = [decoder decodeObjectForKey:@"productTotalPrice"];
        self.productDescription = [decoder decodeObjectForKey:@"productDescription"];
        self.productId = [decoder decodeObjectForKey:@"productId"];
        self.price = [[decoder decodeObjectForKey:@"price"] floatValue];
        self.productImage = [decoder decodeObjectForKey:@"productImage"];
        
        self.productQuantity = [[decoder decodeObjectForKey:@"productQuantity"] intValue];
        
    }
    return self;
}

-(void)setValue:(NSString *)key withValue:(NSString *)value{
    
    key=value;
    
    
}
@end
