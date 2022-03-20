//
//  Kevin_GameModel.swift
//  Kevin_Rabari_Blue_TicTacToe
//
//  Created by Kevin Rabari on 2022-03-06.
//

import Foundation
class Kevin_GameModel{
    var whoseTurn = "X"
    var numbersOfMovesPlayed = 0
    var lastPlayed = ""
    var whoWon=""
    var isPastgame = false
    
    var squareContents = Array(repeating: "", count: 10)
    var orderOfMoves=[Int]()
    
    let winningCombination = [ [1,2,3] ,[4,5,6],
                               [7,8,9],[1,4,7],
                               [2,5,8],[3,6,9],
                               [1,5,9],[3,5,7]]
 
    func playMove(tag: Int)
    {
        orderOfMoves.append(tag)
        squareContents[tag] = whoseTurn
        lastPlayed = whoseTurn
        
        if(whoseTurn == "X")
        {
            whoseTurn = "O"
        }else{
            whoseTurn = "X"
        }
        numbersOfMovesPlayed += 1
    }
    func isGameFinished()-> Bool{
        if(numbersOfMovesPlayed < 5){
            return false
        }
        if(numbersOfMovesPlayed == 9)
        {
            return true
        }
        // check if somebody has won
        for winningCombo in winningCombination{
            let index1 = winningCombo[0]
            let index2 = winningCombo[1]
            let index3 = winningCombo[2]
            
            if(squareContents[index1] == lastPlayed &&
               squareContents[index2] == lastPlayed &&
               squareContents[index3] == lastPlayed){
                //game over, won by last player
                whoWon = lastPlayed
                saveGame()
                return true
                
            }
        }
        return false
    }
    func saveGame(){
        
        
        if(isPastgame)
        {
            return
        }
        let numGamesPlayed = UserDefaults.standard.integer(forKey: Constant.NUM_GAMES)
        let gameNumber = numGamesPlayed + 1
        
        UserDefaults.standard.set(whoWon, forKey: Constant.WHO_WON + String(gameNumber))
        UserDefaults.standard.set(Date(), forKey: Constant.DATE_TIME + String(gameNumber))
        UserDefaults.standard.set(orderOfMoves, forKey: Constant.ORDER_OF_MOVES + String(gameNumber))
        UserDefaults.standard.set(gameNumber,forKey: Constant.NUM_GAMES)
        print("Game Saved")
        
    }
}

struct Constant{
    static let NUM_GAMES = "numberOfGamesPlayed"
    static let WHO_WON = "whoWon"
    static let DATE_TIME = "dateTime"
    static let ORDER_OF_MOVES = "orderOfMoves"
}
