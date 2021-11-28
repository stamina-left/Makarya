//
//  SetTimerPresenter.swift
//  Makarya
//
//  Created by Albert Pangestu on 28/11/21.
//

import Foundation

protocol SetTimerPresenter {
    func execute(response: TimerResponseModel, completion: @escaping (Result<TimerViewModel, Error>) -> Void)
}
