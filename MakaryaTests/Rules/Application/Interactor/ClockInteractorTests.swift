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
        let interactor = ClockInteractorImplementation()
          
        do {
            let sut = try interactor.parseClock(hours: hours, minutes: minutes, seconds: seconds)
            
            XCTAssertEqual(sut, ClockValueObject(hours: hours, minutes: minutes, seconds: seconds))
        } catch {
            XCTFail()
        }
    }
    
    func testParseClock_WhenWrongInformationProvided_ReturnsAnError() {
        
        let hours = 30
        let minutes = 0
        let seconds = 0
        
        let interactor = ClockInteractorImplementation()
        
        XCTAssertThrowsError(try interactor.parseClock(hours: hours, minutes: minutes, seconds: seconds), "Invalid information provided.") { error in
            XCTAssertEqual(error as? DefaultClockInteractorValidator.ClockInteractorError, DefaultClockInteractorValidator.ClockInteractorError.invalidHours)
        }
    }

}

// MARK: - Helper

func callsMethod(hours: Int, minutes: Int, seconds: Int, completionHandler: @escaping(Result<ClockValueObject, Error>) -> Void) {
    
    let interactor = ClockInteractorImplementation()
    
    do {
        let result = try interactor.parseClock(hours: hours, minutes: minutes, seconds: seconds)
        completionHandler(.success(result))
    } catch {
        completionHandler(.failure(error))
    }
}
