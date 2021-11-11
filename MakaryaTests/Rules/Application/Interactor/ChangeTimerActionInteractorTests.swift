//
//  ChangeTimerActionInteractorTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 12/11/21.
//

import XCTest
@testable import Makarya

class ChangeTimerActionInteractorTests: XCTestCase {

    func testSetTimer_WhenActionProvided_TimerChangedIntoCorrectState() {
        
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "paused")
        
        let sut = ChangeTimerActionInteractorImplementation().execute(requestParameter: request)
            
        XCTAssertEqual(sut.state, "paused")
    }

}
