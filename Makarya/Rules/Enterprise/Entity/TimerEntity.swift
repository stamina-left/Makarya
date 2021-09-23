//
//  TimerEntity.swift
//  Makarya
//
//  Created by Albert Pangestu on 15/09/21.
//

import Foundation

enum ValidationError: Error {
    case FutureDate
    case OverdueDate
}

final class TimerEntity: Equatable {
    
    var id: UUID
    var date: Date
    var duration: TimeInterval
    var passed: TimeInterval
    
    init(id: UUID, date: Date, duration: TimeInterval, passed: TimeInterval) throws {
        
        guard date < Date() else { throw ValidationError.FutureDate }
        guard Calendar.autoupdatingCurrent.isDateInToday(date) else { throw ValidationError.OverdueDate }
        
        self.id = id
        self.date = date
        self.duration = duration
        self.passed = passed
    }
    
    static func == (lhs: TimerEntity, rhs: TimerEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
