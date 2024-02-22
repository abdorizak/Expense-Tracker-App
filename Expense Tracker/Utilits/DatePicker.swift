//
//  DatePicker.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/26/22 💻.
// Copyright © 2023 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev

import UIKit

class DateTimePicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    var didSelectDates: ((_ datenow: Date) -> Void)?
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private var days = [Date]()
    private var chooseTime = [Date]()
    
    let dayFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    var inputView: UIView {
        return pickerView
    }
    
    func setup() {
        dayFormatter.dateFormat = "EE d MMM"
        timeFormatter.timeStyle = .short
        days = setDays()
        chooseTime = setTimes()
    }
    
    // MARK: - UIPickerViewDelegate & DateSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return days.count
        case 1:
            return chooseTime.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        
        var text = ""
        
        switch component {
        case 0:
            text = getDayString(from: days[row])
        case 1:
            text = getTimeString(from: chooseTime[row])
        default:
            break
        }
        
        label.text = text
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let dayIndex = pickerView.selectedRow(inComponent: 0)
        let chooseTimeTimeIndex = pickerView.selectedRow(inComponent: 1)
        
        guard days.indices.contains(dayIndex),
              chooseTime.indices.contains(chooseTimeTimeIndex) else { return }
        
        let timeChoosed = chooseTime[chooseTimeTimeIndex]
        
        didSelectDates?(timeChoosed)
    }
    
    // MARK: - Private helpers
    
    private func getDays(of date: Date) -> [Date] {
        var dates = [Date]()
        
        let calendar = Calendar.current
        
        // first date
        var currentDate = date
        
        // adding 30 days to current date
        let oneMonthFromNow = calendar.date(byAdding: .day, value: 30, to: currentDate)
        
        // last date
        let endDate = oneMonthFromNow
        
        while currentDate <= endDate! {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
    
    private func getTimes(of date: Date) -> [Date] {
        var times = [Date]()
        var currentDate = date
        
        currentDate = Calendar.current.date(bySetting: .hour, value: 7, of: currentDate)!
        currentDate = Calendar.current.date(bySetting: .minute, value: 00, of: currentDate)!
        
        let calendar = Calendar.current
        
        let interval = 60
        var nextDiff = interval - calendar.component(.minute, from: currentDate) % interval
        var nextDate = calendar.date(byAdding: .minute, value: nextDiff, to: currentDate) ?? Date()
        
        var hour = Calendar.current.component(.hour, from: nextDate)
        
        while(hour < 23) {
            times.append(nextDate)
            
            nextDiff = interval - calendar.component(.minute, from: nextDate) % interval
            nextDate = calendar.date(byAdding: .minute, value: nextDiff, to: nextDate) ?? Date()
            
            hour = Calendar.current.component(.hour, from: nextDate)
        }
        
        return times
    }
    
    private func setDays() -> [Date] {
        let today = Date()
        return getDays(of: today)
    }
    
    private func setTimes() -> [Date] {
        let today = Date()
        return getTimes(of: today)
    }
    
    
    private func getDayString(from: Date) -> String {
        return dayFormatter.string(from: from)
    }
    
    private func getTimeString(from: Date) -> String {
        return timeFormatter.string(from: from)
    }
    
}

extension Date {
    
    static func buildTimeRangeString(date: Date) -> String {
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE, MMM-d-yyyy"
        
        let TimeFormatter = DateFormatter()
        TimeFormatter.dateFormat = "h:mm a"
        
        return String(format: "%@ - %@",
                      dayFormatter.string(from: date),
                      TimeFormatter.string(from: date))
    }
    
    
    static func buildTimeRangeString(startDate: Date, endDate: Date) -> String {
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        let startTimeFormatter = DateFormatter()
        startTimeFormatter.dateFormat = "h:mm a"
        
        let endTimeFormatter = DateFormatter()
        endTimeFormatter.dateFormat = "h:mm a"
        
        return String(format: "%@ (%@ - %@)",
                      dayFormatter.string(from: startDate),
                      startTimeFormatter.string(from: startDate),
                      endTimeFormatter.string(from: endDate))
    }
}
