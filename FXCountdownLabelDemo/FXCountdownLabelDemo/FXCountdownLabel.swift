//
//  FXCountdownLabel.swift
//  SwiftDemo
//
//  Created by lingyongdai on 2018/6/22.
//  Copyright © 2018年 lingyongdai. All rights reserved.
//

import UIKit

class FXCountdownLabel: UILabel {

    var startTimeStr : String? //"yyyy/MM/dd HH:mm:ss"
    var endTimeStr : String? //"yyyy/MM/dd HH:mm:ss"
    var timer : Timer!
    var timeLb : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refresh() -> Void {
        
        if startTimeStr != nil && endTimeStr != nil {
            
            let startDate = Date.stringToDate(dateString: startTimeStr!,
                                              formatterString: "yyyy/MM/dd HH:mm:ss")
            let timeValue = startDate.timeIntervalSince(Date.init())
            
            if timeValue > 0 {
                self.text = "活动暂未开始"
            }else {
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeCaculate), userInfo: nil, repeats: true)
                RunLoop.current.add(self.timer, forMode: .commonModes)
            }
        }
    }
    
    @objc func timeCaculate() -> Void {
        
        let calendar = Calendar.current
        let today = Date.init()
        let endDate = Date.stringToDate(dateString: endTimeStr!,
                                        formatterString: "yyyy/MM/dd HH:mm:ss")
        
        let unitFlags : Set<Calendar.Component> = [.hour,.minute,.second]
        let datecomponent = calendar.dateComponents(unitFlags, from: today, to: endDate)
        
        if datecomponent.minute! <= 0 && datecomponent.hour! <= 0 && datecomponent.second! <= 0{
            //活动结束
            timer.invalidate()
            self.text = "00:00:00"
        }else {
            
            let hour = "\(datecomponent.hour!)"
            let minute = "\(datecomponent.minute!)"
            let second = "\(datecomponent.second!)"
            
            self.text = hour + ":" + minute + ":" + second
        }
    }

}

extension Date {
    static func dateToString(date : Date, formatterString : String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = formatterString
        let dateStr = formatter.string(from: date)
        return dateStr
    }
    
    static func stringToDate(dateString : String, formatterString : String) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = formatterString
        let date = formatter.date(from: dateString)
        return date!
    }
}
