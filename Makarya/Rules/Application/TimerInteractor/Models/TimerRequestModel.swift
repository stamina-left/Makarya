//
//  TimerRequestModel.swift
//  Makarya
//
//  Created by Albert Pangestu on 08/11/21.
//

import Foundation

struct TimerRequestModel {
    let hours: Int
    let minutes: Int
    let seconds: Int
    let date: Date
    let state: String
}

enum TimerStateRequestModel: String {
    case started = "started"
    case paused = "paused"
    case stopped = "stopped"
    case finished = "finished"
}
