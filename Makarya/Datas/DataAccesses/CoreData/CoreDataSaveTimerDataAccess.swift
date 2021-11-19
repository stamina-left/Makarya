//
//  CoreDataSaveTimerDataAccess.swift
//  Makarya
//
//  Created by Albert Pangestu on 17/11/21.
//

import Foundation
import CoreData

final class CoreDataSaveTimerDataAccess: SaveTimerDataAccess {
    
    var managedObjectContext: NSManagedObjectContext?
    
    func execute(timer: TimerEntity, completion: @escaping (Result<TimerEntity, Error>) -> Void) {
        
        guard let managedObjectContext = managedObjectContext else {
            completion(.failure(CoreDataError.failedManagedContext))
        }
        
        // Create Timer from CoreData
        let timer = Timer(context: managedObjectContext)
    }
    
    enum CoreDataError: Error {
        case failedManagedContext
    }
}
