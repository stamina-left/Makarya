//
//  CoreDataSaveTimerDataAccess.swift
//  Makarya
//
//  Created by Albert Pangestu on 17/11/21.
//

import UIKit
import CoreData

final class CoreDataSaveTimerDataAccess: SaveTimerDataAccess {
    
    func execute(timer: TimerEntity, completion: @escaping (Result<TimerEntity, Error>) -> Void) {
        
        guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
        }
    }
}
