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
        let currentDate = Calendar.current
        let duration = TimeInterval(1_450.0)
        let passed = TimeInterval(1_450.0)
        
        let sut = TimerEntity(id: identifier, date: currentDate, duration: duration, passed: passed)
        
        XCTAssertTrue(sut is TimerEntity)
    }

}
