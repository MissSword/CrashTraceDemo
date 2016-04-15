//
//  ZXJCrashTrace.m
//  ZXJCrashTraceDemo
//
//  Created by zhuxingjian on 16/4/13.
//  Copyright © 2016年 ZXJ. All rights reserved.
//

#import "ZXJCrashTrace.h"




@implementation ZXJCrashTrace

+ (void)registerCrashTrace
{
    [[[self alloc] init] registerCrashTrace];
    [self uploadCrashLog];
}

/**
 *  监听崩溃回调，当程序crash时候回回调此方法
 */
- (void)registerCrashTrace
{
    NSSetUncaughtExceptionHandler(&crashTraceHandle);
}

void crashTraceHandle(NSException *exception)
{
    NSMutableDictionary *crashDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
//    获取异常信息
    NSString *name = [exception name];//crash 异常类型
    NSString *reason = [exception reason]; //crash 原因
    NSArray *callStackSymbols = [exception callStackSymbols]; //调用的函数栈的信息
    [crashDictionary setObject:name forKey:CRASH_NAME_KEY];
    [crashDictionary setObject:reason forKey:CRASH_REASON_KEY];
    [crashDictionary setObject:callStackSymbols forKey:CRASH_STACK_SYMBOLS_KEY];
    
//    截屏
    UIImage *image = screenShot(nil);
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    [crashDictionary setObject:imageData forKey:CRASH_SCREEN_SHOT_KEY];
    
//    获取设备信息
    NSDictionary *deviceInfo = [ZXJCrashTraceTool currentDeviceInfo];
    [crashDictionary setObject:deviceInfo forKey:CRASH_DEVICE_INFO_KEY];
    
//    获取当前时间
    NSString *dateString = [ZXJCrashTraceTool currentTime];
    [crashDictionary setObject:dateString forKey:CRASH_TIME_KEY];
    
    if ([crashDictionary writeToFile:CRASH_LOG_FILE_PATH atomically:YES]) {
        NSLog(@"保存成功");
    };
    NSLog(@"%@",crashDictionary);
}

+ (void)uploadCrashLog
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:CRASH_LOG_FILE_PATH]) {
//        如果存在日志信息将日志信息上传到服务器端，上传成功后删除本地日志信息
    }
}


@end
