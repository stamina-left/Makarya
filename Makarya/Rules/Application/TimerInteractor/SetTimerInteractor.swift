//
//  SetTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

protocol SetTimerInteractor {
    func execute(request: TimerRequest,
                 completion: @escaping (Result<TimerResponseModel, Error>) -> Void)
}

final class SetTimerInteractorImplementation: SetTimerInteractor {
    
    private let repository: SaveTimerRepository
    
    init(repository: SaveTimerRepository) {
        self.repository = repository
    }
    
    func execute(request: TimerRequest,
                 completion: @escaping (Result<TimerResponseModel, Error>) -> Void) {
        
        do {
            try ClockValueObjectValidation().validate(requestParameter)
            
            let clockRequest = ClockValueObject(hours: requestParameter.hours, minutes: requestParameter.minutes, seconds: requestParameter.seconds)
            let timer = TimerEntity(clock: clockRequest, date: requestParameter.date)
            
            repository.execute(timer: timer) { result in
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
