//
//  BoardPiece.swift
//
//
//  Created by Mark Strijdom on 31/05/2024.
//

import Foundation

class BoardPiece {
    var label: String // unset title
    var status: SetStatus
    
    var title: String {
        switch status {
        case .notSet:
            return "\(label)"
        case .setByPlayer:
            return " O"
        case .setByComputer:
            return " X"
        }
    }
    
    enum SetStatus {
        case notSet, setByPlayer, setByComputer
    }
    
    func setStatus() {
        if status == .notSet {
            status = .setByComputer
        } 
    }
    
    init(label: String, status: SetStatus) {
        self.label = label
        self.status = status
    }
}
