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

struct TimerRequestModel {
    let hours: Int
    let minutes: Int
    let seconds: Int
    let date: Date
    let state: String
}
