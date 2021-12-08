//
//  UpdatableTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 24/11/21.
//

import Foundation

protocol UpdatableTimerRepository {
    
    typealias UpdatableTimerRepositoryCompletion = (Result<TimerEntity, Error>) -> Void
    func execute(timer: TimerEntity, completion: @escaping UpdatableTimerRepositoryCompletion)
}
