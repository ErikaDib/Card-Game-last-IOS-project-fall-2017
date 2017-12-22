//
//  Winner.swift
//  CardGame
//
//  Created by Noranyi Brito on 11/24/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import Foundation



class CardGameWinner{
    
    
    func play() -> (userRand: Int, cpuRand: Int, cpuScore: Int, userScore: Int){
      var cpuScore = 0
      var userScore = 0
        
          //calculate random numbers to get card
        let userRand = Int(arc4random_uniform(13))
        print("userRand", userRand)
        
        let cpuRand = Int(arc4random_uniform(13))
        print("cpuRand", cpuRand)
        //call function to get a winner
        if (cpuRand >  userRand){
        
        cpuScore += 3
        print("cpuScore", cpuScore)
            
        } else if (userRand > cpuRand){
        
        userScore += 3
       print("userScore", userScore)
        } else {
            cpuScore += 3
            userScore += 3
        }
        
     return (userRand, cpuRand, cpuScore, userScore)
    }
    
    
    
    func reset() -> (userRand: Int, cpuRand: Int, cpu: Int, user: Int){
       let userRand = 13
       let cpuRand = 13
        
        let cpu = 0
         let user = 0
        
      return (userRand, cpuRand, cpu, user)
    }
    
    
}
