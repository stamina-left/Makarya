//
//  CoreDataUpdatableTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 24/11/21.
//

import Foundation
import CoreData

final class CoreDataUpdatableTimerRepository: UpdatableTimerRepository {
    
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager(modelName: "CoreDataTimer", storeType: NSSQLiteStoreType)) {
        self.coreDataManager = coreDataManager
    }
    
    func execute(timer: TimerEntity, completion: @escaping (Result<TimerEntity, Error>) -> Void) {
        
        // Create Clock from CoreData
        let cdClock = CoreDataClock(context: coreDataManager.managedObjectContext)
        cdClock.hours = Int16(timer.clock.hours)
        cdClock.minutes = Int16(timer.clock.minutes)
        cdClock.seconds = Int16(timer.clock.seconds)
        
        // Create Timer from CoreData
        let cdTimer = CoreDataTimer(context: coreDataManager.managedObjectContext)
        cdTimer.id = timer.id
        cdTimer.ofClock = cdClock
        cdTimer.date = Date()
        cdTimer.state = timer.state.rawValue
        
        do {
            // Update changes
            try coreDataManager.managedObjectContext.save()
            // WARN: No completion success.
        } catch {
            completion(.failure(error))
        }
    }
}
