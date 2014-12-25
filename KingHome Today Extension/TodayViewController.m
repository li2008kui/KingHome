//
//  TodayViewController.m
//  KingHome Today Extension
//
//  Created by kingsun on 14/12/25.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnSendCommad:(UIButton *)sender {
    NSURL *url;
    
    if (sender.tag == 101) {
        url = [NSURL URLWithString:@"http://usewin.cn/Index.ashx?Type=1"];
    } else {
        url = [NSURL URLWithString:@"http://usewin.cn/Index.ashx?Type=2"];
    }
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:nil completionHandler:nil];
}

- (IBAction)sldSendCommad:(UISlider *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://usewin.cn/Index.ashx?Type=3&Level=%i", (NSUInteger)sender.value]];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:nil completionHandler:nil];
}

- (IBAction)toApp:(id)sender {
    NSURL *url = [NSURL URLWithString:@"KingHomeEnter://enter"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
