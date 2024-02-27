//  ContentView.swift
//  Monty
//  Created by Ismael Kabore on 10/8/23.

import SwiftUI

struct ContentView: View {
    @StateObject private var game = Game()

    var body: some View {
        ZStack {
            // Darker blue background
            Color(UIColor(red: 0.0, green: 0.1, blue: 0.2, alpha: 1.0)).edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                HStack {
                    Spacer()

                    if game.showWinner {
                        Image("Winner") // Use the actual image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    } else if game.showLoser {
                        Image("Loser") // Use the actual image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }

                    Spacer()
                }

                Spacer() 

                LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                game.onTap(card: card)
                            }
                    }
                }
                .padding()

                Spacer()

                Button("New Game") {
                    game.newGame()
                }
                .foregroundColor(.white)
                .padding()
            }
        }
        .foregroundColor(.white)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
