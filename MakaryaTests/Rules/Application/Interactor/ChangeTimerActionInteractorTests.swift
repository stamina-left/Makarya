//
//  ChangeTimerActionInteractorTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 12/11/21.
//

import XCTest
@testable import Makarya

class ChangeTimerActionInteractorTests: XCTestCase {

    func testChangeTimerAction_WhenActionProvided_TimerChangedIntoCorrectState() {
        
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "paused")
        
        let sut = ChangeTimerActionInteractorImplementation().execute(requestParameter: request)
            
        XCTAssertEqual(sut.state, "paused")
    }
    
    func testChangeTimerAction_WhenWrongActionProvided_ReturnsAnError() {
        
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "undying")
        
        let sut = ChangeTimerActionInteractorImplementation()
        
        sut.execute(requestParameter: request) { result in
            switch result {
            case .success(_):
                XCTFail("It should fail instead of returns an object.")
            case .failure(let error):
                XCTAssertEqual(error as? TimerEntityValidation.TimerEntityError, .invalidState)
            }
        }
    }

}
