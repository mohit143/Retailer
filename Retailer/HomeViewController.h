//
//  HomeViewController.h
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Product.h"
#import "macros.h"
#import "CategoryCollectionViewCell.h"
#import "ProductDetailViewController.h"
#import "ProductListTableViewCell.h"
#import "CommonFunctions.h"


@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    
    __weak IBOutlet UICollectionView *categoryCollectionView;
    __weak IBOutlet UILabel *lblFurnitures;
    __weak IBOutlet UIImageView *imgFurnitures;
    __weak IBOutlet UILabel *lblElectronics;
    __weak IBOutlet UIImageView *imgElectronics;
    __weak IBOutlet UIButton *btnCancel;
    __weak IBOutlet UITextField *txtSearchProduct;
    
    BOOL isSearch;
    NSInteger switchIndex;
    NSMutableArray *arrMain;
    NSMutableArray *arrFurnitures;
    NSMutableArray *arrElectronics;
    NSMutableArray *searchArray;
    
}


@end
