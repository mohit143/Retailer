//
//  CategoryCollectionViewCell.h
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UITableView *tblProductList;

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate index:(NSInteger)index;

@end
