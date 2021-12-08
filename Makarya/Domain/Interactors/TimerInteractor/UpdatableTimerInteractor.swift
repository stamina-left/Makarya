//
//  UpdatableTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

enum UpdatableInteractorError: Error {
    case invalid
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
        
        do {
            try TimerEntityValidation().validate(requestParameter)
            
            let clock = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
            var timer = TimerEntity(clock: clock, date: requestParameter.date)
            
            timer.state = TimerState(rawValue: requestParameter.state)!
            
            repository.execute(timer: timer) { result in
                switch result {
                case .success(let timerResult):
                    let response = TimerResponseModel(timer: timerResult)
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
