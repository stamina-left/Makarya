//
//  TimerEntity.swift
//  Makarya
//
//  Created by Albert Pangestu on 15/09/21.
//

import Foundation

final class TimerEntity: Equatable {
    
    static func == (lhs: TimerEntity, rhs: TimerEntity) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: UUID
    var date: Calendar
    var duration: TimeInterval
    var passed: TimeInterval
    
    init(id: UUID, date: Calendar, duration: TimeInterval, passed: TimeInterval) {
        
        self.id = id
        self.date = date
        self.duration = duration
        self.passed = passed
    }
}
