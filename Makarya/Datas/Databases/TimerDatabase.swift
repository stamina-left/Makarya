//
//  TimerDatabase.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

protocol TimerDatabase {
    func saveTimer(timer: TimerEntity)
}

//final class TimerDatabaseImplementation: TimerDatabase {
//    
//    func saveTimer(timer: TimerEntity) {
//        return timer
//    }
//}
