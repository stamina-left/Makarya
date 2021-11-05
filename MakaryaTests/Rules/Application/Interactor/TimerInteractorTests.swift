//
//  TimerInteractorTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 05/11/21.
//

import XCTest
@testable import Makarya

class TimerInteractorTests: XCTestCase {

    func testSetTimer_WhenInformationProvided_TimerInStartedState() {
       
        let hours = 1
        let minutes = 0
        let seconds = 0
        
        let sut = TimerInteractor(hours: hours, minutes: minutes, seconds: seconds)
        
        XCTAssertEqual(sut.state, .started)
    }

}
