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
    
    private let dataAccess: SaveTimerRepository
    
    init(dataAccess: SaveTimerRepository) {
        self.dataAccess = dataAccess
    }
    
    func execute(requestParameter: TimerRequestModel,
                 completion: @escaping (Result<TimerResponseModel, Error>) -> Void) {
        
        do {
            try ClockValueObjectValidation().validate(requestParameter)
            
            let clockRequest = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
            let timerRequest = TimerEntity(clock: clockRequest, date: requestParameter.date)
            
            dataAccess.execute(timer: timerRequest) { result in
                switch result {
                case .success():
                    let response = TimerResponseModel(timer: timer)
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
