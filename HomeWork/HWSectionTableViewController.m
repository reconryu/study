//
//  HWSectionTableViewController.m
//  HomeWork
//
//  Created by nhn on 13. 2. 5..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWSectionTableViewController.h"

@interface HWSectionTableViewController ()

@end

@implementation HWSectionTableViewController

- (void)dealloc
{
    [key_ release];
    [dataSource_ release];
    [super dealloc];
}

- (id)init
{
    if((self =  [super init]))
    {
        self.title = @"SectionTable";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    key_ = [[NSArray alloc]initWithObjects:@"포유류", @"파충류", @"양서류", @"어류", nil];
    NSArray* object1 = [NSArray arrayWithObjects:@"Monkey", @"Dog", @"Lion", @"elephant", nil];
    NSArray* object2 = [NSArray arrayWithObjects:@"Snake", @"Gecko", nil];
    NSArray* object3 = [NSArray arrayWithObjects:@"Frog", @"Newts", nil];
    NSArray* object4 = [NSArray arrayWithObjects:@"Shark", @"Salmon", nil];
    NSArray* objects = [NSArray arrayWithObjects:object1, object2, object3, object4, nil];
    dataSource_ = [[NSDictionary alloc]initWithObjects:objects forKeys:key_];
}

// cell delete
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self.tableView setEditing:YES animated:YES];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 섹션 수를 반환한다
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [key_ count];
}

// section 번째의 섹션명을 반환한다
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [key_ objectAtIndex:section];
}

// 각 섹션의 항목 수를 리턴
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id key = [key_ objectAtIndex:section];
    return [[dataSource_ objectForKey:key]count];
}

// IndexPath로 지정된 곳의 셀을 만든다
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"basis-cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(nil == cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell autorelease];
    }
    id key = [key_ objectAtIndex:indexPath.section];
    NSString* text = [[dataSource_ objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    return cell;
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return key_;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id key = [key_ objectAtIndex:indexPath.section];
    NSString* message = [[dataSource_ objectForKey:key] objectAtIndex:indexPath.row];
    
    UIAlertView* alert = [[[UIAlertView alloc]init]autorelease];
    alert.message = message;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

@end
