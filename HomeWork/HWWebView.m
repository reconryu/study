//
//  HWWebView.m
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWWebView.h"

@interface HWWebView ()

@end

@implementation HWWebView

@synthesize webView = webView;
@synthesize urlString = urlString;

- (void)dealloc
{
    [self.webView release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    
    [[self view] addSubview:webView];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"urlString = %@", urlString);
    
    //NSString* urlAddress = @"http://www.naver.com";
    NSString* urlAddress = urlString;
    NSURL* url = [NSURL URLWithString:urlAddress];
    NSURLRequest* requst = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requst];
    
    [[self navigationController] setNavigationBarHidden:NO];
}

@end
