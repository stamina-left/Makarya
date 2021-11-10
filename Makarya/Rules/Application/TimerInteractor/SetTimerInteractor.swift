//
//  SetTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol SetTimerInteractor {
    func execute(requestParameter: TimerRequestModel) throws -> TimerResponseModel
}

final class TimerInteractorImplementation: SetTimerInteractor {
    
    private let gateway: SaveTimerEntityGateway
    
    init(gateway: SaveTimerEntityGateway) {
        self.gateway = gateway
    }
    
    func execute(requestParameter: TimerRequestModel) throws -> TimerResponseModel {
        
        // validate request
        
        // run gateway
        
        // return a response
        
        return result
    }
}
