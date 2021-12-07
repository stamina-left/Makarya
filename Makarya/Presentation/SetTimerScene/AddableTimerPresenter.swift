//
//  AddableTimerPresenter.swift
//  Makarya
//
//  Created by Albert Pangestu on 07/12/21.
//

import Foundation

protocol AddableTimerPresenter {
    
    func show(_ response: TimerEntity)
    func throwError(_ error: AddableInteractorError)
}
