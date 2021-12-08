//
//  TimerPresenter.swift
//  Makarya
//
//  Created by Albert Pangestu on 07/12/21.
//

import Foundation

protocol TimerPresenter {
    
    func show(_ response: TimerEntity)
    func throwError(_ error: AddableInteractorError)
}
