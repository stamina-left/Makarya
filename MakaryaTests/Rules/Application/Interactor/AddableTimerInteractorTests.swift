//
//  AddableTimerInteractorTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 05/11/21.
//

import XCTest
@testable import Makarya

class AddableTimerInteractorTests: XCTestCase {

    func testAddTimer_WhenInformationProvided_TimerInStartedState() {
       
        let request = TimerEntity(clock: ClockValueObject(hours: 1, minutes: 0, seconds: 0), date: Date())
        
        attemptAddTimer(request: request) { result in
            switch result {
            case .success(let timer):
                XCTAssertEqual(timer.state.rawValue, "started")
            case .failure(let error):
                XCTFail("Should return a timer, reason: \(error.localizedDescription)")
            }
        }
    }
    
    func testAddTimer_WhenWrongInformationProvided_ReturnsAnError() {
        
        let request = TimerEntity(clock: ClockValueObject(hours: 27, minutes: 0, seconds: 0), date: Date())
        
        attemptAddTimer(request: request) { result in
            switch result {
            case .success(_):
                XCTFail("It should fail instead of returns an object.")
            case .failure(let error):
                XCTAssertEqual(error as? AddableInteractorError, .invalidHours)
            }
        }
    }
    
    // MARK: - Helpers
    
    private func attemptAddTimer(request: TimerEntity,
                         completion: @escaping (Result<TimerEntity, Error>) -> Void) {
        
        let repository = CoreDataAddableTimerRepository(coreDataManager: TestCoreDataManager().create())
        
        let sut = AddableTimerInteractor(repository: repository)
        
        sut.add(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
//        sut.execute(request: request) { result in
//            switch result {
//            case .success(let timer):
//                completion(.success(timer))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
    }
}
