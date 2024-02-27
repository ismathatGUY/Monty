import Foundation

class Game: ObservableObject {
    @Published var cards: [Card] = []
    @Published var isGameActive: Bool = true
    @Published var showWinner: Bool = false
    @Published var showLoser: Bool = false

    init() {
        newGame()
    }

    func newGame() {
        cards = [
            Card(),
            Card(),
            Card()
        ]
        isGameActive = true
        resetWinnerLoser()
    }

    func onTap(card: Card) {
        // Check if the game is still active
        guard isGameActive else { return }

        // Handle the game logic here
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            // Randomize the Ace property each time a card is tapped
            cards[index].randomizeAce()

            // Toggle the faceUp state
            cards[index].isFaceUp.toggle()

            // Set Winner and Loser properties
            cards[index].setWinnerLoser()

            // Deactivate the game
            isGameActive = false
        }
    }

    func resetWinnerLoser() {
        showWinner = false
        showLoser = false
    }
}
