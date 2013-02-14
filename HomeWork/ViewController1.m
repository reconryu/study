//
//  ViewController1.m
//  HomeWork
//
//  Created by nhn on 13. 2. 4..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "ViewController1.h"
#import "HWTableViewController.h"
#import "ViewController.h"
#import "HWSectionTableViewController.h"
#import "HWCellWithImageViewController.h"
#import "HWCustomizwdCellViewController.h"


@interface ViewController1 ()
{
    UITextField *textField;
}
@end

@implementation ViewController1

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
    // Do any additional setup after loading the view from its nib.
    
    UIImage *thumbnailImage;
    UIImageView* thumbnailImageView;
       
    // URL을 읽어서 이미지 노출
    NSString *urlString = @"http://static.naver.jp/line_lp_pc/img/120306_line/img_logo.png";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if(data)
    {
        thumbnailImage = [[UIImage alloc]initWithData:data];
        thumbnailImageView = [[[UIImageView alloc]initWithImage:thumbnailImage]autorelease];
        NSLog(@"image width = %f", thumbnailImage.size.width);
        NSLog(@"image height = %f", thumbnailImage.size.height);
        
        [thumbnailImageView setFrame:CGRectMake(0.0f, 0.0f, thumbnailImage.size.width, thumbnailImage.size.height)];
    }
    else
    {
        UILabel *label = [[UILabel alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
        [label setText:urlString];
        //[label setTextAlignment:UITextAlignmentCenter];
        [label sizeToFit];
        
        [self.view addSubview:label];

        // 프로젝트 내부에 있는 이미지 노출
        //thumbnailImage = [UIImage imageNamed:@"reconsiva.png"];
        NSString *imageFilePath = [[NSBundle mainBundle] pathForResource:@"reconsiva" ofType:@"png"];
        thumbnailImage = [UIImage imageWithContentsOfFile:imageFilePath];
        thumbnailImageView = [[[UIImageView alloc]initWithImage:thumbnailImage]autorelease];
        [thumbnailImageView setFrame:CGRectMake(100, 0, thumbnailImage.size.width, thumbnailImage.size.height)];
    }
    UITapGestureRecognizer *tapGesture;
    tapGesture = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapped:)] autorelease];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
    [thumbnailImageView sizeToFit];
    [self.view addSubview:thumbnailImageView];
   
    
    // text field
    CGRect textFieldFrame = CGRectMake(0, 70, 250, 30);
    textField = [[[UITextField alloc] initWithFrame:textFieldFrame]autorelease];
    [textField setKeyboardType:UIKeyboardTypeURL];
    [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [textField setReturnKeyType:UIReturnKeyGo];
    [textField setBackgroundColor:[UIColor grayColor]];
    [textField setPlaceholder:@"url~"];
    textField.returnKeyType = UIReturnKeyGo;
    
    textField.delegate = self;
    
    [self.view addSubview:textField];
    
    
    // button
    CGRect urlButtonFrame = CGRectMake(255, 70, 50, 30);
    UIButton *urlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [urlButton setFrame:urlButtonFrame];
    [urlButton setTitle:@"GO" forState:UIControlStateNormal];
    [urlButton sizeToFit];
    urlButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [urlButton addTarget:self action:@selector(urlButtonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:urlButton];
   
    
    // button
    CGRect tvButtonFrame = CGRectMake(0, 120, 50, 50);
    UIButton *tvButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [tvButton setFrame:tvButtonFrame];
    [tvButton setTitle:@"table view" forState:UIControlStateNormal];
    [tvButton sizeToFit];
    [tvButton setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
    [tvButton addTarget:self action:@selector(tvButtonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tvButton];
    
    
    // additional
    [self additionalView];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)gestureTapped:(UIGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"tapped, %@", sender);
        NSLog(@"tapped, %@", (UIImageView*)sender.view);        
    }
}

- (void)urlButtonDidPush:(id)sender
{
    if([sender isKindOfClass:[UIButton class]])
    {
        //new controller
        //set text
        UIAlertView* alert = [[[UIAlertView alloc]initWithTitle:nil message:textField.text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease ];
        [alert show];
//        UIButton* button = sender;
//        UIAlertView* alert = [[[UIAlertView alloc]initWithTitle:nil message:button.currentTitle delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease ];
//        
//        [alert show];
    }
}

- (void)buttonDidPush
{
    [self.view.window sendSubviewToBack:self.view];
}

- (void)tvButtonDidPush:(id)sender
{
    NSLog(@"========> %@", sender);
    if([sender isKindOfClass:[UIButton class]])
    {
        
        //HWTableViewController * tableViewController = [[[HWTableViewController alloc]init]autorelease];
        //HWSectionTableViewController* tableViewController = [[[HWSectionTableViewController alloc]init]autorelease];
        HWCellWithImageViewController* tableViewController = [[[HWCellWithImageViewController alloc]init]autorelease];
        //HWCustomizwdCellViewController* tableViewController = [[[HWCustomizwdCellViewController alloc]init]autorelease];

        [[self navigationController]pushViewController:tableViewController animated:YES];
        
//        UIButton* button = sender;
//        UIAlertView* alert = [[[UIAlertView alloc]initWithTitle:nil message:button.currentTitle delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease ];
//        
//        [alert show];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) additionalView
{
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    [label setText:@"Hello, world!"];
    [label sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    label.center = newPoint;
    //label.textAlignment = UITextAlignmentCenter;
    //[label setTextAlignment:UITextAlignmentCenter];
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    // add button
    // 버튼을 클릭하면 화면이 전환된다.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"화면전환" forState:UIControlStateNormal];
    [button sizeToFit];
    newPoint = self.view.center;
    newPoint.y += 100;
    button.center = newPoint;
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [[self navigationController] setNavigationBarHidden:YES];

}

@end
