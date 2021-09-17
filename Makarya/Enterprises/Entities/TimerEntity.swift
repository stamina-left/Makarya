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
    
    enum TimerDateErrorEnum: Error {
        case FutureDate
        case OverdueDate
    }
    
    var id: UUID
    var date: Date?
    var duration: TimeInterval
    var passed: TimeInterval
    
    init(id: UUID, date: Date, duration: TimeInterval, passed: TimeInterval) {
        
        do {
            self.id = id
            self.duration = duration
            self.passed = passed
            try self.date = validate(date)
        } catch TimerDateErrorEnum.FutureDate {
            self.date = nil
        } catch TimerDateErrorEnum.OverdueDate {
            self.date = nil
        } catch {
            print("Something went wrong.")
        }
    }
    
    private func validate(_ date: Date) throws -> Date? {
        
        guard date < Date() else { throw TimerDateErrorEnum.OverdueDate }
        guard date == Date() else { throw TimerDateErrorEnum.FutureDate }
        
        return date
    }
}
