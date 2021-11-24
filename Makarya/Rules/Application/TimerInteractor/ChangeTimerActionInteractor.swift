//
//  ChangeTimerActionInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

protocol ChangeTimerActionInteractor {
    func execute(requestParameter: TimerRequestModel,
                 completion: @escaping(Result<TimerResponseModel, Error>) -> Void)
}

final class ChangeTimerActionInteractorImplementation: ChangeTimerActionInteractor {
    
    func execute(requestParameter: TimerRequestModel,
                 completion: @escaping(Result<TimerResponseModel, Error>) -> Void) {
        
        do {
            try TimerEntityValidation().validate(requestParameter)
            
            let clock = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
            let timer = TimerEntity(clock: clock, date: requestParameter.date)
            
            timer.state = TimerEntity.TimerState(rawValue: requestParameter.state)!
            
            let result = TimerResponseModel(timer: timer)
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }
}
