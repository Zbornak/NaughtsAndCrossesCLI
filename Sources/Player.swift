//
//  Player.swift
//  
//
//  Created by Mark Strijdom on 03/06/2024.
//

import Foundation

struct Player {
    var choice = ""
    var pointsR1 = 0
    var pointsR2 = 0
    var pointsR3 = 0
    var pointsC1 = 0
    var pointsC2 = 0
    var pointsC3 = 0
    var pointsD1 = 0
    var pointsD2 = 0
    var win = false
    
    mutating func reset() {
        pointsR1 = 0
        pointsR2 = 0
        pointsR3 = 0
        pointsC1 = 0
        pointsC2 = 0
        pointsC3 = 0
        pointsD1 = 0
        pointsD2 = 0
        win = false
    }
}
