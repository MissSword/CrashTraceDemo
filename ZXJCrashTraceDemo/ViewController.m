//
//  ViewController.m
//  ZXJCrashTraceDemo
//
//  Created by zhuxingjian on 16/4/13.
//  Copyright © 2016年 ZXJ. All rights reserved.
//

#import "ViewController.h"
#import "ZXJFirstViewController.h"
#import "ZXJCrashTrace.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:CRASH_LOG_FILE_PATH]) {
        
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:CRASH_LOG_FILE_PATH];
        UIImage *image = [UIImage imageWithData:dic[CRASH_SCREEN_SHOT_KEY]];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = self.view.bounds;
        imageView.backgroundColor = [UIColor redColor];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ZXJFirstViewController *vc = [ZXJFirstViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
