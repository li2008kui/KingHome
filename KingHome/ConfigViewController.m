//
//  ConfigViewController.m
//  KingHome
//
//  Created by kingsun on 14/12/16.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import "ConfigViewController.h"
#import "EditViewController.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设备配置";
    
    UITableView *tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height - 88) style:UITableViewStyleGrouped];
    tView.delegate = self;
    tView.dataSource = self;
    [self.view addSubview:tView];
    [tView release];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"设备信息";
    }
    else if(section == 1)
    {
        return @"EasyLink";
    }
    else
    {
        return @"";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    EditViewController *edit = [[EditViewController alloc] initWithText:@"test"];
    [self.navigationController pushViewController:edit animated:YES];
    [edit release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else if(section == 1)
    {
        return 2;
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"设备名称";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"设备备注";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"设备二维码";
        }
    }
    else if(indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"发现新设备";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"重置旧设备";
        }
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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
