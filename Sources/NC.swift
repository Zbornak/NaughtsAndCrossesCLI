import Figlet
import Foundation

var choices = [
    ["TL", "TM", "TR"],
    ["ML", "MM", "MR"],
    ["BL", "BM", "BR"]
]

var userChoice = ""
var opponentChoice = ""

@main
struct NaughtsAndCrosses {
    static func main() {
        Figlet.say("Naughts & Crosses")
        print("by zbornak (2024)")
        print("")
        startNewGame()
        print("")
        playerSelection(selection: userChoice)
    }
}

func setBoard() {
    for choice in choices {
        print(choice)
    }
}

func startNewGame() {
    userChoice = ""
    opponentChoice = ""
    setBoard()
}

func playerSelection(selection: String) {
    print("Make your choice:")
    
    if var selection = readLine() {
        switch selection {
        case "TL":
            selection = "TL"
        case "TM":
            selection = "TM"
        case "TR":
            selection = "TR"
        case "ML":
            selection = "ML"
        case "MM":
            selection = "MM"
        case "MR":
            selection = "MR"
        case "BL":
            selection = "BL"
        case "BM":
            selection = "BM"
        case "BR":
            selection = "BR"
        default:
            print("Invalid choice, please try again.")
            playerSelection(selection: selection)
        }
        
        print("You have chosen \(selection).")
    }
}


