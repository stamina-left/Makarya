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
        
        let clock = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
        let timer = TimerEntity(clock: clock, date: Date())
        
        // run gateway
        
        let result = TimerResponseModel(timer: timer)
        return result
    }
}
