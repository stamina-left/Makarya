//
//  SaveTimerDataAccess.swift
//  Makarya
//
//  Created by Albert Pangestu on 14/11/21.
//

import Foundation

protocol SaveTimerDataAccess {
    func execute(timer: TimerEntity, completion: @escaping (Result<TimerEntity, Error>) -> Void)
}
