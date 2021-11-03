//
//  TimerInteractorTest.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 23/09/21.
//

import XCTest
@testable import Makarya

class TimerInteractorTest: XCTestCase {

    func testStartTimer_WhenTimerProvided_TimerShouldStarted() {
        
        let timerSet = Date.init(timeIntervalSinceNow: 60)
        let assetSet = "alarm_sound"
        let currentDate = Date()
        
        let sut = TimerInteractor.startTimer(timerSet: timerSet,
                                             assetSet: assetSet,
                                             currentDate: currentDate)
        
        XCTAssertEqual(sut.state, .started)
    }

}
