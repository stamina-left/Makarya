//
//  SetTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol SetTimerInteractor {
    func execute(requestParameter: TimerRequestModel) throws -> TimerResponseModel
}

final class TimerInteractorImplementation: SetTimerInteractor {
    
    func execute(requestParameter: TimerRequestModel) throws -> TimerResponseModel {
        
        let clockInteractor = ClockInteractorImplementation()
        
        let clock = try clockInteractor.parseClock(hours: hours, minutes: minutes, seconds: seconds)
        
        let result = TimerEntity(clock: clock, date: date)
        changeState(result)
        
        return result
    }
}

extension TimerInteractorImplementation {
    
    private func changeState(_ timer: TimerEntity) {
        
        timer.state = .started
    }
}
