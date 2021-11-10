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
    let state: TimerStateRequestModel
}

extension TimerRequestModel {
    
    enum TimerStateRequestModel: String {
        case started = "started"
        case paused = "paused"
        case stopped = "stopped"
        case finished = "finished"
        
        static func ==(left: TimerStateRequestModel, right: TimerEntity.TimerState) -> Bool {
            return left.rawValue == right.rawValue
        }
        
        static func ==(left: TimerEntity.TimerState, right: TimerStateRequestModel) -> Bool {
            return left.rawValue == right.rawValue
        }
    }
}
