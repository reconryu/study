//
//  HWTableViewForDetail.h
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWTableViewForDetail : UITableViewController
{
    @private
    NSArray* sections_;
    NSArray* dataSource_;
}

@property (nonatomic, retain) NSArray* sections;
@property (nonatomic, retain) NSArray* dataSource;

@end
