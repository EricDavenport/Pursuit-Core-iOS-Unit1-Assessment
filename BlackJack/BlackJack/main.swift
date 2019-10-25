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


var gameOver: Bool = false
var continueGame: Bool = false

repeat {

repeat {

    print("hit or pass")
    var passOrHit = readLine()?.lowercased()
    print(user.cards)
    
  
if passOrHit == "hit" {
    game.hitMe(userInput: passOrHit ?? "")
    
            
    game.gameStatus(playerCards: user.cards)
    gameOver = true
    if user.score >= 21 {
            gameOver = false
            game.gameStatus(playerCards: user.cards)
            continueGame = false
    }
} else if passOrHit == "pass" {
    game.stopHit(userScore: user.score)
    game.gameStatus(playerCards: user.cards)
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
    let continuePlaying = readLine()?.uppercased()
    if continuePlaying == "Y" {
        game.newGame()
        gameOver = true
    } else {
        game.newGame()
        gameOver = false
    }

   game.newGame()
    
} while gameOver


