//
//  ClockInteractor.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

protocol ClockInteractor {
    func parseClock(hours: Int, minutes: Int, seconds: Int) -> ClockValueObject
}
