//
//  Date.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/11.
//

import Foundation

extension Date {
    func displayTimeAgo(date: Date) -> String{
        let now = Date()
        let components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .weekOfYear], from: date, to: now)

        if let week = components.weekOfYear, week > 0 {
            // 주 단위
            return ("\(week)주")
        } else if let day = components.day, day > 0 {
            // 일 단위
            return ("\(day)일")
        } else if let hour = components.hour, hour > 0 {
            // 시간 단위
            return ("\(hour)시간")
        } else if let minute = components.minute, minute > 0 {
            // 분 단위
            return ("\(minute)분")
        } else {
            // 초 단위
            return ("\(components.second ?? 0)초")
        }
    }
}
