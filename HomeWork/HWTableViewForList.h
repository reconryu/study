//
//  HWTableViewForList.h
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWTableViewForList : UITableViewController
{
    @protected
    NSArray* key_;
    NSDictionary* dataSource_;
    NSMutableDictionary* images_;
    NSDictionary* details_;
}

@end
