//
//  NSDate+extension.swift
//  dealTime
//
//  Created by xiaohuihui on 2016/12/5.
//  Copyright © 2016年 30-陈辉华. All rights reserved.
//

import UIKit

//DateFormatter, Calendar初始化比较消耗内存,一般定义成常量, 在oc中,可以定义成单例
let dateFormat = DateFormatter()
let calendar = Calendar.current

extension Date {
    /// 在Swift3.0中, 分类里面的类方法,需要使用 static
    static func timeStringToDate(timeString: String) -> Date {

        /// "Sat Dec 03 19:56:38 +0800 2016",根据回调的时间字符串制定不一样的日期格式
        dateFormat.dateFormat = "EEE MMM dd HH:mm:ss zzz yyyy"
        /// 指定区域，真机一定要指定
        dateFormat.locale = Locale(identifier: "en")
        /// 把时间字符串，转日期
        return dateFormat.date(from: timeString)!
    }
    
    func dateToShowTime() -> String {
        if calendar.isDateInToday(self) {
            /// 间隔秒数
            let timeInterval = Int(Date().timeIntervalSince(self))
            /// 如果小于60秒
            if timeInterval < 60 {
                return "刚刚"
            }
            /// 小于1小时
            if timeInterval < 60 * 60 {
                return "\(timeInterval / 60)分钟前"
            }
            /// 小于1天，大于1小时
            return "\(timeInterval / 3600)小时前"
        }
        
        /// 如果是昨天
        if calendar.isDateInYesterday(self) {
            dateFormat.dateFormat = "昨天 HH:mm "
        } else {
            /// 如果不是昨天
            let year = calendar.component(.year, from: self)
            let thisYear = calendar.component(.year, from: Date())
            
            /// 如果是今年
            if year == thisYear {
                dateFormat.dateFormat = "MM-dd HH:mm"
            } else {
                dateFormat.dateFormat = "yyyy-MM-dd HH:mm"
            }
        }
        dateFormat.locale = Locale(identifier: "en")
        
        /// 返回需要的时间字符串
        return dateFormat.string(from: self)
    }
}

