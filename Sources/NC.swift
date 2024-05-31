//
//  NC.swift
//
//
//  Created by Mark Strijdom on 29/05/2024.
//

import Figlet
import Foundation

var TL = BoardPiece(label: "TL", status: .notSet)
var TM = BoardPiece(label: "TM", status: .notSet)
var TR = BoardPiece(label: "TR", status: .notSet)
var ML = BoardPiece(label: "ML", status: .notSet)
var MM = BoardPiece(label: "MM", status: .notSet)
var MR = BoardPiece(label: "MR", status: .notSet)
var BL = BoardPiece(label: "BL", status: .notSet)
var BM = BoardPiece(label: "BM", status: .notSet)
var BR = BoardPiece(label: "BR", status: .notSet)

var userChoice = ""
var userPointsR1 = 0
var userPointsR2 = 0
var userPointsR3 = 0
var userPointsC1 = 0
var userPointsC2 = 0
var userPointsC3 = 0
var userPointsD1 = 0
var userPointsD2 = 0
var userWins = false

var computerChoice = ""
var computerWins = false

var replayChoice = ""

@main
struct NaughtsAndCrosses {
    static func main() {
        Figlet.say("Naughts & Crosses")
        print("(c) zbornak, 2024")
        newGame()
        print("Play again? Y/N")
        replayChoice = readLine()?.uppercased() ?? "No selection"
        endGame(choice: replayChoice)
    }
}

func newGame() {
    TL.status = .notSet
    TM.status = .notSet
    TR.status = .notSet
    ML.status = .notSet
    MM.status = .notSet
    MR.status = .notSet
    BL.status = .notSet
    BM.status = .notSet
    BR.status = .notSet
    print("Board:")
    drawBoard()
    playerTurn()
    computerTurn()
}

func drawBoard() {
    let choices = [
        [TL.title, TM.title, TR.title],
        [ML.title, MM.title, MR.title],
        [BL.title, BM.title, BR.title]
    ]
    
    for choice in choices {
        print(choice)
    }
    
    checkForWin(board: choices)
}

func playerTurn() {
    playerSelection(selection: userChoice)
    drawBoard()
}

func computerTurn() {
    computerSelection(userSelection: userChoice, selection: computerChoice)
    drawBoard()
}

func playerSelection(selection: String) {
    print("Make your choice:")
    
    if let selection = readLine()?.uppercased() {
        switch selection {
        case "TL":
            TL.status = .setByPlayer
            userPointsR1 += 1
            userPointsC1 += 1
            userPointsD1 += 1
        case "TM":
            TM.status = .setByPlayer
            userPointsR1 += 1
            userPointsC2 += 1
        case "TR":
            TR.status = .setByPlayer
            userPointsR1 += 1
            userPointsC3 += 1
            userPointsD2 += 1
        case "ML":
            ML.status = .setByPlayer
            userPointsR2 += 1
            userPointsC1 += 1
        case "MM":
            MM.status = .setByPlayer
            userPointsR2 += 1
            userPointsC2 += 1
            userPointsD1 += 1
            userPointsD2 += 1
        case "MR":
            MR.status = .setByPlayer
            userPointsR2 += 1
            userPointsC3 += 1
        case "BL":
            BL.status = .setByPlayer
            userPointsR3 += 1
            userPointsC1 += 1
            userPointsD2 += 1
        case "BM":
            BM.status = .setByPlayer
            userPointsR3 += 1
            userPointsC2 += 1
        case "BR":
            BR.status = .setByPlayer
            userPointsR3 += 1
            userPointsC3 += 1
            userPointsD1 += 1
        default:
            print("Invalid choice, please try again.")
            playerSelection(selection: selection)
        }
    }
}

func computerSelection(userSelection: String, selection: String) {
    if userPointsR1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if TM.status != .setByPlayer {
            TM.status = .setByComputer
        } else {
            TR.status = .setByComputer
        }
    } else if userPointsR2 == 2 {
        if ML.status != .setByPlayer {
            ML.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            MR.status = .setByComputer
        }
    } else if userPointsR3 == 2 {
        if BL.status != .setByPlayer {
            BL.status = .setByComputer
        } else if BM.status != .setByPlayer {
            BM.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if userPointsC1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if ML.status != .setByPlayer {
            ML.status = .setByComputer
        } else {
            BL.status = .setByComputer
        }
    } else if userPointsC2 == 2 {
        if TM.status != .setByPlayer {
            TM.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            BM.status = .setByComputer
        }
    } else if userPointsC3 == 2 {
        if TR.status != .setByPlayer {
            TR.status = .setByComputer
        } else if MR.status != .setByPlayer {
            MR.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if userPointsD1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if userPointsD2 == 2 {
        if BL.status != .setByPlayer {
            BL.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            TR.status = .setByComputer
        }
    }
    
    print("My choice is: \(computerChoice).")
}

func checkForWin(board: [[String]]) {
   // check to see if either player or computer has won
}

func endGame(choice: String) {
    if choice == "N" {
        exit(0)
    } else if choice == "Y" {
        newGame()
    }
}

