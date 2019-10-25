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
//    var hasMoreCards: Bool {
//
//        return !deck.isEmpty
//    }
    var hasMoreCards: Bool {
    // check if deck is not empty - return is still comtains cards in deck
    return !user.cards.isEmpty
       }
    
    var randomComputerScore: Int {
        let randomComputerScore = Int.random(in: 18...23)
        return randomComputerScore
    }
    
// MARK: Methods
// MARK: new Game Method
    func newGame() {
        user.score = 0
        deck.removeAll()
        user.cards.removeAll()
    }
    
// MARK: stop Hit method
//    func stopHits(playerScore: Int, computerScore: Int) -> String {
//        let computerScore = randomComputerScore
//        let playerScore = user.score
//        var winner = ""
//        if playerScore == 21 {
//            winner += player.playerName
//            print("\(winner) wins")
//        } else if computerScore == 21 {
//            winner = "Computer"
//            print("\(winner) wins!!!!")
//        } else if computerScore > 21 && playerScore < 21 {
//            print("House Bust!! \(player.playerName) Wins!!")
//        }
//        return winner
//    }
    
    func stopHit(userScore: Int) {
           let computerScore = randomComputerScore
           let userScore = user.score
           
           if computerScore == 21 && userScore == 21 {
               print("Draw!!")
           } else if userScore == 21 {
               print("\(user.playerName) wins!!!!")
           } else if computerScore == 21 {
               print("House Wins!!!")
           } else if computerScore > 21 && userScore < 21 {
               print("\(user.playerName) wins!!!!")
           }
       }
    
    
    
    
// MARK: hit Me method
//    func hitMe(userInput: String, cards: [Card], playerScore: Int, computerScore: Int) {
//        var shuffledDeck = cards.shuffled()
//        let randomCard = shuffledDeck.popLast() ?? nil
//
//        switch userInput {
//        case "hit":
//            user.cards.append(randomCard!)
//            gameStatus(playerCards: user.cards)
//            print(randomCard)
//        case "pass":
//            gameStatus(playerCards: user.cards)
//            stopHits(playerScore: user.score, computerScore: (Int.random(in: 18...23)))
//            print("\(player.playerName): \(playerScore)\nComputer Score: \(computerScore)")
//
//        default:
//            print("Invalid selection")
//        }
//        }
    
    func hitMe(userInput: String) -> Card? {
        let shuffledDeck = deck.shuffled()
        let randomCard = shuffledDeck.randomElement() ?? Card(suit: .heart, value: 2, isFaceCard: false, face: .none)
        
        if userInput == "hit" {
            user.cards.append(randomCard)
            user.score += randomCard.value
            print(shuffledDeck.count)
        } else if userInput == "pass" {
            stopHit(userScore: user.score)
        }
        return randomCard
        
    }
    
    

//    func computerVsPlayer(playerScore: Int, compScore: Int) -> String {
//
//    }
// MARK: gameStatus method
//    func gameStatus(playerCards: [Card]) {
//        var playerScoreStatus: Int = 0
//        for card in playerCards {
//            playerScoreStatus += card.value
//        }
//            switch playerScoreStatus {
//            case 21:
//                print("Blackjack - YOU WIN!!!")
//                game.newGame()
//                break
//            case 22...:
//                print("BUST")
//                game.newGame()
//                break
//            default:
//                print()
//            }
//
//    }

    func gameStatus(playerCards: [Card]) {
        var score: Int = 0
        
            for card in playerCards {
                score += card.value
        
                switch score {
                case 21:
                    print("BLACKJACK")
                case 22...:
                    print("BUST!!!!!")
                default:
                    print(" ")
                
            }
        }
    }


}
