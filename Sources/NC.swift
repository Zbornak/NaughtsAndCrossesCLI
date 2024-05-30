import Figlet

@main
struct NaughtsAndCrosses {
    var choices = ["TL", "TM", "TR", "ML", "MM", "MR", "BL", "BM", "BR"]
    var userChoice = ""
    var opponentChoice = ""
    
    static func main() {
        Figlet.say("Naughts & Crosses")
        print("by zbornak (2024)")
    }
}

func setBoard() {
    
}

func startNewGame() {
    setBoard()
}



