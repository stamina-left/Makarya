//
//  SetTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol SetTimerInteractor {
    func execute(request: TimerRequest,
                 completion: @escaping (Result<TimerResponseModel, Error>) -> Void)
}

final class SetTimerInteractorImplementation: SetTimerInteractor {
    
    private let repository: SaveTimerRepository
    
    init(repository: SaveTimerRepository) {
        self.repository = repository
    }
    
    func execute(request: TimerRequest,
                 completion: @escaping (Result<TimerResponseModel, Error>) -> Void) {
        
        do {
            let timerRequest = TimerRequestModel(timer: request)
            
            try ClockValueObjectValidation().validate(timerRequest)
            
            let clock = ClockValueObject(hours: timerRequest.hours,
                                         minutes: timerRequest.minutes,
                                         seconds: timerRequest.seconds)
            let timer = TimerEntity(clock: clock,
                                    date: timerRequest.date)
            
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
