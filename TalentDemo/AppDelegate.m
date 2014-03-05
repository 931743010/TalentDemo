//
//  AppDelegate.m
//  TalentDemo
//
//  Created by shenjx on 14-3-1.
//  Copyright (c) 2014年 shenjiaxiong. All rights reserved.
//

#import "AppDelegate.h"
#import "TalentViewController.h"
#import "UtilsMacro.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self appearanceCustomization];
    TalentViewController *talentVC = [[TalentViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:talentVC];
    self.window.rootViewController = nav;
    return YES;
}

#pragma mark -
#pragma mark UI设置
-(void)appearanceCustomization
{
    id appearance;
    //UINavigationBar
    appearance = [UINavigationBar appearance];
    {

        if (systemNewerThan7){
            [appearance setBarTintColor:RGB(64, 177, 194)];
        }
        else
        {
            UIImage *img = [[UIImage imageNamed:@"navbarback.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) ];
            [appearance setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
        }
        

    }
    /*
    //UIToolbar
    appearance = [UIToolbar appearance];
    {
        //        if (systemOlderThan7) {
        UIImage *img = [[UIImage imageNamed:@"bgNavBar.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:1];
        [appearance setBackgroundImage:img forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        
        [appearance setBackgroundColor:[UIColor redColor]];
        //        }
    }
    
    //UIBarButtonItem
    appearance = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
    //[appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, 0) forBarMetrics:UIBarMetricsDefault];
    {
        [appearance setBackgroundImage:[UIImage imageNamed:@"nilImage.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault
         ];
        
        dic = @{
                UITextAttributeTextColor: [UIColor whiteColor]
                ,UITextAttributeFont: [self SDFontWithFamilyName:@"Oriya Sangam MN" size:16.0f]
                ,UITextAttributeTextShadowColor : [UIColor clearColor]
                };
        
        [appearance setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        if (systemOlderThan7) {
            UIImage *img = [UIImage imageNamed:@"back_.png"];
            UIImage *img0 = [img resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0) resizingMode:UIImageResizingModeStretch];
            UIImage *img1 = [[img imageWithGradientTintColor:[UIColor grayColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0) resizingMode:UIImageResizingModeStretch];
            [appearance setBackButtonBackgroundImage:img0 forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [appearance setBackButtonBackgroundImage:img1 forState:1 barMetrics:UIBarMetricsDefault];
            [appearance setBackButtonBackgroundImage:img1 forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        }
        
    }
    
    appearance = [UIBarButtonItem appearanceWhenContainedIn:[UIToolbar class], nil];
    {
        [appearance setBackgroundImage:[UIImage imageNamed:@"nilImage.png"]
                              forState:UIControlStateNormal
                            barMetrics:UIBarMetricsDefault
         ];
        
        dic = @{
                UITextAttributeTextColor: [UIColor whiteColor]
                ,UITextAttributeFont: [self SDFontWithFamilyName:@"Oriya Sangam MN" size:16.0f]
                ,UITextAttributeTextShadowColor : [UIColor clearColor]
                };
        
        [appearance setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        //        dic = @{
        //                UITextAttributeTextColor: ColorWithRGB(210, 210, 210)
        //                ,UITextAttributeFont: [self SDFontWithFamilyName:@"Oriya Sangam MN" size:16.0f]
        //                ,UITextAttributeTextShadowColor : [UIColor clearColor]
        //                };
        //        [appearance setTitleTextAttributes:dic forState:1];
        
        if (systemOlderThan7) {
            UIImage *img = [[UIImage imageNamed:@"btnNavBack.png"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
            [appearance setBackButtonBackgroundImage:img forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [appearance setBackButtonBackgroundImage:img forState:1 barMetrics:UIBarMetricsDefault];
            
            //            [appearance setBackgroundColor:[UIColor blueColor]];
            //            [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 0) forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    //UITabBar
    appearance = [UITabBar appearance];
    {
        UIImage *img = [[UIImage imageNamed:@"bgBottomBar.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:1];
        [appearance setBackgroundImage:img];
        [appearance setBackgroundColor:ColorWithRGB(249, 249, 249)];
    }
    
    //UITabBarItem
    appearance = [UITabBarItem appearance];
    {
        UIFont *font = [self SDFontWithFamilyName:@"SinhalaSangamMN" size:10.0f];
        
        dic = @{
                UITextAttributeTextColor:ColorWithRGB(172, 172, 172),
                UITextAttributeFont:font
                };
        
        [appearance setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        dic = [NSDictionary dictionaryWithObjectsAndKeys:
               ColorWithRGB(223, 61, 66),UITextAttributeTextColor,
               font,UITextAttributeFont,
               nil];
        
        [appearance setTitleTextAttributes:dic forState:UIControlStateHighlighted];
        
    }
    
    //UISegmentedControl
    appearance = [UISegmentedControl appearance];
    
    if (systemOlderThan7) {
        UIImage *segmentSelected;
        UIImage *segmentUnselected;
        UIImage *segmentSelectedUnselected;
        UIImage *segUnselectedSelected;
        UIImage *segmentUnselectedUnselected;
        
        segmentSelected     = [[UIImage imageNamed:@"bgSegment1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        segmentUnselected   = [[UIImage imageNamed:@"bgSegment0.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        
        segmentSelectedUnselected   = [UIImage imageNamed:@"bgSegmentDivider.png"];
        segUnselectedSelected       = [UIImage imageNamed:@"bgSegmentDivider.png"];
        segmentUnselectedUnselected = [UIImage imageNamed:@"bgSegmentDivider.png"];
        
        dic =@{
               UITextAttributeTextColor: ColorWithRGB(238, 77, 77),
               UITextAttributeFont:[self SDFontWithFamilyName:_SubTitleFontName_ size:13.0f]
               };
        
        [appearance setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        dic =@{
               UITextAttributeTextColor: [UIColor whiteColor],
               UITextAttributeFont:[self SDFontWithFamilyName:_SubTitleFontName_ size:13.0f]
               };
        [appearance setTitleTextAttributes:dic forState:UIControlStateHighlighted];
        
        [appearance setContentPositionAdjustment:UIOffsetMake(0, 3) forSegmentType:UISegmentedControlSegmentAny barMetrics:UIBarMetricsDefault];
        
        
        [appearance setBackgroundImage:segmentUnselected forState:stateNormal barMetrics:UIBarMetricsDefault];
        [appearance setBackgroundImage:segmentSelected forState:stateSelected barMetrics:UIBarMetricsDefault];
        
        [appearance setDividerImage:segmentUnselectedUnselected
                forLeftSegmentState:stateNormal
                  rightSegmentState:stateNormal
                         barMetrics:UIBarMetricsDefault];
        
        [appearance setDividerImage:segmentSelectedUnselected
                forLeftSegmentState:stateSelected
                  rightSegmentState:stateNormal
                         barMetrics:UIBarMetricsDefault];
        
        [appearance setDividerImage:segUnselectedSelected
                forLeftSegmentState:stateNormal
                  rightSegmentState:stateSelected
                         barMetrics:UIBarMetricsDefault];
        
    }
   */
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
