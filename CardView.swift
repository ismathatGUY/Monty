//  CardView.swift
//  Monty
//
//  Created by Ismael Kabore on 10/8/23.
//

import SwiftUI
import Foundation

struct Card: Identifiable {
    let id = UUID()
    var isFaceUp = false
    var isAce: Bool = false
    var isWinner: Bool = false
    var isLoser: Bool = false

    mutating func randomizeAce() {
        isAce = Bool.random()
    }

    mutating func setWinnerLoser() {
        if isFaceUp {
            if isAce {
                isWinner = true
                isLoser = false
            } else {
                isWinner = false
                isLoser = true
            }
        } else {
            isWinner = false
            isLoser = false
        }
    }
}

struct CardView: View {
    var card: Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                Image(card.isAce ? "Ace" : "Blank")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("Back") 
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .overlay(
            Group {
                if card.isWinner {
                    Image("Winner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if card.isLoser {
                    Image("Loser")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .opacity(card.isFaceUp ? 1.0 : 0.0) // Show/hide Winner and Loser based on isFaceUp
        )
    }
}

