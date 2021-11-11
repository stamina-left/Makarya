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
       
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "")
        
        let sut = SetTimerInteractorImplementation().execute(requestParameter: request)
            
        XCTAssertEqual(sut.state, "started")
    }
    
    func testSetTimer_WhenWrongInformationProvided_ReturnsAnError() {
        
        let request = TimerRequestModel(hours: 27, minutes: 0, seconds: 0, date: Date(), state: "")
        
        let sut = SetTimerInteractorImplementation()
        
        sut.execute(requestParameter: request) { result in
            switch result {
            case .success(_):
                XCTFail("It should fail instead of returns an object.")
            case .failed(let error):
                XCTAssertEqual(error as? TimerInteractorError, .invalidHour)
            }
        }
        
    }
    
    func testSetTimer_WhenActionProvided_TimerChangedIntoCorrectState() {
        
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "paused")
        
        let sut = ChangeTimerActionInteractorImplementation().execute(requestParameter: request)
            
        XCTAssertEqual(sut.state, "paused")
    }
}
