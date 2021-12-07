//
//  AddableTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 14/11/21.
//

import Foundation

enum AddableTimerRepositoryError: Swift.Error {
    case failedManagedContext
}

protocol AddableTimerRepository {
    
    typealias AddableTimerRepositoryCompletion = (Result<TimerEntity, AddableTimerRepositoryError>) -> Void
    func execute(timer: TimerEntity, completion: @escaping AddableTimerRepositoryCompletion)
}
