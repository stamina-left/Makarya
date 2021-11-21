//
//  CoreDataManager.swift
//  Makarya
//
//  Created by Albert Pangestu on 20/11/21.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    // MARK: - Properties
    
    private let modelName: String
    
    // MARK: - Core Data Stack
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        
        return managedObjectContext
    }()
    private lazy var managedObjectModel: NSManagedObjectModel = {}()
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {}()
    
    // MARK: - Initialization
    
    init(modelName: String) {
        self.modelName = modelName
    }
}
