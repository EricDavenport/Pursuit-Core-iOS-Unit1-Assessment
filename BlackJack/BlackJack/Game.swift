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
//hitPlayer is a Bool
//The Game object has the following computed properties:
//
//hasMoreCards returns a Bool
//                                             randomComputerScore returns an Int
//The Game object has the following methods:
//
//newGame() resets the game
//stopHits() called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
//hitMe() called as the user requests more cards from the deck
//computerVsPlayer() draws a random number for the computer and determines the winner of the game.
//gameStatus() takes in the player's card and determines the current score. Here the player score options can be, BlackJack, Bust or Continue playing as their status is still valid for game play.

// MARK: Class begin
class Game {
// MARK: Properties
    var deck: [Card]
    var player: Player
    var hitPlayer: Bool
    
// MARK: Initializer
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }
    
// MARK: Computed Properties
    var hasMoreCards: Bool {
        // check if deck is not empty - return is still comtains cards in deck
        return !deck.isEmpty
    }
    
    var randomComputerScore: Int {
        let randomComputerScore = Int.random(in: 18...23)
        return randomComputerScore
    }
    
// MARK: Methods
// MARK: new Game Method
    func newGame() {
        deck.removeAll()
        user.cards.removeAll()
        user.score = 0
    }
// MARK: stop Hit method
    func stopHits(playerScore: Int, computerScore: Int) -> String {
        let computerScore = randomComputerScore
        let playerScore = user.score
        var winner = ""
        if playerScore == 21 {
            winner += player.playerName
            print("\(winner) wins")
        } else if computerScore == 21 {
            winner = "Computer"
            print("\(winner) wins!!!!")
        } else if computerScore > 21 && playerScore < 21 {
            print("House Bust!! \(player.playerName) Wins!!")
        } 
        return winner
    }
// MARK: hit Me method
    func hitMe(userInput: String, cards: [Card], playerScore: Int, computerScore: Int) {
        var shuffledDeck = cards.shuffled()
        let randomCard = shuffledDeck.popLast() ?? nil
        
        switch userInput {
        case "hit":
            user.cards.append(randomCard!)
            print(randomCard)
        case "pass":
            stopHits(playerScore: playerScore, computerScore: computerScore)
            print("")
        default:
            print("Invalid selection")
        }
        }


//    func computerVsPlayer(playerScore: Int, compScore: Int) -> String {
//
//    }
// MARK: gameStatus method
    func gameStatus(playerCards: [Card]) {
        var playerScoreStatus: Int = 0
        for card in playerCards {
            playerScoreStatus += card.value
        }
            switch playerScoreStatus {
            case 21:
                print("Blackjack - YOU WIN!!!")
                break
            case 22...:
                print("BUST")
                break
            default:
                print()
            }
        
    }




}
