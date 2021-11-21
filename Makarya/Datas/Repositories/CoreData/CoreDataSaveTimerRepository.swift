//
//  CoreDataSaveTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 17/11/21.
//

import Foundation
import CoreData

final class CoreDataSaveTimerRepository: SaveTimerRepository {
    
    var managedObjectContext: NSManagedObjectContext?
    
    func execute(timer: TimerEntity,
                 completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let managedObjectContext = managedObjectContext else {
            return completion(.failure(CoreDataError.failedManagedContext))
        }
        
        // Create Clock from CoreData
        let cdClock = CoreDataClock(context: managedObjectContext)
        cdClock.hours = Int16(timer.clock.hours)
        cdClock.minutes = Int16(timer.clock.minutes)
        cdClock.seconds = Int16(timer.clock.seconds)
        
        // Create Timer from CoreData
        let cdTimer = CoreDataTimer(context: managedObjectContext)
        cdTimer.id = timer.id
        cdTimer.ofClock = cdClock
        cdTimer.date = Date()
        cdTimer.state = timer.state.rawValue
        
        do {
            // Save Timer into Persistence Store
            try managedObjectContext.save()
        } catch {
            completion(.failure(error))
        }
        
        // TO-DO: Convert Timer CoreData model into TimerEntity.
        completion(.success(()))
    }
    
    enum CoreDataError: Error {
        case failedManagedContext
    }
}
