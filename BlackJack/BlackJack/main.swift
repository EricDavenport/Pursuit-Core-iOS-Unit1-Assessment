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

var currentGame: Bool = true
// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment README
// print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
// There are 52 in a deck of cards




//var myDeck = Card.newDeck(aceValue: 1)


//print(game.deck)

repeat {
print("hit or pass")
var passOrHit = readLine()?.lowercased()
print(user.cards)
    
  
if passOrHit == "hit" {
    game.hitMe(userInput: passOrHit ?? "", cards: game.deck, playerScore: user.score, computerScore: 0)
    for each in user.cards {
        user.score += each.value
    }
    game.gameStatus(playerScore: user.score)
  currentGame = true
} else if passOrHit == "pass" {
    game.stopHits(playerScore: user.score, computerScore: 0)
    game.gameStatus(playerScore: user.score)
    gameOver = false
}
        
    

print(user.score, user.playerName, user.cards)
print("game deck has \(game.deck.count) remaining cards ")

} while gameOver
