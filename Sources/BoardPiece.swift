//
//  BoardPiece.swift
//
//
//  Created by Mark Strijdom on 31/05/2024.
//

import Foundation

struct BoardPiece {
    var label: String // unset title
    var status: SetStatus
    
    var title: String {
        switch status {
        case .notSet:
            return "\(label)"
        case .setByPlayer:
            return "O"
        case .setByComputer:
            return "X"
        }
    }
    
    enum SetStatus {
        case notSet, setByPlayer, setByComputer
    }
}
