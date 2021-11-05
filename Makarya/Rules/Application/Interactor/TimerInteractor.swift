//
//  TimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol TimerInteractor {
    func setTimer(hours: Int, minutes: Int, seconds: Int, date: Date) throws
}

final class TimerInteractorImplementation: TimerInteractor {
    
    func setTimer(hours: Int, minutes: Int, seconds: Int, date: Date) throws {
        
        let clockInteractor = ClockInteractorImplementation()
        
        let clock = try clockInteractor.parseClock(hours: hours, minutes: minutes, seconds: seconds)
        
        return TimerEntity(clock: clock, date: date)
    }
}
