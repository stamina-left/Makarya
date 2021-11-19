//
//  SetTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol SetTimerInteractor {
    func execute(requestParameter: TimerRequestModel,
                 completion: @escaping (Result<TimerResponseModel, Error>) -> Void)
}

final class SetTimerInteractorImplementation: SetTimerInteractor {
    
    private let dataAccess: SaveTimerDataAccess
    
    init(dataAccess: SaveTimerDataAccess) {
        self.dataAccess = dataAccess
    }
    
    func execute(requestParameter: TimerRequestModel,
                 completion: @escaping (Result<TimerResponseModel, Error>) -> Void) {
        
        do {
            try ClockValueObjectValidation().validate(requestParameter)
            
            let clock = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
            let timer = TimerEntity(clock: clock, date: requestParameter.date)
            
            let result = TimerResponseModel(timer: timer)
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }
}
