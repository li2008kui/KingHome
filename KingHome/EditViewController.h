//
//  EditViewController.h
//  KingHome
//
//  Created by kingsun on 14/12/16.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
{
    
}

@property(nonatomic, retain) NSString *textContent;

- (instancetype)initWithText:(NSString *)text;

@end