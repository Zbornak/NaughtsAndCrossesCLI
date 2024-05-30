import Figlet
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

var TL = BoardPiece(label: "TL", status: .notSet)
var TM = BoardPiece(label: "TM", status: .notSet)
var TR = BoardPiece(label: "TR", status: .notSet)
var ML = BoardPiece(label: "ML", status: .notSet)
var MM = BoardPiece(label: "MM", status: .notSet)
var MR = BoardPiece(label: "MR", status: .notSet)
var BL = BoardPiece(label: "BL", status: .notSet)
var BM = BoardPiece(label: "BM", status: .notSet)
var BR = BoardPiece(label: "BR", status: .notSet)

let choices = [
    [TL.title, TM.title, TR.title],
    [ML.title, MM.title, MR.title],
    [BL.title, BM.title, BR.title]
]

var userChoice = ""
var computerChoice = ""

@main
struct NaughtsAndCrosses {
    static func main() {
        Figlet.say("Naughts & Crosses")
        print("by zbornak (2024)")
        print("")
        drawBoard()
        print("")
        playerTurn()
    }
}

func drawBoard() {
    for choice in choices {
        print(choice)
    }
}

func playerTurn() {
    playerSelection(selection: userChoice)
    drawBoard()
}

func playerSelection(selection: String) {
    print("Make your choice:")
    
    if var selection = readLine() {
        switch selection {
        case "TL":
            TL.status = .setByPlayer
        case "TM":
            TM.status = .setByPlayer
        case "TR":
            TM.status = .setByPlayer
        case "ML":
            TM.status = .setByPlayer
        case "MM":
            TM.status = .setByPlayer
        case "MR":
            TM.status = .setByPlayer
        case "BL":
            TM.status = .setByPlayer
        case "BM":
            TM.status = .setByPlayer
        case "BR":
            TM.status = .setByPlayer
        default:
            print("Invalid choice, please try again.")
            playerSelection(selection: selection)
        }
    }
}


