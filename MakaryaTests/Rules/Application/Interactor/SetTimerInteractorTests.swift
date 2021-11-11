//
//  SetTimerInteractorTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 05/11/21.
//

import XCTest
@testable import Makarya

class SetTimerInteractorTests: XCTestCase {

    func testSetTimer_WhenInformationProvided_TimerInStartedState() {
       
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "")
        
        let sut = SetTimerInteractorImplementation()
        
        sut.execute(requestParameter: request) { result in
            switch result {
            case .success(let timer):
                XCTAssertEqual(timer.state, "started")
            case .failure(let error):
                XCTFail("Should return a timer, reason: \(error.localizedDescription)")
            }
        }
    }
    
    func testSetTimer_WhenWrongInformationProvided_ReturnsAnError() {
        
        let request = TimerRequestModel(hours: 27, minutes: 0, seconds: 0, date: Date(), state: "")
        
        let sut = SetTimerInteractorImplementation()
        
        sut.execute(requestParameter: request) { result in
            switch result {
            case .success(_):
                XCTFail("It should fail instead of returns an object.")
            case .failure(let error):
                XCTAssertEqual(error as? ClockValueObjectValidation.ClockInteractorError, .invalidHours)
            }
        }
        
    }
}
