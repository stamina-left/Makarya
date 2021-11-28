//
//  ChangeTimerActionInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

protocol ChangeTimerActionInteractor {
    func execute(requestParameter: TimerRequest,
                 completion: @escaping(Result<TimerResponse, Error>) -> Void)
}

final class ChangeTimerActionInteractorImplementation: ChangeTimerActionInteractor {
    
    private let repository: ChangeTimerRepository
    
    init(repository: ChangeTimerRepository) {
        self.repository = repository
    }
    
    func execute(requestParameter: TimerRequest,
                 completion: @escaping(Result<TimerResponse, Error>) -> Void) {
        
        do {
            try TimerEntityValidation().validate(requestParameter)
            
            let clock = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
            let timer = TimerEntity(clock: clock, date: requestParameter.date)
            
            timer.state = TimerEntity.TimerState(rawValue: requestParameter.state)!
            
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
