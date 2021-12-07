//
//  SaveTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 14/11/21.
//

import Foundation

protocol SaveTimerRepository {
    func execute(timer: TimerEntity,
                 completion: @escaping (Result<Void, Error>) -> Void)
}