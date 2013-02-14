//
//  HWCustomizwdCellViewController.h
//  HomeWork
//
//  Created by nhn on 13. 2. 5..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark ----- CellWithImageView -----

@interface CellWithImageView : UITableViewCell
{
@private
	UIImageView* imageView_;
}

@property (nonatomic, retain) UIImageView* imageView;

@end

#pragma mark ----- CellWithSwitch -----

@interface CellWithSwitch : UITableViewCell
{
@private
	UISwitch* theSwitch_;
}

@property (nonatomic, retain) UISwitch* theSwitch;

@end

#pragma mark ----- CellWithSlider -----

@protocol CellWithSliderDelegate
@required
- (void)slider:(UISlider*)slider valueDidChange:(float)value forRow:(NSUInteger)row;
@end

@interface CellWithSlider : UITableViewCell
{
@private
	UISlider* slider_;
	NSUInteger row_;
	id delegate_;
}

@property (nonatomic, retain) UISlider* slider;
@property (nonatomic, assign) NSUInteger row;
@property (nonatomic, assign) id delegate;

@end

#pragma mark ----- SampleForCustomizedCell -----

@interface HWCustomizwdCellViewController : UITableViewController <CellWithSliderDelegate>
{
    @private
    NSArray* sections_;
    NSArray* dataSource_;
    NSMutableArray* sliderValues_;
}

@property (nonatomic, retain) NSArray* sections;
@property (nonatomic, retain) NSArray* dataSource;
@property (nonatomic, retain) NSMutableArray* sliderValues;

@end
