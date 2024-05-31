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
        case "TM":
            TM.status = .setByPlayer
        case "TR":
            TR.status = .setByPlayer
        case "ML":
            ML.status = .setByPlayer
        case "MM":
            MM.status = .setByPlayer
        case "MR":
            MR.status = .setByPlayer
        case "BL":
            BL.status = .setByPlayer
        case "BM":
            BM.status = .setByPlayer
        case "BR":
            BR.status = .setByPlayer
        default:
            print("Invalid choice, please try again.")
            playerSelection(selection: selection)
        }
    }
}

func computerSelection(userSelection: String, selection: String) {
    
    print("")
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

