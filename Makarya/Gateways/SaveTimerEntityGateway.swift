//
//  SaveTimerEntityGateway.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

protocol SaveTimerEntityGateway {
    func saveTimer(timer: TimerEntity) throws -> TimerEntity
}
