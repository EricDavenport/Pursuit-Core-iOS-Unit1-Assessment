//
//  Game.swift
//  BlackJack
//
//  Created by Eric Davenport on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


//
//Game.swift
//
//Create a new Swift file called Game, create a class of the same name.
//
//The Game object has the following instance properties:
//
//deck is an array of [Card]
//player is a Player
//hitPlayeris a Bool
//The Game object has the following computed properties:
//
//hasMoreCards returns a Bool
//randomComputerScore returns an Int
//The Game object has the following methods:
//
//newGame() resets the game
//stopHits() called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
//hitMe() called as the user requests more cards from the deck
//computerVsPlayer() draws a random number for the computer and determines the winner of the game.
//gameStatus() takes in the player's card and determines the current score. Here the player score options can be, BlackJack, Bust or Continue playing as their status is still valid for game play.


class Game {
    // properties
    var deck: [Card] = Card.newDeck(aceValue: 1)
    var player: Player
    var hitPlayer: Bool
    
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }
    
}
