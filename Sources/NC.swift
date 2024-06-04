//
//  NC.swift
//
//
//  Created by Mark Strijdom on 29/05/2024.
//

import ArgumentParser
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

var human = Player()
var computer = Player()

var humanMoveChoice = ""
var computerMoveChoice = ""

var replayChoice = ""

let rules = """
            Take turns marking the Game Board (you are 'O' and the computer is 'X').
            The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.
            
            """

@main
struct NaughtsAndCrosses: ParsableCommand {
    @Option(help: "Choose board piece (either 'X' or 'O')")
    var piece: String
    
    mutating func run() throws {
        Figlet.say("Naughts & Crosses")
        print("(c) zbornak, 2024")
        print(piece)
        newGame()
    }
}

func newGame() {
    TL.reset()
    TM.reset()
    TR.reset()
    ML.reset()
    MM.reset()
    MR.reset()
    BL.reset()
    BM.reset()
    BR.reset()
    
    human.reset()
    computer.reset()
    
    drawBoard()
    
    while !human.win || !computer.win {
        humanTurn()
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

func humanTurn() {
    humanSelection(selection: humanMoveChoice)
    drawBoard()
}

func computerTurn() {
    computerSelection()
    drawBoard()
}

func humanSelection(selection: String) {
    print("Make your choice (for rules type 'R'): ", terminator: "")
    
    if let selection = readLine()?.uppercased() {
        switch selection {
        case "TL":
            if TL.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                TL.status = .setByPlayer
                human.pointsR1 += 1
                human.pointsC1 += 1
                human.pointsD1 += 1
            }
        case "TM":
            if TM.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                TM.status = .setByPlayer
                human.pointsR1 += 1
                human.pointsC2 += 1
            }
        case "TR":
            if TR.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                TR.status = .setByPlayer
                human.pointsR1 += 1
                human.pointsC3 += 1
                human.pointsD2 += 1
            }
        case "ML":
            if ML.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                ML.status = .setByPlayer
                human.pointsR2 += 1
                human.pointsC1 += 1
            }
        case "MM":
            if MM.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                MM.status = .setByPlayer
                human.pointsR2 += 1
                human.pointsC2 += 1
                human.pointsD1 += 1
                human.pointsD2 += 1
            }
        case "MR":
            if MR.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                MR.status = .setByPlayer
                human.pointsR2 += 1
                human.pointsC3 += 1
            }
        case "BL":
            if BL.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                BL.status = .setByPlayer
                human.pointsR3 += 1
                human.pointsC1 += 1
                human.pointsD2 += 1
            }
        case "BM":
            if BM.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                BM.status = .setByPlayer
                human.pointsR3 += 1
                human.pointsC2 += 1
            }
        case "BR":
            if BR.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                BR.status = .setByPlayer
                human.pointsR3 += 1
                human.pointsC3 += 1
                human.pointsD1 += 1
            }
        case "R":
            print(rules)
            drawBoard()
            humanSelection(selection: selection)
        default:
            print("Invalid choice, please try again.")
            humanSelection(selection: selection)
        }
    }
    
    checkGameState()
}

func computerSelection() {
    let computerChoices = ["TL", "TM", "TR", "ML", "MM", "MR", "BL", "BM", "BR"]
    computerMoveChoice = computerChoices.randomElement() ?? "No value found"
    
    switch computerMoveChoice {
    case "TL":
        if TL.status != .notSet {
            computerSelection()
        } else {
            TL.status = .setByComputer
            computer.pointsR1 += 1
            computer.pointsC1 += 1
            computer.pointsD1 += 1
        }
    case "TM":
        if TM.status != .notSet {
            computerSelection()
        } else {
            TM.status = .setByComputer
            computer.pointsR1 += 1
            computer.pointsC2 += 1
        }
    case "TR":
        if TR.status != .notSet {
            computerSelection()
        } else {
            TR.status = .setByComputer
            computer.pointsR1 += 1
            computer.pointsC3 += 1
            computer.pointsD2 += 1
        }
    case "ML":
        if ML.status != .notSet {
            computerSelection()
        } else {
            ML.status = .setByComputer
            computer.pointsR2 += 1
            computer.pointsC1 += 1
        }
    case "MM":
        if MM.status != .notSet {
            computerSelection()
        } else {
            MM.status = .setByComputer
            computer.pointsR2 += 1
            computer.pointsC2 += 1
            computer.pointsD1 += 1
            computer.pointsD2 += 1
        }
    case "MR":
        if MR.status != .notSet {
            computerSelection()
        } else {
            MR.status = .setByComputer
            computer.pointsR2 += 1
            computer.pointsC3 += 1
        }
    case "BL":
        if BL.status != .notSet {
            computerSelection()
        } else {
            BL.status = .setByComputer
            computer.pointsR3 += 1
            computer.pointsC1 += 1
            computer.pointsD2 += 1
        }
    case "BM":
        if BM.status != .notSet {
            computerSelection()
        } else {
            BM.status = .setByComputer
            computer.pointsR3 += 1
            computer.pointsC2 += 1
        }
    case "BR":
        if BR.status != .notSet {
            computerSelection()
        } else {
            BR.status = .setByComputer
            computer.pointsR3 += 1
            computer.pointsC3 += 1
            computer.pointsD1 += 1
        }
    default:
        print("Computer could not make a choice this time")
    }
    
    checkGameState()
}

func checkGameState() {
    if human.pointsR1 == 3 || human.pointsR2 == 3 || human.pointsR1 == 3 || human.pointsC1 == 3 || human.pointsC2 == 3 || human.pointsC3 == 3 || human.pointsD1 == 3 || human.pointsD2 == 3 {
        human.win = true
        drawBoard()
        Figlet.say("You win")
        print("Play again? Y/N")
        replayChoice = readLine()?.uppercased() ?? "No selection"
        endGame(choice: replayChoice)
    } else if computer.pointsR1 == 3 || computer.pointsR2 == 3 || computer.pointsR1 == 3 || computer.pointsC1 == 3 || computer.pointsC2 == 3 || computer.pointsC3 == 3 || computer.pointsD1 == 3 || computer.pointsD2 == 3 {
        computer.win = true
        drawBoard()
        Figlet.say("You lose")
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

