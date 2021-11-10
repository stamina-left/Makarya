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
       
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date())
        
        do {
            
            let sut = try SetTimerInteractorImplementation().execute(requestParameter: request)
            
            XCTAssertEqual(sut.state, "started")
        } catch {
            XCTFail()
        }
    }
    
    func testSetTimer_WhenActionProvided_TimerChangedIntoCorrectState() {
        
//        let hours = 1
//        let minutes = 0
//        let seconds = 0
//        
//        do {
//            
//            let timer = try SetTimerInteractorImplementation().execute(hours: hours, minutes: minutes, seconds: seconds, date: Date())
//            
//            let sut = try SetTimerInteractorImplementation().changeTimerAction(timer: timer, with: "paused")
//            
//            XCTAssertEqual(sut.state, .paused)
//        } catch {
//            XCTFail()
//        }
    }

}
