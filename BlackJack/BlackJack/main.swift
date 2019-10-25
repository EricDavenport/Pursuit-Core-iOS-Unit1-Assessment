//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation



print("Please input your name.")
var playerNameInput = readLine() ?? ""
var user = Player(cards: [], playerName: playerNameInput)

let game = Game(deck: Card.newDeck(aceValue: 1), player: user, hitPlayer: false)
game.deck = Card.newDeck(aceValue: 1)

var gameOver: Bool = false
var continueGame: Bool = false

//var currentGame: Bool = true
// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment README
// print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
// There are 52 in a deck of cards




//var myDeck = Card.newDeck(aceValue: 1)


//print(game.deck)

repeat {
    
    


repeat {

    print("hit or pass")
    var passOrHit = readLine()?.lowercased()
    print(user.cards)
    
  
if passOrHit == "hit" {
    game.hitMe(userInput: passOrHit ?? "", cards: game.deck, playerScore: user.score, computerScore: 0)
    for each in user.cards {
        user.score += each.value
    }
    game.gameStatus(playerCards: user.cards)
    gameOver = true
    if user.score >= 21 {
            gameOver = false
            game.gameStatus(playerCards: user.cards)
            continueGame = false
    }
} else if passOrHit == "pass" {
    game.stopHits(playerScore: user.score, computerScore: 0)
    game.gameStatus(playerCards: user.cards)
    game.newGame()
    gameOver = false
    continueGame = false
}
        
print(game.deck.count)
print()
print(user.score, user.playerName)
print()
print(user.cards)
print()
    
} while user.score < 21

    print("Would you like to play again? Y/N")
    var continuePlaying = readLine()?.uppercased()
    if continuePlaying == "Y" {
        gameOver = true
    } else {
        gameOver = false
    }

   
    
} while gameOver

game.newGame()
