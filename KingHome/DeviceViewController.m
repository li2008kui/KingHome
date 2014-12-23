//
//  DeviceViewController.m
//  KingHome
//
//  Created by kingsun on 14/12/15.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import "DeviceViewController.h"
#import "ControlViewController.h"

@interface DeviceViewController ()

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的设备";
    
    UIBarButtonItem *bItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(scanAddDevice:)];
    self.navigationItem.rightBarButtonItem = bItem;
    
    UITableView *tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height - 88) style:UITableViewStylePlain];
    tView.delegate = self;
    tView.dataSource = self;
    [self.view addSubview:tView];
    [tView release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选择
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ControlViewController *cVC = [[ControlViewController alloc] initWithTitle:[NSString stringWithFormat:@"吸顶灯%d", indexPath.row + 1]];
    [self.navigationController pushViewController:cVC animated:YES];
    [cVC release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"p%d", indexPath.row + 1]];
    cell.textLabel.text = [NSString stringWithFormat:@"吸顶灯%d", indexPath.row + 1];
    cell.detailTextLabel.text = @"状态：在线";
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)scanAddDevice:(UIBarButtonItem *)barButtonItem
{
    _reader = [[ZBarReaderViewController alloc] init];
    _reader.readerView.frame = CGRectMake(35, 100, 250, 200);
    _reader.readerDelegate = self;
    _reader.navigationItem.title = @"扫描二维码";
    
    UIBarButtonItem *bItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(openPhotoAlbum:)];
    
    _reader.navigationItem.rightBarButtonItem = bItem;
    [bItem release];
    
    ZBarImageScanner * scanner = _reader.scanner;
    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
    
    _reader.showsZBarControls = YES;
    
    [self.navigationController pushViewController:_reader animated:YES];
}

- (void)openPhotoAlbum:(UIBarButtonItem *)barButtonItem
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该功能尚未实现！" delegate:self cancelButtonTitle:@"明白" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol * symbol;
    for(symbol in results)
        break;
    
//    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    _label.text = symbol.data;
    
    [_reader.navigationController popViewControllerAnimated:YES];
    NSLog(@"%@", symbol.data);
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

- (void)dealloc
{
    [_reader release];
    
    [super dealloc];
}

@end
