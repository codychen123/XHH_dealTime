//
//  HHCalender.m
//  dealTime
//
//  Created by xiaohuihui on 2016/12/5.
//  Copyright © 2016年 30-陈辉华. All rights reserved.
//

#import "HHCalender.h"

@implementation HHCalender

/**
 创建一个日历的单例
 
 @return 日历的单例
 */
+ (instancetype) sharedCalender {
    static HHCalender *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = (HHCalender *)[HHCalender currentCalendar];
    });
    
    return instance;
}


@end
