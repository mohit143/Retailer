//
//  CommonFunctions.m
//  Retailer
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "CommonFunctions.h"

@implementation CommonFunctions

#pragma mark - Persistant Data Storage

+(void)archiveData:(NSMutableArray *)arrAllProducts{
    
    NSMutableArray *archiveArray = [NSMutableArray arrayWithCapacity:arrAllProducts.count];
    
    //Converting Custom Objects to Archived Objects
    
    for (Product *myProduct in arrAllProducts)
    {
        NSData *personEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:myProduct];
        [archiveArray addObject:personEncodedObject];
    }
    
    //Saving Archived Objects to NSUserDefaults
    
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
    [userData setObject:archiveArray forKey:KEY_SAVED_PRODUCTS];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
+(void)unArchiveData
{
    //Fething Archived Objects from NSUserDefaults
    
    NSArray *allProducts = [[NSUserDefaults standardUserDefaults] objectForKey:KEY_SAVED_PRODUCTS];
    
    [[appDel arrSavedProducts] removeAllObjects];
    
    
    //Converting Archived Objects to Custom Objects
    for( NSData *dataItem in allProducts )
    {
        Product *myProduct = (Product *) [NSKeyedUnarchiver unarchiveObjectWithData:dataItem];
        [[appDel arrSavedProducts] addObject:myProduct];
    }
    //Call to calculate total amount of all products purchased
    [self calculateTotalAmount];
}


+(void)getProductCount{
    
    //Getting Count of all products purchased
    
    NSMutableArray *arrSavedProducts = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:KEY_SAVED_PRODUCTS]];
    if (arrSavedProducts.count>0) {
        // Showing products count on cart label
        [appDel lblCartCount].text=[NSString stringWithFormat:@"%ld",(unsigned long)arrSavedProducts.count];
        NSLog(@"Cart Count=%ld",(unsigned long)arrSavedProducts.count);
        [appDel lblCartCount].hidden=NO;
        
    }
    else{
        [appDel lblCartCount].hidden=YES;
    }
    
}

+(NSDictionary *)checkController:(UIViewController *)myController withNavigation:(UINavigationController *)mainNavigation{
    //Checking whether a ViewController is already present in navigation controller array
    NSDictionary *returnDict;
    for (UIViewController *viewClass  in  mainNavigation.viewControllers)
    {
        if ([viewClass isKindOfClass:[myController class]])
        {
            myController=viewClass;
            returnDict=@{KEY_MY_CONTROLLER : myController,
                         KEY_IS_AVAILABLE : @"1"};
            break;
        }
        else{
            
            returnDict=@{KEY_MY_CONTROLLER : myController,
                         KEY_IS_AVAILABLE : @"0"};
            
        }
        
    }
    return returnDict;
}

+(void)calculateTotalAmount{
    //Calculating total amount of all the products purchased by user
    float totAmount=0;
    for (Product *myProduct in [appDel arrSavedProducts]) {
        totAmount=totAmount+[myProduct.productTotalPrice floatValue];
        
    }
    
    if (totAmount>0) {
        // Setting total amount on the amount label
        [appDel lblTotalAmount].text=[NSString stringWithFormat:@"Total: Rs %.0f",totAmount];
        [appDel lblTotalAmount].hidden=NO;
        
    }
    else{
        [appDel lblTotalAmount].hidden=YES;

    }
}

#pragma mark - Alert method

+(void) displayAlert: (NSString *)messageString
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Retailer" message:messageString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
@end
