//
//  ControlViewController.m
//  KingHome
//
//  Created by kingsun on 14/12/16.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import "ControlViewController.h"
#import "ConfigViewController.h"

@interface ControlViewController ()

@end

@implementation ControlViewController

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        _itemTitle = [title retain];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _itemTitle;
    
    UIBarButtonItem *bItme = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(setDeviceInfo:)];
    self.navigationItem.rightBarButtonItem = bItme;
    [bItme release];
    /*
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(50, 100, 100, 50);
    [btn1 setTitle:@"开/关" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(170, 100, 100, 50);
    [btn2 setTitle:@"模式" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UISlider *slider1 = [[UISlider alloc] initWithFrame:CGRectMake(0, 300, 200, 34)];
    slider1.minimumValue = 0;
    slider1.maximumValue = 255;
    slider1.transform = CGAffineTransformMakeScale(2, 1);
    slider1.transform = CGAffineTransformRotate(slider1.transform, 3 * M_PI_2);
    [slider1 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider1];
    [slider1 release];
    
    UISlider *slider2 = [[UISlider alloc] initWithFrame:CGRectMake(100, 300, 200, 34)];
    slider2.minimumValue = 0;
    slider2.maximumValue = 65535;
    slider2.transform = CGAffineTransformMakeScale(2, 1);
    slider2.transform = CGAffineTransformRotate(slider2.transform, 3 * M_PI_2);
    [slider2 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider2];
    [slider2 release];*/
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ctloop"]];
    iv.frame = CGRectMake(10, 150, 300, 300);
    [self.view addSubview:iv];
    [iv release];
    
    UIPickerView *pv = [[UIPickerView alloc] initWithFrame:CGRectMake(140, 220, 40, 100)];
    pv.showsSelectionIndicator = NO;
    pv.dataSource = self;
    pv.delegate = self;
    [self.view addSubview:pv];
    [pv release];
    
    [pv selectRow:5 inComponent:0 animated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 99;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIImageView *tempiv = (UIImageView *)view;
    
    if (!tempiv) {
        tempiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rollline"]];
        tempiv.frame = CGRectMake(0, 0, 40, 5);
        [tempiv autorelease];
    }
    
    return tempiv;
}

- (void)setDeviceInfo:(UIBarButtonItem *)barButtonItem
{
    ConfigViewController *config = [[ConfigViewController alloc] init];
    [self.navigationController pushViewController:config animated:YES];
    [config release];
}

- (void)sendCommand:(UIButton *)button
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该功能尚未实现！" delegate:self cancelButtonTitle:@"明白" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)sliderValueChanged:(UISlider *)slider
{
    NSLog(@"value=%f", slider.value);
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
    [_itemTitle release];
    
    [super dealloc];
}

@end
