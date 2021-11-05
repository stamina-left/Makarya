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
        
        do {
            let sut = try TimerInteractorImplementation().setTimer(hours: hours, minutes: minutes, seconds: seconds, date: Date())
            
            XCTAssertEqual(sut.state, .started)
        } catch {
            XCTFail()
        }
    }
    
    func testSetTimer_WhenActionProvided_TimerChangedIntoCorrectState() {
        
        let hours = 1
        let minutes = 0
        let seconds = 0
    }

}
