//
//  ClockValueObjectValidation.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

final class ClockValueObjectValidation {
    
    func validate(_ timer: TimerRequestModel) throws {
        
        guard 0...23 ~= timer.hours else {
            throw ClockValueObjectError.invalidHours
        }
        
        guard 0...60 ~= timer.minutes else {
            throw ClockValueObjectError.invalidMinutes
        }
        
        guard 0...60 ~= timer.seconds else {
            throw ClockValueObjectError.invalidSeconds
        }
    }
}

extension ClockValueObjectValidation {
    
    enum ClockValueObjectError: Error {
        case invalidHours
        case invalidMinutes
        case invalidSeconds
    }
}
