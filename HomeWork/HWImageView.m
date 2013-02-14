//
//  HWImageView.m
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWImageView.h"

@interface HWImageView ()

@end

@implementation HWImageView

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
    
    [self addSubviewForImage];
}

- (void)addSubviewForImage
{
    UIImage* thumbImage;
    UIImageView* thumbImageView;
    
    NSString* imageUrlStr = @"http://static.naver.jp/line_lp_pc_ver2/img/line_ishihara_satomi03.jpg";
    NSURL* url = [NSURL URLWithString:imageUrlStr];
    NSData* data = [NSData dataWithContentsOfURL:url];
    
    if (data) {
        thumbImage = [[UIImage alloc] initWithData:data];
    }
    else
    {
        //thumbImage = [UIImage imageNamed:@"reconsiva.png"];
        NSString* localImagePath = [[NSBundle mainBundle]pathForResource:@"reconsiva" ofType:@"png"];
        thumbImage = [UIImage imageWithContentsOfFile:localImagePath];
    }
    
    thumbImageView = [[[UIImageView alloc]initWithImage:thumbImage]autorelease];
    //[thumbImageView setFrame:CGRectMake(0, 0, thumbImage.size.width, thumbImage.size.height)];
    //[thumbImageView sizeToFit];
    [thumbImageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [thumbImageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.view addSubview:thumbImageView];

    // gesture
    UITapGestureRecognizer* tapGesture = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapped:)]autorelease];
    [tapGesture setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:tapGesture];
    
}

- (void)gestureTapped:(UITapGestureRecognizer*)sender
{
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"tapped, %@", sender);
        NSLog(@"tapped, %@", (UIImageView*)sender.view);
        
        [[self navigationController]popViewControllerAnimated:YES];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [[self navigationController] setNavigationBarHidden:NO];
//}

@end
