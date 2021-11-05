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
        
        do {
            let sut = try callsMethod(hours: 0, minutes: 30, seconds: 0)
            XCTAssertEqual(sut, ClockValueObject(hours: 0, minutes: 30, seconds: 0))
        } catch {
            XCTFail("Input should be processed.")
        }
    }
    
    func testParseClock_WhenWrongInformationProvided_ReturnsAnError() {
        
        callsMethod(hours: 30, minutes: 0, seconds: 0) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as? DefaultClockInteractorValidator.ClockInteractorError, DefaultClockInteractorValidator.ClockInteractorError.invalidHours)
            case .success(_):
                XCTFail("Information should not be processed.")
            }
        }
    }

}

// MARK: - Helper

func callsMethod(hours: Int, minutes: Int, seconds: Int) throws -> ClockValueObject {
    
    let interactor = ClockInteractorImplementation()
    
    do {
        let result = try interactor.parseClock(hours: hours, minutes: minutes, seconds: seconds)
        return result
    } catch {
        throw error
    }
}
