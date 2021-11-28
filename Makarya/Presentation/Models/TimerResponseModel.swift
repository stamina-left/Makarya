//
//  TimerResponseModel.swift
//  Makarya
//
//  Created by Albert Pangestu on 08/11/21.
//

import Foundation

protocol TimerResponse {
    var hours: Int { get set }
    var minutes: Int { get set }
    var seconds: Int { get set }
    var state: String { get set }
}

final class TimerResponseModel: TimerResponse {
    
    var hours: Int
    var minutes: Int
    var seconds: Int
    var state: String
    
    init(timer: TimerEntity) {
        self.hours = timer.clock.hours
        self.minutes = timer.clock.minutes
        self.seconds = timer.clock.seconds
        self.state = timer.state.rawValue
    }
}
