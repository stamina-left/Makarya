//
//  ClockInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

protocol ClockInteractor {
    func parseClock(hours: Int, minutes: Int, seconds: Int) throws -> ClockValueObject
}

final class ClockInteractorImplementation: ClockInteractor {
    
    func parseClock(hours: Int, minutes: Int, seconds: Int) throws -> ClockValueObject {
        
        let _ = try DefaultClockInteractorValidator().validate(hours: hours, minutes: minutes, seconds: seconds)
        return ClockValueObject(hours: hours, minutes: minutes, seconds: seconds)
    }
}
