//
//  TimerEntity.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

final class TimerEntity {
    
    typealias Clock = ClockValueObject
    
    let id = UUID()
    let clock: Clock
    let date: Date
    
    init(clock: Clock, date: Date) {
        self.clock = clock
        self.date = date
    }
}
