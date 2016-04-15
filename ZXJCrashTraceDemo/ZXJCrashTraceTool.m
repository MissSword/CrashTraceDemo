//
//  ZXJCrashTraceTool.m
//  ZXJCrashTraceDemo
//
//  Created by zhuxingjian on 16/4/14.
//  Copyright © 2016年 ZXJ. All rights reserved.
//

#import "ZXJCrashTraceTool.h"

@implementation ZXJCrashTraceTool

+ (UIViewController *)appVisibleViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

+ (NSString *)documentPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths lastObject];
}

+ (NSDictionary *)currentDeviceInfo
{
    NSMutableDictionary *deviceInfo = [NSMutableDictionary dictionaryWithCapacity:0];
    NSString *deviceModel = [[UIDevice currentDevice] localizedModel];
    NSString *deviceSystemVersion = [[UIDevice currentDevice] systemVersion];
    [deviceInfo setObject:deviceModel forKey:@"deviceModel"];
    [deviceInfo setObject:deviceSystemVersion forKey:@"deviceSystemVersion"];
    return deviceInfo;
}

+ (NSString *)currentTime
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return  [dateFormat stringFromDate:[NSDate date]];
}

UIImage * screenShot(UIView *view) {
    
    if (!view) {
        view = [[ZXJCrashTraceTool appVisibleViewController] view];
    }
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.frame.size.width, view.frame.size.height), YES, 0);
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

@end
