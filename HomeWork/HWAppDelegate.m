//
//  HWAppDelegate.m
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWAppDelegate.h"
#import "MainViewController.h"

@implementation HWAppDelegate

@synthesize window_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect bounds = [[UIScreen mainScreen]bounds];
    window_ = [[UIWindow alloc] initWithFrame:bounds];
    
    baseViewController_ = [[MainViewController alloc] init];
    
    UINavigationController* naviCon = [[[UINavigationController alloc]initWithRootViewController:baseViewController_]autorelease];
    [window_ setRootViewController:naviCon];
    
    [window_ makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [baseViewController_ release];
    [window_ release];
    [super dealloc];
}

@end
