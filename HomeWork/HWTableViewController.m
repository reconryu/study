//
//  HWTableViewController.m
//  HomeWork
//
//  Created by nhn on 13. 2. 5..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWTableViewController.h"

@implementation HWTableViewController

- (void)dealloc
{
    [items_ release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"simpleTable"];
    items_ = [[NSArray alloc]initWithObjects:@"ITEM 1", @"ITEM 2", @"ITEM 3", @"ITEM 4", nil];
}

// 테이블의 행수를 반환한다
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items_ count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"basis-cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell autorelease];
    }
    cell.textLabel.text = [items_ objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* message = [items_ objectAtIndex:indexPath.row];
    UIAlertView* alert = [[[UIAlertView alloc]init]autorelease];
    alert.message = message;
    [alert addButtonWithTitle:@"OK~!"];
    [alert show];
}



- (void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO];

}
@end
