//
//  TimerEntityTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 14/12/21.
//

import XCTest

class TimerEntityTests: XCTestCase {

    func test_InitialTimeInterval() {
        
        let timer = TimerEntity()
        XCTAssertEqual(timer.minutes, 30)
    }

}
