//
//  MainViewController.h
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate>
{
    UITextField *textField;
}

@property (nonatomic, retain) UITextField *textField;

@end
