//
//  ChangeTimerActionInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

protocol ChangeTimerActionInteractor {
    func execute(requestParameter: TimerRequestModel, completion: @escaping(Result<TimerResponseModel, Error>) -> Void)
}

final class ChangeTimerActionInteractorImplementation: ChangeTimerActionInteractor {
    
    func execute(requestParameter: TimerRequestModel, completion: @escaping(Result<TimerResponseModel, Error>) -> Void) {
        
        // validate first
        
        let clock = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
        let timer = TimerEntity(clock: clock, date: requestParameter.date)
        
        guard let requestState = TimerEntity.TimerState(rawValue: requestParameter.state) else {
            return TimerResponseModel(timer: timer)
        }
        timer.state = requestState
        
        let result = TimerResponseModel(timer: timer)
        return result
    }
}
