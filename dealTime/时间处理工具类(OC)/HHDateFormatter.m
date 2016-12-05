//
//  HHDateFormatter.m
//  dealTime
//
//  Created by xiaohuihui on 2016/12/5.
//  Copyright © 2016年 30-陈辉华. All rights reserved.
//

#import "HHDateFormatter.h"

@implementation HHDateFormatter

+ (instancetype) sharedFormatter {
    static HHDateFormatter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HHDateFormatter alloc] init];
    });
    
    return instance;
}

@end
