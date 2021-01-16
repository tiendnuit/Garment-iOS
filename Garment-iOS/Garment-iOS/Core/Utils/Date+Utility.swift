//
//  Date+Utility.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation

extension Date {
    func distanceTimeString(toDate older: Date) -> (String?)  {
        var date = self
        var olderDate = older
        if self.compare(older) == .orderedAscending {
            date = older
            olderDate = self
        }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        
        let calendar = Calendar.current
        let componentsLeftTime = calendar.dateComponents([.second, .minute , .hour , .day, .month, .weekOfMonth, .year], from: olderDate, to: date)
        
        let year = componentsLeftTime.year ?? 0
        if  year > 0 {
            if(year == 1){
                return "\(year) year ago"
            } else {
                return "\(year) years ago"
            }
        }
        
        let month = componentsLeftTime.month ?? 0
        if  month > 0 {
            if(month == 1){
                return "\(month) month ago"
            } else {
                return "\(month) months ago"
            }
        }
        
        let weekOfMonth = componentsLeftTime.weekOfMonth ?? 0
        if  weekOfMonth > 0 {
           if(weekOfMonth == 1){
                return "\(weekOfMonth) week ago"
            } else {
                return "\(weekOfMonth) weeks ago"
            }
        }
        
        let day = componentsLeftTime.day ?? 0
        if  day > 0 {
            if(day == 1){
                return "\(day) day ago"
            } else {
                return "\(day) days ago"
            }
        }
        
        let hour = componentsLeftTime.hour ?? 0
        if  hour > 0 {
            if(hour == 1){
                return "\(hour) hour ago"
            } else {
                return "\(hour) hours ago"
            }
        }
        
        let minute = componentsLeftTime.minute ?? 0
        if  minute > 0 {
            if (minute <= 9){
                return "just now"
            }else {
                return "\(minute) minutes ago"
            }
        }
        
        let seconds = componentsLeftTime.second ?? 0
        if  seconds >= 0 {
            return "just now"
        }
        
        return nil
    }
}
