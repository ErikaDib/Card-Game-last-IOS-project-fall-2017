//
//  DiceGame.swift
//  DicePIgGAme
//
//  Created by Erika Nieto on 11/20/17.
//  Copyright © 2017 Erika Dibenedetto. All rights reserved.
//


import UIKit
import Foundation

class DiceGame{
  
    var currentUser : String = "user"
  
    var userScore : Int = 0
    var computerScore : Int = 0
    var dicecube : String = ""
    var diceVal : Int = 0
    var passUserScore:Int = 0
    var passComputerScore:Int = 0
    var winner : String = ""
   
    
    init(){
        
    }
    
    func setDice(){
    let dicee=dice().computed
      dicecube = dicee
    }
    
    func diceValue(diceName:String)->Int{
        let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
        if(diceName=="dice1"){
            if currentUser == "computer"{
            currentUser = "user"
            computerScore=0
            diceVal = 0
            return diceVal
            }else if currentUser == "user"{
                userScore=0
                diceVal = 0
                currentUser = "computer"
                return diceVal
            }
        }
        if let i = diceArray.index(of: diceName){
            diceVal = i+1
            return diceVal
        }
        return 0
        
    }
    func calculateScore(diceValue : Int){
        if currentUser == "user"{
        userScore = userScore + diceValue
       //passUserScore = userScore
        }else if(currentUser == "computer"){
         computerScore = computerScore + diceValue
        
        }
        
    }
    /////////////////////////////////////////
    func isWinner()->String{
        var winner : String = ""
        if(passUserScore>=100){
            winner = "user"
            resetGame()
        }
        return winner
    }
    
    func resetGame(){
        currentUser="user"
        winner=""
        userScore=0
        computerScore=0
        dicecube=""
        diceVal=0
        passComputerScore=0
        passUserScore=0
    }
    func passTurn(){
        if(currentUser=="user"){
        passUserScore = passUserScore + userScore
        userScore=0
        currentUser="computer"
        winner = isWinner()
        }else if(currentUser=="computer"){
            passComputerScore=passComputerScore+computerScore
            computerScore=0
            currentUser="user"
            
        }
    }
    func calculateComputerScore()->Int{
        passComputerScore=passComputerScore+computerScore
        //computerScore=0
        return passComputerScore
    }
    func AIComputer()->String{
         //winner = isWinner()
        if(currentUser == "computer"){
                setDice()
                diceVal = diceValue(diceName:dicecube)
                 if(dicecube=="dice1"){
                    computerScore=0
                    print("thisssssssss "+"\(computerScore)")
                    currentUser="user"
                    //passTurn()
                 }
            
                calculateScore(diceValue : diceVal)
                //passComputerScore=computerScore
               // calculateComputerScore()
            
            
            }
        
        return dicecube
      }
}



