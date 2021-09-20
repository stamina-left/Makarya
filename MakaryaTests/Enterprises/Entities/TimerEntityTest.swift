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
        let pastDate = Date()
        let duration = TimeInterval(1_450.0)
        let passed = TimeInterval(1_450.0)
        
        let sut = try? TimerEntity(id: identifier, date: pastDate, duration: duration, passed: passed)
        
        XCTAssertEqual(sut.date, nil, "Date is overdue.")
    }

}
