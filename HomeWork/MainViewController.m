//
//  MainViewController.m
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "MainViewController.h"
#import "HWTableViewForList.h"
#import "HWWebView.h"
#import "HWImageView.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize textField = textField;


- (void)dealloc
{
    [self.textField release];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"#####################");
    UITouch* touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [textField resignFirstResponder];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // thumbnail
    [self addSubviewOfThumbnail];
    
    // text field  && button for web view
    [self addSubviewOfTextFieldForWebView];
    
    // button for table view
    [self addSubviewOfButtonForTableView];
    
    [self.view resignFirstResponder];
    
}

- (void)addSubviewOfThumbnail
{
    UIImage* thumbImage;
    UIImageView* thumbImageView;
    
    NSString* imageUrlStr = @"http://static.naver.jp/line_lp_pc/img/120306_line/img_logo.png";
    NSURL* url = [NSURL URLWithString:imageUrlStr];
    NSData* data = [NSData dataWithContentsOfURL:url];
    
    if (data) {
        thumbImage = [[UIImage alloc] initWithData:data];
        thumbImageView = [[[UIImageView alloc]initWithImage:thumbImage]autorelease];
        [thumbImageView setFrame:CGRectMake(0.0f, 0.0f, thumbImage.size.width, thumbImage.size.height)];
    }
    else
    {
        UILabel* imageLoadingFailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 50.0f)];
        [imageLoadingFailLabel setText:@"Not Found"];
        [imageLoadingFailLabel sizeToFit];
        [self.view addSubview:imageLoadingFailLabel];
        
        //thumbImage = [UIImage imageNamed:@"reconsiva.png"];
        NSString* localImagePath = [[NSBundle mainBundle]pathForResource:@"reconsiva" ofType:@"png"];
        thumbImage = [UIImage imageWithContentsOfFile:localImagePath];
        thumbImageView = [[[UIImageView alloc]initWithImage:thumbImage]autorelease];
        [thumbImageView setFrame:CGRectMake(100, 0, thumbImage.size.width, thumbImage.size.height)];
    }
    
    [thumbImageView sizeToFit];
    [self.view addSubview:thumbImageView];

    // frame 참조
    NSLog(@"x = %f", thumbImageView.frame.origin.x);
    NSLog(@"y = %f", thumbImageView.frame.origin.y);
    NSLog(@"width = %f", thumbImageView.frame.size.width);
    NSLog(@"height = %f", thumbImageView.frame.size.height);
    // center 참조
    NSLog(@"x = %f", thumbImageView.center.x);
    NSLog(@"y = %f", thumbImageView.center.y);
    
    // gesture
    UITapGestureRecognizer* tapGesture = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapped:)]autorelease];
    [tapGesture setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapGesture];
    //[thumbImageView addGestureRecognizer:tapGesture];
    
}

- (void)addSubviewOfTextFieldForWebView
{
    // text field
    CGRect textFieldFrame = CGRectMake(0, 70, 250, 30);
    textField = [[[UITextField alloc] initWithFrame:textFieldFrame]autorelease];
    [textField setKeyboardType:UIKeyboardTypeURL];
    [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [textField setReturnKeyType:UIReturnKeyDefault];
    [textField setBackgroundColor:[UIColor grayColor]];
    [textField setPlaceholder:@"url~"];
    
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
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField
{
    NSLog(@"~~~~>");
    [aTextField resignFirstResponder];
    [self goWebview];
    return YES;
}

//    // hide keyboard
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//}

//    // hide keyboard
//- (void) handleTapFrom: (UITapGestureRecognizer *) recognizer {
//    // hide the keyboard
//    NSLog(@"hiding the keyboard");
//    [self.view resignFirstResponder];
//}

- (void)addSubviewOfButtonForTableView
{
    CGRect tvButtonFrame = CGRectMake(0, 120, 50, 50);
    UIButton *tvButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [tvButton setFrame:tvButtonFrame];
    [tvButton setTitle:@"table view" forState:UIControlStateNormal];
    [tvButton sizeToFit];
    [tvButton setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
    [tvButton addTarget:self action:@selector(tvButtonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tvButton];
}

- (void)gestureTapped:(UITapGestureRecognizer*)sender
{
   // NSLog(@"gestureTapped : %@", sender);
    
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"tapped, %@", sender);
        NSLog(@"tapped, %@", (UIImageView*)sender.view);
        
        HWImageView* viewController = [[[HWImageView alloc]init]autorelease];
        [[self navigationController]pushViewController:viewController animated:YES];
    }
    [textField resignFirstResponder];
}

- (void)goWebview
{
    NSLog(@"url=%@", textField.text);
    
    //if ([textField.text substringToIndex:7] isEqualToString:@"http://")
    if ([textField.text hasPrefix:@"http://"])
    {
        HWWebView* viewController = [[[HWWebView alloc]init]autorelease];
        [viewController setUrlString:textField.text];
        [[self navigationController]pushViewController:viewController animated:YES];
    }
    else
    {
        NSString* alertMessage;
        
        if (textField.text == nil || textField.text.length < 1)
        {
            alertMessage = @"url을 입력해주세요.";
        }
        else
        {
            alertMessage = @"정상적인 url을 입력해주세요. http:// 으로 시작해야 됩니다.";
        }
        UIAlertView* alert = [[[UIAlertView alloc]initWithTitle:nil message:alertMessage delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease ];
        [alert show];
        [textField setText:@""];
    }
}

- (void)urlButtonDidPush:(id)sender
{
    if([sender isKindOfClass:[UIButton class]])
    {
        //new controller
        [self goWebview];
        
        //HWWebView* viewController = [[[HWWebView alloc]init]autorelease];
        //[viewController setUrlString:textField.text];
        //[[self navigationController]pushViewController:viewController animated:YES];
        
    }
}

- (void)tvButtonDidPush:(id)sender
{
    NSLog(@"========> %@", sender);
    if([sender isKindOfClass:[UIButton class]])
    {
        HWTableViewForList* tableViewController = [[[HWTableViewForList alloc]init]autorelease];
        
        [[self navigationController]pushViewController:tableViewController animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES];
}

@end
