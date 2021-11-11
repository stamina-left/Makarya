//
//  ClockValueObjectValidation.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

final class ClockValueObjectValidation {
    
    func validate(hours: Int, minutes: Int, seconds: Int) throws -> Bool {
        
        guard 0...23 ~= hours else {
            throw ClockInteractorError.invalidHours
        }
        
        guard 0...60 ~= minutes else {
            throw ClockInteractorError.invalidMinutes
        }
        
        guard 0...60 ~= seconds else {
            throw ClockInteractorError.invalidSeconds
        }
    
        return true
    }
}

extension ClockValueObjectValidation {
    
    enum ClockInteractorError: Error {
        case invalidHours
        case invalidMinutes
        case invalidSeconds
    }
}
