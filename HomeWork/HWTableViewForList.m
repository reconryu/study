//
//  HWTableViewForList.m
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWTableViewForList.h"
#import "HWTableViewForDetail.h"

@interface HWTableViewForList ()

@end

@implementation HWTableViewForList

- (void)dealloc
{
    [key_ release];
    [dataSource_ release];
    [images_ release];
    [details_ release];
    
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

    key_ = [[NSArray alloc]initWithObjects:@"포유류", @"파충류", @"양서류", @"어류", nil];
    NSArray* dsObj1 = [NSArray arrayWithObjects:@"Monkey", @"Dog", @"Lion", @"Elephant", nil];
    NSArray* dsObj2 = [NSArray arrayWithObjects:@"Snake", @"Gecko", nil];
    NSArray* dsObj3 = [NSArray arrayWithObjects:@"Frog", @"Newts", nil];
    NSArray* dsObj4 = [NSArray arrayWithObjects:@"Shark", @"Salmon", nil];
    NSArray* dsObjs = [NSArray arrayWithObjects:dsObj1, dsObj2, dsObj3, dsObj4, nil];
    dataSource_ = [[NSDictionary alloc]initWithObjects:dsObjs forKeys:key_];
    
    NSArray* detailObj1 = [NSArray arrayWithObjects:@"원숭이", @"강아지", @"사자", @"코끼리", nil];
    NSArray* detailObj2 = [NSArray arrayWithObjects:@"뱀", @"도마뱀", nil];
    NSArray* detailObj3 = [NSArray arrayWithObjects:@"개구리", @"영원류", nil];
    NSArray* detailObj4 = [NSArray arrayWithObjects:@"상어", @"연어", nil];
    NSArray* detailObjs = [NSArray arrayWithObjects:detailObj1, detailObj2, detailObj3, detailObj4, nil];
    details_ = [[NSDictionary alloc]initWithObjects:detailObjs forKeys:key_];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
	
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [key_ count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [key_ objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id key = [key_ objectAtIndex:section];
    return [[dataSource_ objectForKey:key]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (nil == cell)
    {
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        [cell autorelease];
    }
    id key = [key_ objectAtIndex:indexPath.section];
    NSString* text = [[dataSource_ objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    
    //NSString* imageName = @"reconsiva.png";
    NSString* imageName = [NSString stringWithFormat:@"%@.png", text];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    NSString* detailText = [[details_ objectForKey:key] objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = detailText;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
   
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"GO~~~~~~~~~~");
    
    HWTableViewForDetail* tableViewController = [[[HWTableViewForDetail alloc]init]autorelease];
    
    [[self navigationController]pushViewController:tableViewController animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO];
    [self.navigationItem setTitle:@"TableViewForList"];
//    UILabel* naviBarLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 50.0f)];
//    [naviBarLabel setText:@"TableViewForList"];
//    [naviBarLabel sizeToFit];
//    [self.navigationController.view addSubview:naviBarLabel];
    
}

@end
