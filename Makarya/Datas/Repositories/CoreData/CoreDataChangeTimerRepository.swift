//
//  CoreDataChangeTimerRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 24/11/21.
//

import Foundation
import CoreData

final class CoreDataChangeTimerRepository: ChangeTimerRepository {
    
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager(modelName: "CoreDataTimer", storeType: NSSQLiteStoreType)) {
        self.coreDataManager = coreDataManager
    }
    
    func execute(timer: TimerEntity, completion: @escaping (Result<TimerEntity, Error>) -> Void) {
        <#code#>
    }
}
