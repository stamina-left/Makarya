//
//  TestCoreDataManager.swift
//  MakaryaTests
//
//  Created by Albert Pangestu on 22/11/21.
//

import XCTest
import CoreData
import Makarya

class TestCoreDataManager {

    func create() -> CoreDataManager {
        
        return CoreDataManager(modelName: "Makarya",
                                        storeType: NSInMemoryStoreType)
    }

}
