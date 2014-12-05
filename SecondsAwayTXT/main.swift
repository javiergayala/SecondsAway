//
//  main.swift
//  SecondsAwayTXT
//
//  Created by Javier Ayala on 12/5/14.
//  Copyright (c) 2014 Javier Ayala. All rights reserved.
//

import Foundation

let tmpinput: String = Process.arguments[1]

class ConvertSeconds {
    let sec2years: Int = 31536000
    let sec2months: Int = 2592000
    let sec2weeks: Int = 604800
    let sec2days: Int = 86400
    let sec2hours: Int = 3600
    var input: Int = 0
    var comma: Int = 0
    var remainder: Int, seconds: Int, minutes: Int, hours: Int, days: Int, weeks: Int, months: Int, years: Int
    var labels = [String: String]()
    
    init(input: Int) {
        self.input = input
        self.remainder = input
        self.seconds = 0
        self.minutes = 0
        self.hours = 0
        self.days = 0
        self.weeks = 0
        self.months = 0
        self.years = 0
        self.comma = 0
        self.labels = [String: String]()
        self.calc()
    }
    
    func calc() {
        while(self.remainder >= sec2years) {
            self.years = (self.remainder / sec2years)
            self.remainder = self.remainder % sec2years
            self.labels["years"] = (self.years) > 1 ? "Years" : "Year"
        }
        while(self.remainder >= sec2months) {
            self.months = (self.remainder / sec2months)
            self.remainder = self.remainder % sec2months
            self.labels["months"] = (self.months) > 1 ? "Months" : "Month"
        }
        while(self.remainder >= sec2weeks) {
            self.weeks = (self.remainder / sec2weeks)
            self.remainder = self.remainder % sec2weeks
            self.labels["weeks"] = (self.weeks) > 1 ? "Weeks" : "Week"
        }
        while(self.remainder >= sec2days) {
            self.days = (self.remainder / sec2days)
            self.remainder = self.remainder % sec2days
            self.labels["days"] = (self.days) > 1 ? "Days" : "Day"
        }
        while(self.remainder >= sec2hours) {
            self.hours = (self.remainder / sec2hours)
            self.remainder = self.remainder % sec2hours
            self.labels["hours"] = (self.hours) > 1 ? "Hours" : "Hour"
        }
        while(self.remainder >= 60) {
            self.minutes = (self.remainder / 60)
            self.remainder = self.remainder % 60
            self.labels["minutes"] = (self.minutes) > 1 ? "Minutes" : "Minute"
        }
        self.seconds = self.remainder
        self.labels["seconds"] = (self.seconds) > 1 ? "Seconds" : "Second"
    }
    
}

if let sec2input = tmpinput.toInt() {
    var mysec = ConvertSeconds(input: sec2input)
    if mysec.years >= 1 {
        let yearlbl = mysec.labels["years"]!
        mysec.comma = 1
        print("\(mysec.years) \(yearlbl)")
    }
    if mysec.months >= 1 {
        let monthlbl = mysec.labels["months"]!
        mysec.comma == 1 ? print(", ") : print(" ")
        print("\(mysec.months) \(monthlbl)")
        mysec.comma = 1
    }
    if mysec.weeks >= 1 {
        let weeklbl = mysec.labels["weeks"]!
        mysec.comma == 1 ? print(", ") : print(" ")
        print("\(mysec.weeks) \(weeklbl)")
        mysec.comma = 1
    }
    if mysec.days >= 1 {
        let daylbl = mysec.labels["days"]!
        mysec.comma == 1 ? print(", ") : print(" ")
        print("\(mysec.days) \(daylbl)")
        mysec.comma = 1
    }
    if mysec.hours >= 1 {
        let hourlbl = mysec.labels["hours"]!
        mysec.comma == 1 ? print(", ") : print(" ")
        print("\(mysec.hours) \(hourlbl)")
        mysec.comma = 1
    }
    if mysec.minutes >= 1 {
        let minutelbl = mysec.labels["minutes"]!
        mysec.comma == 1 ? print(", ") : print(" ")
        print("\(mysec.minutes) \(minutelbl)")
        mysec.comma = 1
    }
    if mysec.seconds >= 1 {
        let secondlbl = mysec.labels["seconds"]!
        mysec.comma == 1 ? print(", ") : print(" ")
        print("\(mysec.seconds) \(secondlbl) ")
    }
    print("\n")
    
} else {
    println("Argument MUST be a number!")
}



