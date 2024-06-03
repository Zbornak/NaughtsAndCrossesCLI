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

var human = Player()
var computer = Player()

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
    humanSelection(selection: human.choice)
    drawBoard()
}

func computerTurn() {
    computerSelection()
    drawBoard()
}

func humanSelection(selection: String) {
    print("Make your choice: ", terminator: "")
    
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
        default:
            print("Invalid choice, please try again.")
            humanSelection(selection: selection)
        }
    }
    
    checkGameState()
}

func computerSelection() {
    print("My choice is:")
    
    //until human reaches 2 win points:
    
    
    // if human is about to win (2 win points):
    if human.pointsR1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if TM.status != .setByPlayer {
            TM.status = .setByComputer
        } else {
            TR.status = .setByComputer
        }
    } else if human.pointsR2 == 2 {
        if ML.status != .setByPlayer {
            ML.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            MR.status = .setByComputer
        }
    } else if human.pointsR3 == 2 {
        if BL.status != .setByPlayer {
            BL.status = .setByComputer
        } else if BM.status != .setByPlayer {
            BM.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if human.pointsC1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if ML.status != .setByPlayer {
            ML.status = .setByComputer
        } else {
            BL.status = .setByComputer
        }
    } else if human.pointsC2 == 2 {
        if TM.status != .setByPlayer {
            TM.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            BM.status = .setByComputer
        }
    } else if human.pointsC3 == 2 {
        if TR.status != .setByPlayer {
            TR.status = .setByComputer
        } else if MR.status != .setByPlayer {
            MR.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if human.pointsD1 == 2 {
        if TL.status != .setByPlayer {
            TL.status = .setByComputer
        } else if MM.status != .setByPlayer {
            MM.status = .setByComputer
        } else {
            BR.status = .setByComputer
        }
    } else if human.pointsD2 == 2 {
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
    if human.pointsR1 == 3 || human.pointsR2 == 3 || human.pointsR1 == 3 || human.pointsC1 == 3 || human.pointsC2 == 3 || human.pointsC3 == 3 || human.pointsD1 == 3 || human.pointsD2 == 3 {
        human.win = true
        Figlet.say("You win")
        print("Play again? Y/N")
        replayChoice = readLine()?.uppercased() ?? "No selection"
        endGame(choice: replayChoice)
    } else if computer.pointsR1 == 3 || computer.pointsR2 == 3 || computer.pointsR1 == 3 || computer.pointsC1 == 3 || computer.pointsC2 == 3 || computer.pointsC3 == 3 || computer.pointsD1 == 3 || computer.pointsD2 == 3 {
        computer.win = true
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

