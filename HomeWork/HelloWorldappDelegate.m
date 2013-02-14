//
//  HelloWorldappDelegate.m
//  HomeWork
//
//  Created by nhn on 13. 2. 4..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HelloWorldappDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"


@implementation HelloWorldappDelegate

@synthesize window_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect bounds = [[UIScreen mainScreen]bounds];
    window_ = [[UIWindow alloc] initWithFrame:bounds];
    
    viewController1_ = [[ViewController1 alloc] init];
    
    
    UINavigationController *naviController = [[[UINavigationController alloc]initWithRootViewController:viewController1_]autorelease];
    [window_ setRootViewController:naviController];
    
    
    
//    viewController2_ = [[ViewController2 alloc] init];
//    
//    [window_ addSubview:viewController1_.view];
//    [window_ addSubview:viewController2_.view];
//    
//    [window_ bringSubviewToFront:viewController1_.view];
    
    [window_ makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [viewController1_ release];
    [viewController2_ release];
    
    [window_ release];
    [super dealloc];
}

@end
