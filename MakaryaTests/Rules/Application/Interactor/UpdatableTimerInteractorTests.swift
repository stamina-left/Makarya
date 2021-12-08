//
//  UpdatableTimerInteractorTests.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 12/11/21.
//

import XCTest
@testable import Makarya

class UpdatableTimerInteractorTests: XCTestCase {

    func testChangeTimerAction_WhenActionProvided_TimerChangedIntoCorrectState() {
        
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "paused")
            
        attemptChangeTimer(request: request) { result in
            switch result {
            case .success(let timer):
                XCTAssertEqual(timer.state, "paused")
            case .failure(let error):
                XCTFail("Should return a timer response model, reason \(error.localizedDescription)")
            }
        }
    }
    
    func testChangeTimerAction_WhenWrongActionProvided_ReturnsAnError() {
        
        let request = TimerRequestModel(hours: 1, minutes: 0, seconds: 0, date: Date(), state: "undying")
        
        attemptChangeTimer(request: request) { result in
            switch result {
            case .success(_):
                XCTFail("It should fail instead of returns an object.")
            case .failure(let error):
                XCTAssertEqual(error as? TimerEntityValidation.TimerEntityError, .invalidState)
            }
        }
    }
    
    // MARK: - Helpers

    func attemptChangeTimer(request: TimerRequestModel,
                            completion: @escaping (Result<TimerResponse, Error>) -> Void) {
        
        let repository = CoreDataUpdatableTimerRepository(coreDataManager: TestCoreDataManager().create())
        
        let sut = UpdatableTimerInteractor(repository: repository)
        
        sut.execute(requestParameter: request) { result in
            switch result {
            case .success(let timer):
                completion(.success(timer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
