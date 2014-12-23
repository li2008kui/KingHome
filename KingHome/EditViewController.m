//
//  EditViewController.m
//  KingHome
//
//  Created by kingsun on 14/12/16.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (instancetype)initWithText:(NSString *)text
{
    if (self = [super init]) {
        _textContent = [text retain];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"修改设备信息";
    
    UITextField *txt = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 35)];
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.text = _textContent;
    [self.view addSubview:txt];
    [txt release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
