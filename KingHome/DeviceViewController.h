//
//  DeviceViewController.h
//  KingHome
//
//  Created by kingsun on 14/12/15.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface DeviceViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, ZBarReaderDelegate>
{
    
}

@property(nonatomic, retain)ZBarReaderViewController * reader;

@end
