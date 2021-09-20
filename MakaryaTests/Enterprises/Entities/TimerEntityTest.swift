//
//  TimerEntityTest.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 15/09/21.
//

import XCTest
@testable import Makarya

class TimerEntityTest: XCTestCase {

    func testCheckTimerInput() {
        
        let identifier = UUID()
        let currentDate = Date()
        let duration = TimeInterval(1_450.0)
        let passed = TimeInterval(1_450.0)
        
        let sut = try? TimerEntity(id: identifier, date: currentDate, duration: duration, passed: passed)
        
        XCTAssertEqual(sut?.id, identifier, "ID is empty nor different with identifier \(identifier).")
    }
    
    func testCheckTimerInput_withFutureDate() {
        
        let identifier = UUID()
        let futureDate = Date().addingTimeInterval(10)
        let duration = TimeInterval(1_450.0)
        let passed = TimeInterval(1_450.0)
        
        let sut = try? TimerEntity(id: identifier, date: futureDate, duration: duration, passed: passed)
        
        XCTAssertEqual(sut?.date, nil, "Date is not too soon.")
    }
    
    func testCheckTimerInput_withPastDate() {
        
        let identifier = UUID()
        let pastDate = Date.yesterday
        let duration = TimeInterval(1_450.0)
        let passed = TimeInterval(1_450.0)
        
        let sut = try? TimerEntity(id: identifier, date: pastDate, duration: duration, passed: passed)
        
        XCTAssertEqual(sut?.date, nil, "Date is not overdue.")
    }
    
}

// MARK: - Helper

extension Date {
    
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
