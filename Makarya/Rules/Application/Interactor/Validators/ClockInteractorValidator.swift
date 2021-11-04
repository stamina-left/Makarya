//
//  ClockInteractorValidator.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

protocol ClockInteractorValidator {
    func validate(hours: Int, minutes: Int, seconds: Int) throws -> Bool
}

final class DefaultClockInteractorValidator: ClockInteractorValidator {
    
    func validate(hours: Int, minutes: Int, seconds: Int) throws -> Bool {
        <#code#>
    }
}
