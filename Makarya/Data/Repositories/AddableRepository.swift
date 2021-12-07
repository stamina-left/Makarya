//
//  AddableRepository.swift
//  Makarya
//
//  Created by Albert Pangestu on 14/11/21.
//

import Foundation

protocol AddableRepository {
    
    typealias AddableRepositoryCompletion = (Result<Entity, Error>) -> Void
    func execute(timer: Entity, completion: @escaping AddableRepositoryCompletion)
}
