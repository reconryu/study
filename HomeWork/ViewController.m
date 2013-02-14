//
//  ViewController.m
//  HomeWork
//
//  Created by nhn on 13. 2. 4..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mainView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [[self view] addSubview:mainView];
}

- (void) viewWillAppear:(BOOL)animated
{
    
    
    [[self navigationController] setNavigationBarHidden:NO];

    
    // label
    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero]autorelease];
    // frame 설정
    label.frame = CGRectMake(0, 0, 200, 50);
    // center 설정
    //label.center = CGPointMake(160, 240);
    // frame 참조
    NSLog(@"x = %f", label.frame.origin.x);
    NSLog(@"y = %f", label.frame.origin.y);
    NSLog(@"width = %f", label.frame.size.width);
    NSLog(@"height = %f", label.frame.size.height);
    // center 참조
    NSLog(@"x = %f", label.center.x);
    NSLog(@"y = %f", label.center.y);
    
    label.text = @"Hello, world!";
    //label.hidden = YES;
    //label.backgroundColor = [UIColor redColor];
    label.backgroundColor = [[UIColor alloc] initWithRed:1.0 green:0.0 blue:0.5 alpha:0.5];
    
    [mainView addSubview:label];
    
    
    // label1
    UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    //label1.backgroundColor = [UIColor blueColor];
    [label1 setBackgroundColor:[UIColor blueColor]];

    //label1.textColor = [UIColor whiteColor];
    [label1 setTextColor:[UIColor whiteColor]];
    
    //label1.text = @"짧은 문자열";
    [label1 setText:@"짧은 문자열"];
    
    [label1 sizeToFit];
    CGPoint newPoint = label1.center;
    newPoint.y = 100;
    
    //label1.center = newPoint;
    [label1 setCenter:newPoint];
    
    [mainView addSubview:label1];
    
    
    
    // label2
    UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    //label2.backgroundColor = [UIColor blueColor];
    [label2 setBackgroundColor:[UIColor blueColor]];
    
    //label2.textColor = [UIColor whiteColor];
    [label2 setTextColor:[UIColor whiteColor]];
    
    //label2.text = @"긴--------------------- 문자열";
    [label2 setText:@"긴--------------------- 문자열"];
    
    [label2 sizeToFit];
    newPoint = label2.center;
    
    NSLog(@"%f", newPoint.y);
    newPoint.y += 100;
    NSLog(@"%f", newPoint.y);
    
    //label2.center = newPoint;
    [label2 setCenter:newPoint];
    
    [mainView addSubview:label2];
    
    
    
        
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
