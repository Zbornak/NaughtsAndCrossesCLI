import Figlet

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
        print("Make your choice:")
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
    
    setBoard()
}



