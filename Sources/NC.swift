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
        playerSelection(choice: userChoice)
        setBoard()
    }
}

func setBoard() {
    for choice in choices {
        print(choice)
    }
}

func startNewGame() {
    setBoard()
}

func playerSelection(choice: String) {
    print("Make your choice:")
    
    if var choice = readLine() {
        switch choice {
        case "TL":
            userChoice = "TL"
            for (index, choice) in choices.enumerated() {
                if choice[index] == "TL" {
                    choice[index] = "TL"
                }
            }
        case "TM":
            userChoice = "TM"
        case "TR":
            userChoice = "TR"
        case "ML":
            userChoice = "ML"
        case "MM":
            userChoice = "MM"
        case "MR":
            userChoice = "MR"
        case "BL":
            userChoice = "BL"
        case "BM":
            userChoice = "BM"
        case "BR":
            userChoice = "BR"
        default:
            print("Invalid choice! Please try again.")
            playerSelection(choice: userChoice)
        }
    }
}



