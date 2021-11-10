//
//  SetTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol SetTimerInteractor {
    func execute(requestParameter: TimerRequestModel) -> TimerResponseModel
}

final class SetTimerInteractorImplementation: SetTimerInteractor {
    
    func execute(requestParameter: TimerRequestModel) -> TimerResponseModel {
        
        let clock = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
        let timer = TimerEntity(clock: clock, date: requestParameter.date)
        
        let result = TimerResponseModel(timer: timer)
        return result
    }
}
