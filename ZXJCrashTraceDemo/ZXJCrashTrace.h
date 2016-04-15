//
//  ZXJCrashTrace.h
//  ZXJCrashTraceDemo
//
//  Created by zhuxingjian on 16/4/13.
//  Copyright © 2016年 ZXJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZXJCrashTraceTool.h"

#define CRASH_LOG_FILE_PATH     [[ZXJCrashTraceTool documentPath] stringByAppendingString:@"/crashLogFile.plist"]
#define CRASH_NAME_KEY                  @"name"
#define CRASH_REASON_KEY                @"reason"
#define CRASH_STACK_SYMBOLS_KEY         @"callStackSymbols"
#define CRASH_SCREEN_SHOT_KEY           @"screenShot"
#define CRASH_DEVICE_INFO_KEY           @"deviceInfo"
#define CRASH_TIME_KEY                  @"time"

@interface ZXJCrashTrace : NSObject

+ (void)registerCrashTrace;

@end
