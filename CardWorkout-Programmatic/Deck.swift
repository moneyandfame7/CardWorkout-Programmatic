//
//  Deck.swift
//  CardWorkout-Programmatic
//
//  Created by Davyd Darusenkov on 23.11.2023.
//

import UIKit

class Deck {
    private var suits: [String: String] = [
        "D": "diamonds",
        "H": "hearts",
        "C": "clubs",
        "S": "spades",
    ]

    private var ranks: [String: String] = [
        "A": "ace",
        "J": "jack",
        "Q": "queen",
        "K": "king",
    ]

    private var cards: [UIImage] = []

    init() {
//        createCards()
    }

    func createCards() {
        // Create cards from 2 to 10.
        for suit in suits {
            for i in 2 ... 10 {
                let image = UIImage(named: "\(i)\(suit.key)")!
                cards.append(image)
            }
            // Create cards with other ranks
            for rank in ranks {
                let image = UIImage(named: "\(rank.key)\(suit.key)")!

                cards.append(image)
            }
        }
    }

    func pickRandomCard() -> UIImage {
        guard let random = cards.randomElement() else {
            fatalError("Cards array is empty")
        }

        return random
    }
}
