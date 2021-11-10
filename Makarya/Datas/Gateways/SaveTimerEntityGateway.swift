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

final class SaveTimerEntityGatewayImplementation: SaveTimerEntityGateway {
    
    private let database: TimerDatabase
    
    init(database: TimerDatabase) {
        self.database = database
    }
    
    func saveTimer(timer: TimerEntity) throws -> TimerEntity {
        <#code#>
    }
}
