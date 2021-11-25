//
//  TimerRequestModel.swift
//  Makarya
//
//  Created by Albert Pangestu on 08/11/21.
//

import Foundation

protocol TimerRequest {
    var hours: Int { get set }
    var minutes: Int { get set }
    var seconds: Int { get set }
    var date: Date { get set }
    var state: String { get set }
}

final class TimerRequestModel: TimerRequest {
    
    var hours: Int
    var minutes: Int
    var seconds: Int
    var date: Date
    var state: String
    
    init(hours: Int, minutes: Int, seconds: Int, date: Date, state: String) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
        self.date = date
        self.state = state
    }
}
