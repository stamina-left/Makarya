//
//  CoreDataSaveTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 17/11/21.
//

import Foundation
import CoreData

final class CoreDataSaveTimerRepository: AddableRepository {
    
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager(modelName: "CoreDataTimer", storeType: NSSQLiteStoreType)) {
        self.coreDataManager = coreDataManager
    }
    
    func execute(timer: TimerEntity,
                 completion: @escaping (Result<Void, Error>) -> Void) {
        
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
            // Save Timer into Persistence Store
            try coreDataManager.managedObjectContext.save()
        } catch {
            completion(.failure(error))
        }
        
        completion(.success(()))
    }
    
    enum CoreDataError: Error {
        case failedManagedContext
    }
}
