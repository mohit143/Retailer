//
//  MyCartViewController.m
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "MyCartViewController.h"

@interface MyCartViewController ()

@end

@implementation MyCartViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    btnContinueShopping.layer.cornerRadius=5.0;
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectZero];
    tblCart.tableFooterView=footerView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //Call to fetch Custom Objects from Archived Objects saved in NSUserDefaults
    [CommonFunctions unArchiveData];
    [tblCart reloadData];
}


#pragma mark - IBActions

- (IBAction)continueShopping:(id)sender {
    //Take to Home
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)deleteProduct:(id)sender {
    //Deletion Method
    
    //Getting the tapped row and cell from the table
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tblCart];
    NSIndexPath *clickedIndexPath = [tblCart indexPathForRowAtPoint:buttonPosition];
    MyCartTableViewCell *cell = (MyCartTableViewCell*)[tblCart cellForRowAtIndexPath:clickedIndexPath];
    
    //Getting object to delete based on tapped row
    Product *myProduct= [[appDel arrSavedProducts] objectAtIndex:clickedIndexPath.row];
    //Deletion Animation
    UIImageView *img=[[UIImageView alloc] init];
    img.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",myProduct.productImage]];
    img.frame=CGRectMake(cell.contentView.frame.origin.x+20, cell.contentView.frame.origin.y+40, 30, 30);
    img.layer.cornerRadius = 15.0;
    img.layer.masksToBounds = YES;
    [cell.backView addSubview:img];
    
    [UIView animateWithDuration:1.0 delay:0.0 options:NO animations:^{
        
        img.center=cell.btnDelete.center;
    } completion:^(BOOL finished)
     {
         
         [img removeFromSuperview];
         
         //Removing Product from list
         [[appDel arrSavedProducts] removeObjectAtIndex:clickedIndexPath.row];
         
         //Updating Product List in persistant storage
         [CommonFunctions archiveData:[appDel arrSavedProducts]];
         //Getting New Product Count
         [CommonFunctions getProductCount];
         [tblCart reloadData];
         // Call to calculate the updated amount
         [CommonFunctions unArchiveData];
         if ([appDel arrSavedProducts].count==0) {
             tblCart.hidden=YES;
             noCartView.hidden=NO;
         }
         else{
             noCartView.hidden=YES;
             tblCart.hidden=NO;
         }
         
         
     }];
    [UIView commitAnimations];
    
    
}

- (IBAction)goBack:(id)sender
{
    //Move to previous Page
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - TableView delegates and dataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [appDel arrSavedProducts].count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Fetching object on the basis of indexpath
    Product *cartProduct=[[appDel arrSavedProducts] objectAtIndex:indexPath.row];
    
    //Setting cell Properties
    MyCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCartTableViewCell"];
    cell.imgProduct.image=[UIImage imageNamed:cartProduct.productImage];
    cell.lblProductName.text=cartProduct.productName;
    cell.lblPrice.text=[NSString stringWithFormat:@"Price: Rs %.0f",cartProduct.price];
    cell.lblQuantity.text=[NSString stringWithFormat:@"Quantity: %d",cartProduct.productQuantity];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Moving to the Detail Page
    ProductDetailViewController *productDetail=[self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    
    NSDictionary *myDict=[CommonFunctions checkController:productDetail withNavigation:self.navigationController];
    
    
    if ([[myDict objectForKey:KEY_IS_AVAILABLE] integerValue]==1) {
        productDetail=[myDict objectForKey:KEY_MY_CONTROLLER];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else{
        
        [self.navigationController pushViewController:productDetail animated:YES];
        
    }
    //Passing the Clicked Product to detail Page
    productDetail.detailProduct=[[appDel arrSavedProducts] objectAtIndex:indexPath.row];
    
}


@end
