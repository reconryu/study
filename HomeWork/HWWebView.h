//
//  HWWebView.h
//  HomeWork
//
//  Created by nhn on 13. 2. 6..
//  Copyright (c) 2013년 nhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWWebView : UIViewController
{
    @protected
    UIWebView* webView;
    NSString* urlString;
}

@property (nonatomic, retain)UIWebView* webView;
@property (nonatomic, retain)NSString* urlString;

@end
