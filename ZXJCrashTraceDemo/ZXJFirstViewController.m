//
//  ZXJFirstViewController.m
//  ZXJCrashTraceDemo
//
//  Created by zhuxingjian on 16/4/13.
//  Copyright © 2016年 ZXJ. All rights reserved.
//


#import "ZXJFirstViewController.h"
#import "ZXJSecondViewController.h"

@interface ZXJFirstViewController ()

@end

@implementation ZXJFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"first";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ZXJSecondViewController *vc = [[ZXJSecondViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
