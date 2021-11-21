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
    
    func execute(request: TimerEntity, completion: @escaping (Result<TimerEntity, Error>) -> Void) {
        
        guard let managedObjectContext = managedObjectContext else {
            return completion(.failure(CoreDataError.failedManagedContext))
        }
        
        // Create Clock from CoreData
        let cdClock = CoreDataClock(context: managedObjectContext)
        cdClock.hours = Int16(request.clock.hours)
        cdClock.minutes = Int16(request.clock.minutes)
        cdClock.seconds = Int16(request.clock.seconds)
        
        // Create Timer from CoreData
        let cdTimer = CoreDataTimer(context: managedObjectContext)
        cdTimer.id = request.id
        cdTimer.ofClock = cdClock
        cdTimer.date = Date()
        cdTimer.state = request.state.rawValue
        
        do {
            // Save Timer into Persistence Store
            try managedObjectContext.save()
        } catch {
            completion(.failure(error))
        }
        
        // TO-DO: Convert Timer CoreData model into TimerEntity.
        completion(.success(request))
    }
    
    enum CoreDataError: Error {
        case failedManagedContext
    }
}
