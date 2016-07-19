//
//  CategoryCollectionViewCell.m
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

#pragma mark - Collection View Cell Methods

-(void)setCollectionViewDataSourceDelegate:(id<UITableViewDataSource, UITableViewDelegate>)dataSourceDelegate index:(NSInteger)index
{
    //Setting Tableview Delegates and Reloading Table
    self.tblProductList.dataSource = dataSourceDelegate;
    self.tblProductList.delegate = dataSourceDelegate;
    self.tblProductList.tag = index;
    
    [self.tblProductList reloadData];
}

@end
