//
//  ClockInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

protocol ClockInteractor {
    func parseClock(hours: Int, minutes: Int, seconds: Int) -> ClockValueObject
}

struct ClockInteractorImplementation: ClockInteractor {
    
    func parseClock(hours: Int, minutes: Int, seconds: Int) -> ClockValueObject {
        return ClockValueObject(hours: hours, minutes: minutes, seconds: seconds)
    }
}
