//
//  ClockInteractorTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 04/11/21.
//

import XCTest
@testable import Makarya

class ClockInteractorTests: XCTestCase {

    func testParseClock_WhenInformationProvided_ClockIsParsed() {
        
        let hours = 0
        let minutes = 30
        let seconds = 0
        
        let sut = ClockInteractor.parseClock(hours: hours, minutes: minutes, seconds: seconds)
        
        XCTAssertEqual(sut, ClockValueObject(hours: hours, minutes: minutes, seconds: seconds))
    }

}
