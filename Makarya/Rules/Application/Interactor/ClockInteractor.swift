//
//  ClockInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

protocol ClockInteractor {
    func parseClock(hours: Int, minutes: Int, seconds: Int) -> Result<ClockValueObject, Error>
}

struct ClockInteractorImplementation: ClockInteractor {
    
    func parseClock(hours: Int, minutes: Int, seconds: Int) -> Result<ClockValueObject, Error> {
        return ClockValueObject(hours: hours, minutes: minutes, seconds: seconds)
    }
}
