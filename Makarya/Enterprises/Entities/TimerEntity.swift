//
//  TimerEntity.swift
//  Makarya
//
//  Created by Albert Pangestu on 15/09/21.
//

import Foundation

final class TimerEntity {
    
    var id: UUID
    var date: Date
    var duration: TimeInterval
    var passed: TimeInterval
    
    enum ValidationError: Error {
        case FutureDate
        case OverdueDate
    }
    
    init(id: UUID, date: Date, duration: TimeInterval, passed: TimeInterval) throws {
        
        guard date < Date() else { throw ValidationError.FutureDate }
        guard Calendar.autoupdatingCurrent.isDateInToday(date) else { throw ValidationError.OverdueDate }
        
        self.id = id
        self.date = date
        self.duration = duration
        self.passed = passed
    }
}
