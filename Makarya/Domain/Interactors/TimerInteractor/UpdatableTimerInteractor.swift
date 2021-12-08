//
//  UpdatableTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

enum UpdatableInteractorError: Error {
    case invalidState
    case unknown
}

protocol UpdatableInteractor {
    
    associatedtype Request
    associatedtype Response
    
    typealias UpdatableInteractorCompletion = (Result<Response, UpdatableInteractorError>) -> Void
    func update(_ request: Request, completion: @escaping UpdatableInteractorCompletion)
}

final class UpdatableTimerInteractor: UpdatableInteractor {
    
    typealias Request = TimerEntity
    typealias Response = TimerEntity
    
    private let repository: UpdatableTimerRepository
    
    init(repository: UpdatableTimerRepository) {
        self.repository = repository
    }
    
    func update(_ request: Request,
                 completion: @escaping UpdatableInteractorCompletion) {
        
        // Validate request parameter
        guard TimerState.allCases.contains(where: { $0.rawValue == request.state.rawValue }) else {
            return completion(.failure(.invalidState))
        }
    }
}
