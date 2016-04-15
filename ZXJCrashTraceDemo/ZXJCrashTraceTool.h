//
//  ZXJCrashTraceTool.h
//  ZXJCrashTraceDemo
//
//  Created by zhuxingjian on 16/4/14.
//  Copyright © 2016年 ZXJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZXJCrashTraceTool : NSObject

/**
 *  获取最上层ViewController
 *
 */
+ (UIViewController *)appVisibleViewController;

/**
 *  获取沙盒路径
 *
 */
+ (NSString *)documentPath;

/**
 *  获取当前设备的设备信息
 *
 */
+ (NSDictionary *)currentDeviceInfo;

/**
 *  获取当前时间字符串 （yyyy-MM-dd HH:mm:ss）
 *
 */
+ (NSString *)currentTime;

/**
 *  截屏
 *
 *  @param view 要截取的View
 *
 *  @return 截图生成的UIImage对象
 */
UIImage * screenShot(UIView *view);

@end
