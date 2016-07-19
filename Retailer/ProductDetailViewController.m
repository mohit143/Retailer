//
//  ProductDetailViewController.m
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

@synthesize detailProduct;

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    btnCart.layer.cornerRadius=5.0;
    tblProductDetail.estimatedRowHeight=50;
    //Reload Table
    [tblProductDetail reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    tblProductDetail.estimatedRowHeight=50;
    //Reload Table
    [tblProductDetail reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)addToCart:(id)sender {
    //Adding Product to Cart
    ProductDetailTableViewCell *cell = [tblProductDetail cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    // Call to calculate the updated amount
    [CommonFunctions unArchiveData];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"productId=%@",detailProduct.productId];
    
    NSArray *filteredArray = [[appDel arrSavedProducts] filteredArrayUsingPredicate: predicate];
    
    if (filteredArray.count!=0)
    {
        //Increase Quantity of already present product in cart
        Product *myProduct=(Product*)[filteredArray objectAtIndex:0];
        myProduct.productQuantity = myProduct.productQuantity+1;
        myProduct.productTotalPrice=[NSString stringWithFormat:@"%.2f",myProduct.productQuantity*myProduct.price];
        
    }
    else
    {
        //Add new product to cart
        Product *newProduct=[[Product alloc]initWithObject:detailProduct];
        newProduct.productQuantity = newProduct.productQuantity+1;
        
        newProduct.productTotalPrice=[NSString stringWithFormat:@"%.2f",newProduct.productQuantity*newProduct.price];
        
        [[appDel arrSavedProducts] addObject:newProduct];
    }
    
    //Updating Product List in persistant storage

    [CommonFunctions archiveData:[appDel arrSavedProducts]];
    
    //Add to cart Animation

    UIImageView *img=[[UIImageView alloc] init];
    img.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",detailProduct.productImage]];
    img.frame=CGRectMake(cell.imgProductDetail.center.x, cell.imgProductDetail.center.y, 30, 30);
    img.layer.cornerRadius = 15.0;
    img.layer.masksToBounds = YES;
    [self.view addSubview:img];
    
    [UIView animateWithDuration:1.0 delay:0.0 options:NO animations:^{
        img.center=[[appDel btnCart] superview].center;
        
    } completion:^(BOOL finished)
     {
         [img removeFromSuperview];
         
         //Getting New Product Count
         [CommonFunctions getProductCount];
          // Call to calculate the updated amount
         [CommonFunctions unArchiveData];
         
         
     }];
    [UIView commitAnimations];
    
}

- (IBAction)goBack:(id)sender {
    //Taking back to Home Screen
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - TableView delegates and dataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier;
    if (indexPath.row==0) {
        cellIdentifier=@"ProductDetailImage";
    }
    else if (indexPath.row==1) {
        cellIdentifier=@"ProductDetailPrice";
    }
    else if (indexPath.row==2) {
        cellIdentifier=@"ProductDetailDescription";
    }
    
    ProductDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //Setting cell Properties
    cell.imgProductDetail.image=[UIImage imageNamed:detailProduct.productImageLarge];
    cell.lblProductName.text=detailProduct.productName;
    cell.lblProductPrice.text=[NSString stringWithFormat:@"Price: Rs %.0f",detailProduct.price];
    cell.lblProductDescription.text=[NSString stringWithFormat:@"Description: %@",detailProduct.productDescription];;
    
    return cell;
}

@end
