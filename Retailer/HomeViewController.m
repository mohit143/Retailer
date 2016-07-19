//
//  HomeViewController.m
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    UIView *footerView;
}
@end

@implementation HomeViewController


#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    footerView=[[UIView alloc]initWithFrame:CGRectZero];
    
    //Initialisation of Arrays
    searchArray=[NSMutableArray new];
    arrMain=[[NSMutableArray alloc]init];
    arrFurnitures=[[NSMutableArray alloc]init];
    arrElectronics=[[NSMutableArray alloc]init];
    
    btnCancel.layer.cornerRadius=5.0;
    //Adding Values to Arrays
    NSArray *arrElectronicsImageNames = [NSArray arrayWithObjects:@"MicrowaveSmall", @"TelevisionSmall", @"VacuumCleanerSmall",@"MicrowaveLarge", @"TelivisionLarge", @"VacuumCleanerLarge", nil];
    NSArray *arrFurnitureImageNames = [NSArray arrayWithObjects:@"TableSmall", @"ChairSmall", @"AlmirahSmall",@"TableLarge", @"ChairLarge", @"AlmirahLarge", nil];
    NSArray *arrElectronicsNames = [NSArray arrayWithObjects:@"Microwave Oven", @"Television", @"Vacuum Cleaner", nil];
    NSArray *arrFurnitureNames = [NSArray arrayWithObjects:@"Table", @"Chair", @"Almirah", nil];
    NSArray *arrElectronicsPrices = [NSArray arrayWithObjects:@"5465", @"20000", @"3000", nil];
    NSArray *arrFurniturePrices = [NSArray arrayWithObjects:@"1200", @"550", @"2500", nil];
    NSArray *arrElectronicsDescription = [NSArray arrayWithObjects:@"Cook your food the healthy way with the LG 20 Litres MH2044DB grill microwave oven. It features quartz heater, intellowave technology, 245 mm turntable diameter, anti-bacterial cavity and energy saving technology, which makes it an efficient cooking tool. You can perform simple tasks such as heating soup, cooking jacket potatoes, baking cake, heating up a ready meal or defrosting or reheating food and even roast or brown food. Model No. : MH2044DB Colour : Black Body Material : Anti bacterial cavity Cooking Menus : Auto cook menu - 52, Indian auto cook menu - 35 Cavity Type (inside Finish) : Anti bacterial cavity Display Type : LED Safety Features : Child lock Technology : Intellowave technology Microwave Wattage : 700 W Grill Wattage : 980 W Microwave Frequency : 2450 MHZ Control Type : Membrane Accessories : High rack Installation And Demo : Installation and demo is provided free of cost. Kindly call the toll-free customer care number for LG at 1800 180 9999 to schedule a demo of your Microwave Oven. You shall provide details of the purchased model during the call. Post that, you will receive a call from the brand authorized service engineer to schedule a mutually convenient time to provide demo and installation at your doorstep. The installation and demo is usually done within 2 business days of delivery of your Microwave Oven. Kindly contact us on 1800 208 9898 for any further queries. Power Levels : 5 Power Consumption : 980 W Turntable Diameter : 245 mm Dimensions : 455 mm x 260 mm x 340 mm Package Contents : 1 Microwave oven, Glass turn table, Roller ring, High rack, User manual with Warranty card Warranty : 1 Year warranty", @"Bring home the smart LED 46.99 cm (18.5) monitor TV from LG and enjoy a new experience of watching your favourite TV shows, movies and sports programmes. This globally recognised brand has manufactured this monitor with latest feature that enables the user to get a lively feel of watching various programmes. This affordable and efficient monitor comes with a number of attractive features. Smart Design This electronic product from LG offers a smart 46.99 cm (18.5) screen with a special fast response time of 5ms. This feature offers a different level of watching your favourite tv programmes and sports telecasts. Along with this, the slim screen makes sure that the user can get a new concept of gaming. Along with this, the user can enjoy a strain free experience of watching movies or playing games due to the presence of consistent response. If you are watching news and want to read the displayed information from the screen, then optimal condition helps you to read the information for long hours. If you need a full screen view to get a comfortable reading of information, then with a single touch of a button you can change the screen mode. Saves energy In spite of offering these attractive features, it consumes a nominal energy and helps the user to save more on the electricity bill without compromising the quality. If you are looking for a monitor, that is easy on the eyes, for your professional and personal usage, then buy LG LED 46.99 cm (18.5) monitor online. Special features The 46.99 cm (18.5) monitor offers a smart display of the sports telecasts, TV programmes and gaming The LED flat screen with latest technology helps you to enjoy a eye strain free viewing experience Optimal display offers the user to read information on the full screen, clearly", @"The Eureka Forbes Trendy Nano vacuum cleaner has been designed to help you clean your home quickly and efficiently. This 1000 Watt vacuum cleaner has an attractive, ultramodern design that will stand out no matter where you keep it. What's more, this Eureka Forbes vacuum cleaner has an automatic thermal load cut-out that protects it from overheating, thus making it safe for daily use. With a lightweight design that weighs in at 2.5kg, the Trendy vacuum cleaner from Eureka Forbes is an excellent device for your home or office. The Eureka Forbes handheld vacuum cleaner features a whole host of accessories that simplify your cleaning process. For starters, it has a floor and carpet brush that removes dirt from hard floors and carpets. It also includes a dual purpose brush and nozzle that helps you get into cracks and crevices as well as helps you to easily clean softer fabrics. Thanks to the flexible hose and extension tubes, which are provided with the Trendy Nano Vacuum Cleaner from Eureka Forbes, you can easily target hard to reach spots.", nil];
    NSArray *arrFurnitureDescription = [NSArray arrayWithObjects:@"Kams Brands is a world class manufacturer and dealer of fine furniture and home decor products. The brand deals in high end brands that are dealing in furnishings that not only add that extra bit of glamour and oomph to your surroundings, but also make them look classy and different. Wit out of the box ideas and inspirations from various parts of the country, the brand offers some of the most exclusive and innovative variety of products that can beautify any space.", @"Modern Furniture reflects the design philosophy of form following function prevalent in modernism. These designs represent the ideals of cutting excess, practicality and an absence of decoration.Every 5 minutes, an item of Furniture sells on Pepperfry.com.Furniture bought on Pepperfry.com is shipped for free, we also offer you a 7-Day Easy Return window. So go ahead and buy with confidence", @"In its carefully crafted details, ethnic furniture takes you back to a different era of living; your house becomes a home with furniture that transcends generations. Influenced by ethnic art and literature, this style of furniture is designed to balance design with the practicality that your home demands.Furniture bought on Pepperfry.com is shipped for free and comes with a 1 Year Warranty against any manufacturing defects. We also offer you a 7-Day Easy Return window. So go ahead and buy with confidence.", nil];
    
    //Creating Electronics and Furniture Objects
    for (int i=0; i<3; i++) {
        
        Product *electonic=[[Product alloc]init];
        Product *furniture=[[Product alloc]init];
        
        electonic.productId = [NSString stringWithFormat:@"%d",10+i];
        electonic.productImage=[arrElectronicsImageNames objectAtIndex:i];
        electonic.productImageLarge=[arrElectronicsImageNames objectAtIndex:i+3];
        electonic.productDescription=[arrElectronicsDescription objectAtIndex:i];
        electonic.productName=[arrElectronicsNames objectAtIndex:i];
        electonic.price=[[arrElectronicsPrices objectAtIndex:i] integerValue];
//        [furniture setValue:@"productId" forKey:@"10"];
        furniture.productId = [NSString stringWithFormat:@"%d",20+i];
        furniture.productImageLarge=[arrFurnitureImageNames objectAtIndex:i+3];
        furniture.productImage=[arrFurnitureImageNames objectAtIndex:i];
        furniture.productName=[arrFurnitureNames objectAtIndex:i];
        furniture.productDescription=[arrFurnitureDescription objectAtIndex:i];
        furniture.price=[[arrFurniturePrices objectAtIndex:i] integerValue];
        
        [arrElectronics addObject:electonic];
        [arrFurnitures addObject:furniture];
        
    }
    
    [categoryCollectionView reloadData];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Call to get the updated count of all the product purchased
    [CommonFunctions performSelector:@selector(getProductCount) withObject:nil afterDelay:0.2];
    
    //Call to get all the custom objects from archived objects saved in NSUserDefaults
    [CommonFunctions performSelector:@selector(unArchiveData) withObject:nil afterDelay:0.1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Methods

-(void)switchTabs:(UIColor *)lblElectronicColor andFurnitureColor:(UIColor *)lblFurnitureColor{
    
    //Changing label text and color on tab switching
    lblElectronics.textColor=lblElectronicColor;
    lblFurnitures.textColor=lblFurnitureColor;
    
}

#pragma mark - UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize retval;
    retval= CGSizeMake(self.view.frame.size.width, categoryCollectionView.frame.size.height);
    return retval;
    
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(CategoryCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell setCollectionViewDataSourceDelegate:self index:indexPath.item];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
    cell.tblProductList.tableFooterView=footerView;
    
    if (indexPath.item==0) {
        arrMain=arrElectronics;
        //Call to Change label text and color on tab switching
        [self switchTabs:[UIColor colorWithRed:250.0/255.0 green:76.0/255.0 blue:0.0/255.0 alpha:1.0] andFurnitureColor:[UIColor lightGrayColor]];
        
        
        
    }
    else if (indexPath.item==1){
        arrMain=arrFurnitures;
        //Call to Change label text and color on tab switching
        [self switchTabs:[UIColor lightGrayColor] andFurnitureColor:[UIColor colorWithRed:250.0/255.0 green:76.0/255.0 blue:0.0/255.0 alpha:1.0]];
        
    }
    
    switchIndex=indexPath.item;
    
    return cell;
    
    
    
    
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Moving to the Detail Page
    
    ProductDetailViewController *productDetail=[self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    [self.navigationController pushViewController:productDetail animated:YES];
    
    
}


#pragma mark - TableView delegates and dataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (switchIndex==0) {
        return arrElectronics.count;
    }
    else{
        return arrFurnitures.count;
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Product *myProduct;
    
    if (isSearch) {
        myProduct=[searchArray objectAtIndex:indexPath.row];
        
    }
    else{
        myProduct=[arrMain objectAtIndex:indexPath.row];
        
    }
    ProductListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductListTableViewCell"];
    //Setting Cell Properties
    
    cell.imgProduct.image=[UIImage imageNamed:myProduct.productImage];
    cell.lblProductName.text=myProduct.productName;
    cell.lblProductPrice.text=[NSString stringWithFormat:@"Rs %.0f",myProduct.price];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Moving to the Detail Page
    
    ProductDetailViewController *productDetail=[self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    productDetail.detailProduct=[arrMain objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:productDetail animated:YES];
    
}



#pragma mark - IBActions

- (IBAction)switchCategory:(id)sender {
    
    //Switch Between Electronics and Furniture
    
    [categoryCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:[sender tag]-1000 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}
@end
