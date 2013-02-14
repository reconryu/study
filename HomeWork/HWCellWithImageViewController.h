//
//  HWCellWithImageViewController.h
//  HomeWork
//
//  Created by nhn on 13. 2. 5..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWCellWithImageViewController : UITableViewController
{
    @protected
    NSArray* dataSource_;
    NSMutableArray* images_;
    NSArray* details_;
}

@end
