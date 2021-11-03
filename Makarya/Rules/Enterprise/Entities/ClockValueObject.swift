//
//  ClockValueObject.swift
//  Makarya
//
//  Created by Albert Pangestu on 04/11/21.
//

import Foundation

struct ClockValueObject: Equatable {
    let hours: Int
    let minutes: Int
    let seconds: Int
    
    init?(hours: Int, minutes: Int, seconds: Int) {
        guard 0...23 ~= hours else {
            return nil
        }
        
        guard 0...60 ~= minutes else {
            return nil
        }
    }
}
