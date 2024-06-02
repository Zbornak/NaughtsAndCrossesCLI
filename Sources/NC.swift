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

var playerChoice = ""
var playerPointsR1 = 0
var playerPointsR2 = 0
var playerPointsR3 = 0
var playerPointsC1 = 0
var playerPointsC2 = 0
var playerPointsC3 = 0
var playerPointsD1 = 0
var playerPointsD2 = 0
var playerWins = false

var computerWins = false

var replayChoice = ""

@main
struct NaughtsAndCrosses {
    static func main() {
        Figlet.say("Naughts & Crosses")
        print("(c) zbornak, 2024")
        newGame()
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
    
    playerPointsR1 = 0
    playerPointsR2 = 0
    playerPointsR3 = 0
    playerPointsC1 = 0
    playerPointsC2 = 0
    playerPointsC3 = 0
    playerPointsD1 = 0
    playerPointsD2 = 0
    
    playerWins = false
    computerWins = false
    
    drawBoard()
    
    while !playerWins || !computerWins {
        playerTurn()
        computerTurn()
    }
}

func drawBoard() {
    let choices = [
        [TL.title, TM.title, TR.title],
        [ML.title, MM.title, MR.title],
        [BL.title, BM.title, BR.title]
    ]
    
    for row in choices {
        for i in row {
            print(i, terminator: "   ")
        }
        
        print()
    }
    
    print("")
}

func playerTurn() {
    playerSelection(selection: playerChoice)
    drawBoard()
}

func computerTurn() {
    computerSelection()
    drawBoard()
}

func playerSelection(selection: String) {
    print("Make your choice: ", terminator: "")
    
    if let selection = readLine()?.uppercased() {
        switch selection {
        case "TL":
            TL.status = .setByPlayer
            playerPointsR1 += 1
            playerPointsC1 += 1
            playerPointsD1 += 1
        case "TM":
            TM.status = .setByPlayer
            playerPointsR1 += 1
            playerPointsC2 += 1
        case "TR":
            TR.status = .setByPlayer
            playerPointsR1 += 1
            playerPointsC3 += 1
            playerPointsD2 += 1
        case "ML":
            ML.status = .setByPlayer
            playerPointsR2 += 1
            playerPointsC1 += 1
        case "MM":
            MM.status = .setByPlayer
            playerPointsR2 += 1
            playerPointsC2 += 1
            playerPointsD1 += 1
            playerPointsD2 += 1
        case "MR":
            MR.status = .setByPlayer
            playerPointsR2 += 1
            playerPointsC3 += 1
        case "BL":
            BL.status = .setByPlayer
            playerPointsR3 += 1
            playerPointsC1 += 1
            playerPointsD2 += 1
        case "BM":
            BM.status = .setByPlayer
            playerPointsR3 += 1
            playerPointsC2 += 1
        case "BR":
            BR.status = .setByPlayer
            playerPointsR3 += 1
            playerPointsC3 += 1
            playerPointsD1 += 1
        default:
            print("Invalid choice, please try again.")
            playerSelection(selection: selection)
        }
    }
    
    checkGameState()
}

func computerSelection() {
    print("My choice is:")
    
    //until player reaches 2 win points:
    
    
    // if player is about to win (2 win points):
    if playerPointsR1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if TM.status != .setByPlayer {
            TM.status = .setByComputer
        } else {
            TR.status = .setByComputer
        }
    } else if playerPointsR2 == 2 {
        if ML.status != .setByPlayer {
            ML.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            MR.status = .setByComputer
        }
    } else if playerPointsR3 == 2 {
        if BL.status != .setByPlayer {
            BL.status = .setByComputer
        } else if BM.status != .setByPlayer {
            BM.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if playerPointsC1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if ML.status != .setByPlayer {
            ML.status = .setByComputer
        } else {
            BL.status = .setByComputer
        }
    } else if playerPointsC2 == 2 {
        if TM.status != .setByPlayer {
            TM.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            BM.status = .setByComputer
        }
    } else if playerPointsC3 == 2 {
        if TR.status != .setByPlayer {
            TR.status = .setByComputer
        } else if MR.status != .setByPlayer {
            MR.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if playerPointsD1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if playerPointsD2 == 2 {
        if BL.status != .setByPlayer {
            BL.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            TR.status = .setByComputer
        }
    }
    
    checkGameState()
}

func checkGameState() {
    if playerPointsR1 == 3 || playerPointsR2 == 3 || playerPointsR1 == 3 || playerPointsC1 == 3 || playerPointsC2 == 3 || playerPointsC3 == 3 || playerPointsD1 == 3 || playerPointsD2 == 3 {
        playerWins = true
        Figlet.say("You win")
        print("Play again? Y/N")
        replayChoice = readLine()?.uppercased() ?? "No selection"
        endGame(choice: replayChoice)
    }
}

func endGame(choice: String) {
    if choice == "N" {
        exit(0)
    } else if choice == "Y" {
        newGame()
    }
}

