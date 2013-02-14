//
//  HWCustomizwdCellViewController.m
//  HomeWork
//
//  Created by nhn on 13. 2. 5..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import "HWCustomizwdCellViewController.h"

#pragma mark ----- CellWithImageView -----

@implementation CellWithImageView

@synthesize imageView = imageView_;

- (void)dealloc {
	self.imageView = nil;
	[super dealloc];
}

- (id)initWithReuseIdentifier:(NSString*)identifier {
	if ( (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]) ) {
		self.imageView = [[[UIImageView alloc] init] autorelease];
		self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
		UIViewAutoresizingFlexibleRightMargin |
		UIViewAutoresizingFlexibleTopMargin |
		UIViewAutoresizingFlexibleBottomMargin;
		[self addSubview:self.imageView];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	[self.imageView sizeToFit];
	CGPoint newCenter = self.contentView.center;
	newCenter.x += 80;
	self.imageView.center = newCenter;
}

@end

#pragma mark ----- CellWithSwitch -----

@implementation CellWithSwitch

@synthesize theSwitch = theSwitch_;

- (void)dealloc {
	self.theSwitch = nil;
	[super dealloc];
}

- (id)initWithReuseIdentifier:(NSString*)identifier {
	if ( (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]) ) {
		self.theSwitch = [[[UISwitch alloc] init] autorelease];
		self.theSwitch.on = YES;
		self.theSwitch.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
		UIViewAutoresizingFlexibleRightMargin |
		UIViewAutoresizingFlexibleTopMargin |
		UIViewAutoresizingFlexibleBottomMargin;
		[self addSubview:self.theSwitch];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	CGPoint newCenter = self.contentView.center;
	newCenter.x += 80;
	self.theSwitch.center = newCenter;
}

@end

#pragma mark ----- CellWithSlider -----

@implementation CellWithSlider

@synthesize slider = slider_;
@synthesize row = row_;
@synthesize delegate = delegate_;

- (void)dealloc {
	self.slider = nil;
	[super dealloc];
}

- (id)initWithReuseIdentifier:(NSString*)identifier {
	if ( (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]) ) {
		self.slider = [[[UISlider alloc] init] autorelease];
		self.slider.frame = CGRectMake( 0, 0, 160, 20 );
		self.slider.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
		UIViewAutoresizingFlexibleRightMargin |
		UIViewAutoresizingFlexibleTopMargin |
		UIViewAutoresizingFlexibleBottomMargin;
		[self.slider addTarget:self
						action:@selector(sliderValueDidChange:)
			  forControlEvents:UIControlEventValueChanged];
		[self addSubview:self.slider];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	CGPoint newCenter = self.contentView.center;
	newCenter.x += 50;
	self.slider.center = newCenter;
}

- (void)sliderValueDidChange:(UISlider*)slider {
	[self.delegate slider:slider valueDidChange:slider.value forRow:self.row];
}

@end

#pragma mark ----- HWCustomizwdCellViewController -----

@interface HWCustomizwdCellViewController ()

@end

@implementation HWCustomizwdCellViewController

@synthesize sections = sections_;
@synthesize dataSource = dataSource_;
@synthesize sliderValues = sliderValues_;

- (void)dealloc
{
    [self.sections release];
    [self.dataSource release];
    [self.sliderValues release];
    [super dealloc];
}

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self)
    {
    }
    return self;
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

    self.sections = [NSArray arrayWithObjects:@"이름", @"필살기", @"힘", nil];
    NSArray* row1 = [[NSArray alloc]initWithObjects:@"홍길동", nil];
    NSArray* row2 = [[NSArray alloc]initWithObjects:@"쌍수검", nil];
    NSArray* row3 = [[NSArray alloc]initWithObjects:@"공격력", @"방어력", nil];
    self.dataSource = [NSArray arrayWithObjects:row1, row2, row3, nil];
    self.sliderValues = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:0.9], [NSNumber numberWithFloat:0.8], nil];
    [row1 release];
    [row2 release];
    [row3 release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataSource objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static const id identifiers[3] = {@"image-cell", @"switch-cell", @"slider-cell"};
    NSString* identifier = identifiers[indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(nil == cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        [cell autorelease];
//        switch (indexPath.section) {
//            case 0:
//                break;
//                
//            default:
//                break;
//        }
    }
    
    // Configure the cell...
    cell.textLabel.text = [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    cell.imageView.image = [images_ objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [details_ objectAtIndex:indexPath.row];
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}
- (void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO];
    
}

@end
