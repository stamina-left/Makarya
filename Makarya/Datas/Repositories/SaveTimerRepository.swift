//
//  SaveTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 14/11/21.
//

import Foundation

protocol SaveTimerRepository {
    func execute(request: TimerEntity, completion: @escaping (Result<TimerEntity, Error>) -> Void)
}
