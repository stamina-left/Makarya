//
//  TimerResponseModel.swift
//  Makarya
//
//  Created by Albert Pangestu on 08/11/21.
//

import Foundation

struct TimerResponseModel {
    let hours: Int
    let minutes: Int
    let seconds: Int
    let state: String
    
    init(timer: TimerEntity) {
        self.hours = timer.clock.hours
        self.minutes = timer.clock.minutes
        self.seconds = timer.clock.seconds
        self.state = timer.state.rawValue
    }
}
