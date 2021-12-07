//
//  AddableTimerInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 05/11/21.
//

import Foundation

enum AddableInteractorError: Error {
    case invalidHours
    case invalidMinutes
    case invalidSeconds
    case repositoryError
}

protocol AddableInteractor {
    
    associatedtype Request
    associatedtype Response
    associatedtype InteractorError: Error
    
    typealias AddableTimerInteractorCompletion = (Result<Response, InteractorError>) -> Void
    func add(_ request: Request, completion: @escaping (AddableTimerInteractorCompletion))
}

struct AddableTimerInteractor: AddableInteractor {
    
    typealias Request = TimerEntity
    typealias Response = Void
    typealias InteractorError = AddableInteractorError
    
    private let repository: AddableTimerRepository
    private let presenter: AddableTimerPresenter
    
    init(repository: AddableTimerRepository,
         presenter: AddableTimerPresenter) {
        self.repository = repository
        self.presenter = presenter
    }
    
    func add(_ request: Request, completion: @escaping (AddableTimerInteractorCompletion)) {
        
        // Validate the request
        guard 0...23 ~= request.clock.hours else {
            return completion(.failure(.invalidHours))
        }
        
        guard 0...60 ~= request.clock.minutes else {
            return completion(.failure(.invalidMinutes))
        }
        
        guard 0...60 ~= request.clock.seconds else {
            return completion(.failure(.invalidSeconds))
        }
        
        repository.execute(timer: request) { result in
            switch result {
            case .success(let response):
                presenter.show(response)
            case .failure(_):
                completion(.failure(.repositoryError))
            }
        }
            
    }
}

//final class SetTimerInteractorImplementation {
//
//    private let repository: AddableRepository
//
//    init(repository: SaveTimerRepository) {
//        self.repository = repository
//    }
//
//    func execute(request: TimerRequest,
//                 completion: @escaping (Result<TimerResponse, Error>) -> Void) {
//
//        do {
//
//            try ClockValueObjectValidation().validate(request)
//
//            let clock = ClockValueObject(hours: request.hours,
//                                         minutes: request.minutes,
//                                         seconds: request.seconds)
//            let timer = TimerEntity(clock: clock,
//                                    date: request.date)
//
//            repository.execute(timer: timer) { result in
//                switch result {
//                case .success():
//                    let response = TimerResponseModel(timer: timer)
//                    completion(.success(response))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//}
