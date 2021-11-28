//
//  TimerEntityValidation.swift
//  Makarya
//
//  Created by Albert Pangestu on 12/11/21.
//

import Foundation

final class TimerEntityValidation {
    
    func validate(_ timer: TimerRequestModel) throws {
        
        guard TimerEntity.TimerState.allCases.contains(where: { $0.rawValue == timer.state }) else {
            throw TimerEntityError.invalidState
        }
    }
}

extension TimerEntityValidation {
    
    enum TimerEntityError: Error {
        case invalidState
    }
}
