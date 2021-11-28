//
//  SetTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol SetTimerInteractor {
    func execute(request: TimerRequest,
                 completion: @escaping (Result<TimerResponse, Error>) -> Void)
}

final class SetTimerInteractorImplementation: SetTimerInteractor {
    
    private let repository: SaveTimerRepository
    
    init(repository: SaveTimerRepository) {
        self.repository = repository
    }
    
    func execute(request: TimerRequest,
                 completion: @escaping (Result<TimerResponse, Error>) -> Void) {
        
        do {
            
            try ClockValueObjectValidation().validate(request)
            
            let clock = ClockValueObject(hours: request.hours,
                                         minutes: request.minutes,
                                         seconds: request.seconds)
            let timer = TimerEntity(clock: clock,
                                    date: request.date)
            
            repository.execute(timer: timer) { result in
                switch result {
                case .success():
                    let response = TimerResponseModel(timer: timer)
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
