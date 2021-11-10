//
//  ChangeTimerActionInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 10/11/21.
//

import Foundation

protocol ChangeTimerActionInteractor {
    func execute(requestParameter: TimerRequestModel) throws -> TimerResponseModel
}

final class ChangeTimerActionInteractorImplementation: ChangeTimerActionInteractor {
    
    func execute(requestParameter: TimerRequestModel) throws -> TimerResponseModel {
        
    }
}
