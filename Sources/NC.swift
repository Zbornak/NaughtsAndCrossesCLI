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

var userChoice: String?
var userWins = false

var computerChoice: String?
var computerWins = false

@main
struct NaughtsAndCrosses {
    static func main() {
        Figlet.say("Naughts & Crosses")
        print("(c) zbornak, 2024")
        print("")
        drawBoard()
        print("")
        playerTurn()
        //computerTurn()
    }
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
    playerSelection(selection: userChoice ?? "No choice made.")
    drawBoard()
}

func computerTurn() {
    computerSelection(selection: computerChoice ?? "No choice made.")
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

func computerSelection(selection: String) {
    print("")
    print("My choice is: \(computerChoice ?? "No choice made").")
}

func checkForWin(board: [[String]]) {
   // check to see if either player or computer has won
}

