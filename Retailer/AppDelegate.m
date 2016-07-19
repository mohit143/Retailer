//
//  AppDelegate.m
//  Retailer
//
//  Created by MOHIT MATHUR on 07/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize lblTotalAmount,lblCartCount,arrSavedProducts,btnCart;


#pragma mark - Application LifeCycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Initializing array
    arrSavedProducts=[[NSMutableArray alloc]init];
    
    //Call to create the bottom Cart View
    [self performSelector:@selector(createCartView) withObject:nil afterDelay:0.1];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Selectors

-(void)openCart:(id)sender{
    
    //Moving to Cart Page
    
    UINavigationController *mainNavigation=(UINavigationController *)[[appDel window] rootViewController];
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyCartViewController *myCart=[mainStoryBoard instantiateViewControllerWithIdentifier:@"MyCartViewController"];
    NSDictionary *myDict=[CommonFunctions checkController:myCart withNavigation:mainNavigation];
    
    
    if ([[myDict objectForKey:KEY_IS_AVAILABLE] integerValue]==1) {
        
        myCart=[myDict objectForKey:KEY_MY_CONTROLLER];
        
        [mainNavigation popViewControllerWithCustomTransition:CustomViewAnimationTransitionPush subtype:kCATransitionFromBottom];
        
    }
    else{
        if (arrSavedProducts.count==0) {
            [CommonFunctions displayAlert:@"Hey! Looks like you have not added any product in the cart."];
            return;
        }
        [mainNavigation pushViewController:myCart withCustomTransition:CustomViewAnimationTransitionPush subtype:kCATransitionFromTop];
        
    }
    
    
    
    
    
}

#pragma mark - Private Methods

-(void)createCartView
{
    // creating the bottom Cart View
    btnCart =[[UIButton alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width/2)-15,10,30,30)];
    [btnCart setImage:[UIImage imageNamed:@"Cart"] forState:UIControlStateNormal];
    btnCart.layer.cornerRadius=2.0;
    
    [btnCart setContentMode:UIViewContentModeScaleAspectFit];
    [btnCart addTarget:self action:@selector(openCart:) forControlEvents:UIControlEventTouchUpInside];
    
    lblTotalAmount=[[UILabel alloc]initWithFrame:CGRectMake(10,15,btnCart.frame.origin.x-20-10,21)];
    lblTotalAmount.text=@"Total: Rs";
    
    lblTotalAmount.textColor=[UIColor blackColor];
    lblTotalAmount.backgroundColor=[UIColor clearColor];
    
    lblTotalAmount.font=[UIFont boldSystemFontOfSize:14.0];
    lblTotalAmount.hidden=YES;
    
    lblCartCount=[[UILabel alloc]initWithFrame:CGRectMake(btnCart.frame.origin.x + btnCart.frame.size.width - 13,4,20,20)];
    lblCartCount.hidden=YES;
    lblCartCount.backgroundColor=[UIColor whiteColor];
    lblCartCount.clipsToBounds=YES;
    lblCartCount.layer.cornerRadius=lblCartCount.frame.size.height/2;
    lblCartCount.text=@"";
    lblCartCount.textColor=[UIColor colorWithRed:232.0/255.0 green:81.0/255.0 blue:28.0/255.0 alpha:1.0];
    lblCartCount.font=[UIFont boldSystemFontOfSize:10.0];
    lblCartCount.textAlignment=NSTextAlignmentCenter;
    UIView *cartView=[[UIView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-50,[UIScreen mainScreen].bounds.size.width,50)];
    
    cartView.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:81.0/255.0 blue:28.0/255.0 alpha:1.0];
    
    [cartView addSubview:btnCart];
    [cartView addSubview:lblTotalAmount];
    [cartView addSubview:lblCartCount];
    [self.window addSubview:cartView];
    
    cartView.clipsToBounds=YES;
    
}
@end
