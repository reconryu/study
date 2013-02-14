//
//  HWCellWithImageViewController.m
//  HomeWork
//
//  Created by nhn on 13. 2. 5..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWCellWithImageViewController.h"
#import "HWCustomizwdCellViewController.h"


@interface HWCellWithImageViewController ()

@end

@implementation HWCellWithImageViewController

- (void)dealloc
{
    [images_ release];
    [dataSource_ release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    dataSource_ = [[NSArray alloc]initWithObjects:@"Monkey", @"Dog", @"Elephant", nil];
    details_ = [[NSArray alloc]initWithObjects:@"원숭이", @"강아지", @"코끼리", nil];
    images_ = [[NSMutableArray alloc]initWithCapacity:8];
    for (NSString* name in dataSource_)
    {
        NSString* imageName = [NSString stringWithFormat:@"%@.png", name];
        //NSString* imageName = @"reconsiva.png";
        
        UIImage* image = [UIImage imageNamed:imageName];
        [images_ addObject:image];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"basis-cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell)
    {
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        [cell autorelease];
    }
    cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
    cell.imageView.image = [images_ objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [details_ objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //UIButton* button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    //[button addTarget:self action:@selector(infoDidPush) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"GO~~~~~~~~~~");
    
    HWCustomizwdCellViewController* tableViewController = [[[HWCustomizwdCellViewController alloc]init]autorelease];
    
    [[self navigationController]pushViewController:tableViewController animated:YES];

}
- (void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO];
    
}

@end
