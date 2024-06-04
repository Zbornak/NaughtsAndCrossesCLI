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
var humanPieceChoice = ""

var replayChoice = ""

let rules = """
            Take turns marking the Game Board.
            The player who succeeds in placing 
            three of their marks in a horizontal,
            vertical, or diagonal row is the winner.
            
            """

@main
struct NaughtsAndCrosses: ParsableCommand {
    @Option(help: "Choose board piece (either 'X' or 'O')")
    var piece: String
    
    mutating func validate() throws {
        guard piece == "X" || piece == "O" || piece == "x" || piece == "o" else {
            throw ValidationError("Please choose either 'X' or 'O'")
        }
    }
    
    mutating func run() throws {
        humanPieceChoice = piece.uppercased()
        Figlet.say("Naughts & Crosses")
        print("(c) zbornak, 2024")
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
                human.pointsC1 += 8
                human.pointsD1 += 64
            }
        case "TM":
            if TM.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                TM.status = .setByPlayer
                human.pointsR1 += 1
                human.pointsC2 += 16
            }
        case "TR":
            if TR.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                TR.status = .setByPlayer
                human.pointsR1 += 1
                human.pointsC3 += 32
                human.pointsD2 += 128
            }
        case "ML":
            if ML.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                ML.status = .setByPlayer
                human.pointsR2 += 2
                human.pointsC1 += 8
            }
        case "MM":
            if MM.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                MM.status = .setByPlayer
                human.pointsR2 += 2
                human.pointsC2 += 16
                human.pointsD1 += 64
                human.pointsD2 += 128
            }
        case "MR":
            if MR.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                MR.status = .setByPlayer
                human.pointsR2 += 2
                human.pointsC3 += 32
            }
        case "BL":
            if BL.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                BL.status = .setByPlayer
                human.pointsR3 += 4
                human.pointsC1 += 8
                human.pointsD2 += 128
            }
        case "BM":
            if BM.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                BM.status = .setByPlayer
                human.pointsR3 += 4
                human.pointsC2 += 16
            }
        case "BR":
            if BR.status != .notSet {
                print("Invalid choice, please try again.")
                humanSelection(selection: selection)
            } else {
                BR.status = .setByPlayer
                human.pointsR3 += 4
                human.pointsC3 += 32
                human.pointsD1 += 64
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
    let computerMoveChoice = calculateComputerMove()
    
    switch computerMoveChoice {
    case "TL":
        if TL.status != .notSet {
            computerSelection()
        } else {
            TL.status = .setByComputer
            computer.pointsR1 += 1
            computer.pointsC1 += 8
            computer.pointsD1 += 64
        }
    case "TM":
        if TM.status != .notSet {
            computerSelection()
        } else {
            TM.status = .setByComputer
            computer.pointsR1 += 1
            computer.pointsC2 += 16
        }
    case "TR":
        if TR.status != .notSet {
            computerSelection()
        } else {
            TR.status = .setByComputer
            computer.pointsR1 += 1
            computer.pointsC3 += 32
            computer.pointsD2 += 128
        }
    case "ML":
        if ML.status != .notSet {
            computerSelection()
        } else {
            ML.status = .setByComputer
            computer.pointsR2 += 2
            computer.pointsC1 += 8
        }
    case "MM":
        if MM.status != .notSet {
            computerSelection()
        } else {
            MM.status = .setByComputer
            computer.pointsR2 += 2
            computer.pointsC2 += 16
            computer.pointsD1 += 64
            computer.pointsD2 += 128
        }
    case "MR":
        if MR.status != .notSet {
            computerSelection()
        } else {
            MR.status = .setByComputer
            computer.pointsR2 += 2
            computer.pointsC3 += 32
        }
    case "BL":
        if BL.status != .notSet {
            computerSelection()
        } else {
            BL.status = .setByComputer
            computer.pointsR3 += 4
            computer.pointsC1 += 8
            computer.pointsD2 += 128
        }
    case "BM":
        if BM.status != .notSet {
            computerSelection()
        } else {
            BM.status = .setByComputer
            computer.pointsR3 += 4
            computer.pointsC2 += 16
        }
    case "BR":
        if BR.status != .notSet {
            computerSelection()
        } else {
            BR.status = .setByComputer
            computer.pointsR3 += 4
            computer.pointsC3 += 32
            computer.pointsD1 += 64
        }
    default:
        print("Computer could not make a choice this time")
    }
    
    checkGameState()
}

func calculateComputerMove() -> String {
    let computerChoices = ["TL", "TM", "TR", "ML", "MM", "MR", "BL", "BM", "BR"]
    
    if human.pointsR1 == 2 {
        if TL.status == .notSet {
            return "TL"
        } else if TM.status == .notSet {
            return "TM"
        } else {
            return "TR"
        }
    } else if human.pointsR2 == 4 {
        if ML.status == .notSet {
            return "ML"
        } else if MM.status == .notSet {
            return "MM"
        } else {
            return "MR"
        }
    } else if human.pointsR3 == 8 {
        if BL.status == .notSet {
            return "BL"
        } else if BM.status == .notSet {
            return "BM"
        } else {
            return "BR"
        }
    } else if human.pointsC1 == 16 {
        if TL.status == .notSet {
            return "TL"
        } else if ML.status == .notSet {
            return "ML"
        } else {
            return "BL"
        }
    } else if human.pointsC2 == 32 {
        if TM.status == .notSet {
            return "TM"
        } else if MM.status == .notSet {
            return "MM"
        } else {
            return "BM"
        }
    } else if human.pointsC3 == 64 {
        if TR.status == .notSet {
            return "TR"
        } else if MR.status == .notSet {
            return "MR"
        } else {
            return "BR"
        }
    } else if human.pointsD1 == 128 {
        if TL.status == .notSet {
            return "TL"
        } else if MM.status == .notSet {
            return "MM"
        } else {
            return "BR"
        }
    } else if human.pointsD2 == 256 {
        if BL.status == .notSet {
            return "BL"
        } else if MM.status == .notSet {
            return "MM"
        } else {
            return "TR"
        }
    } else {
        return computerChoices.randomElement() ?? "No value found"
    }
}

func checkGameState() {
    if human.pointsR1 == 3 || human.pointsR2 == 6 || human.pointsR3 == 12 || human.pointsC1 == 24 || human.pointsC2 == 48 || human.pointsC3 == 96 || human.pointsD1 == 192 || human.pointsD2 == 384 {
        human.win = true
        drawBoard()
        Figlet.say("You win")
        print("Play again? Y/N")
        replayChoice = readLine()?.uppercased() ?? "No selection"
        endGame(choice: replayChoice)
    } else if computer.pointsR1 == 3 || computer.pointsR2 == 6 || computer.pointsR3 == 12 || computer.pointsC1 == 24 || computer.pointsC2 == 48 || computer.pointsC3 == 96 || computer.pointsD1 == 192 || computer.pointsD2 == 384 {
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

