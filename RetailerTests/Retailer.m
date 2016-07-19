//
//  Retailer.m
//  Retailer
//
//  Created by MOHIT MATHUR on 11/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ProductDetailViewController+Testing.h"
#import "MyCartViewController+Testing.h"
#import "HomeViewController.h"
#import <UIKit/UIKit.h>
#import "Product.h"


@interface Retailer : XCTestCase

@property(strong,nonatomic)ProductDetailViewController *prodDetail ;
@property(strong,nonatomic)MyCartViewController *cart ;

@end

@implementation Retailer
@synthesize prodDetail,cart;

- (void)setUp {
    [super setUp];
   //setting up dummy product
    prodDetail = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    cart = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyCartViewController"];
    Product *testProduct=[[Product alloc]init];
    testProduct.productId=@"10";
    testProduct.productName=@"MicroWave Oven";
    testProduct.productDescription=@"asdffs dgdg dgd gdfg dgd gdfg dg g g gd gd gdg g g gg g g g g g ";
    testProduct.productImage=@"MicrowaveSmall";
    testProduct.productImageLarge=@"MicrowaveLarge";
    testProduct.price=15000;
    
    prodDetail.detailProduct=testProduct;
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testAddToCart{
    //Testing Add to Cart
    [prodDetail addToCart:nil];
    [CommonFunctions getProductCount];
    
}

-(void)testDeleteCart{
    //Testing Delete from cart
    [cart deleteProduct:nil];
    [CommonFunctions getProductCount];
}
@end
