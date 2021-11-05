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
    
    func setTimer(hours: Int, minutes: Int, seconds: Int) throws {
        
        
    }
}
