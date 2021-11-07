//
//  TimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol TimerInteractor {
    func setTimer(hours: Int, minutes: Int, seconds: Int, date: Date) throws -> TimerEntity
    func changeTimerAction(timer: TimerEntity, with action: String) throws -> TimerEntity
}

final class TimerInteractorImplementation: TimerInteractor {
    
    func setTimer(hours: Int, minutes: Int, seconds: Int, date: Date) throws -> TimerEntity {
        
        let clockInteractor = ClockInteractorImplementation()
        
        let clock = try clockInteractor.parseClock(hours: hours, minutes: minutes, seconds: seconds)
        
        let result = TimerEntity(clock: clock, date: date)
        changeState(result)
        
        return result
    }
    
    func changeTimerAction(timer: TimerEntity, with action: String) throws -> TimerEntity {
        
        changeState(timer)
        return timer
    }
}

extension TimerInteractorImplementation {
    
    private func changeState(_ timer: TimerEntity) {
        
        timer.state = .started
    }
}
