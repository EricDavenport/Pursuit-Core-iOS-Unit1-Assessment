//
//  Game.swift
//  BlackJack
//
//  Created by Eric Davenport on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


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
        deck = Card.newDeck(aceValue: 1)
    }
    
// MARK: stop Hit method
    func stopHit(playerScore: Int) -> String {
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

    
    func hitMe(userInput: String) -> Card? {
        let shuffledDeck = deck.shuffled()
        let randomCard = shuffledDeck.randomElement() ?? Card(suit: .heart, value: 2, isFaceCard: false, face: .none)
        
        if userInput == "hit" {
            user.cards.append(randomCard)
            user.score += randomCard.value
            deck.popLast() ?? Card(suit: .heart, value: 2, isFaceCard: false, face: .none)
            
        } else if userInput == "pass" {
            stopHit(playerScore: user.score)
        }
        return randomCard
        
    }
    
    


// MARK: gameStatus method

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


// MARK: Notes begin
//      entire commented out secyion below is for personal use
//      I am leaving it for reference on whart was wrong/bad/poorly done
//      you can view and add to is you want - but i am just leaving it because
//      i would like to return and see what my thought process was
//      an i like to go back and see how my brain functions when i have an even
//      better understand
//                                                  - lilmann



//    var hasMoreCards: Bool {
//
//        return !deck.isEmpty
//    }


//    func computerVsPlayer(playerScore: Int, compScore: Int) -> String {
//
//    }

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

//func stopHit(userScore: Int) {
//         let computerScore = randomComputerScore
//         let userScore = user.score
//         print(userScore)
//      switch userScore {
//      case computerScore = userScore:
//             print("Draw!!")
//      case userScore = 21:
//             print("\(user.playerName) wins!!!!")
//      case computerScore = 21:
//             print("House Wins!!!")
//      case computerScore > 21 && userScore < 21:
//             print("\(user.playerName) wins!!!!")
//      }
//  }
    
