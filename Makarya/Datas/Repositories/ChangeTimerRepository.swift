//
//  ChangeTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 24/11/21.
//

import Foundation

protocol ChangeTimerRepository {
    func execute(timer: TimerEntity,
                 completion: @escaping (Result<TimerEntity, Error>) -> Void)
}
