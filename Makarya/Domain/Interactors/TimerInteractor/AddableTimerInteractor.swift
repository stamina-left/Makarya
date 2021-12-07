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
}
protocol AddableInteractor {
    
    associatedtype Entity
    associatedtype InteractorError: Error
    
    typealias AddableTimerInteractorCompletion = (Result<Entity, InteractorError>) -> Void
    func add(_ request: Entity, completion: @escaping (AddableTimerInteractorCompletion))
}

struct AddableTimerInteractor: AddableInteractor {
    
    typealias Entity = TimerEntity
    typealias InteractorError = AddableInteractorError
    
    private let repository: AddableTimerRepository
    
    init(repository: AddableTimerRepository) {
        self.repository = repository
    }
    
    func add(_ request: Entity, completion: @escaping (AddableTimerInteractorCompletion)) {
        <#code#>
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
