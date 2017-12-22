//
//  ViewController.swift
//  CardGame
//
//  Created by Noranyi Brito on 11/22/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {

    @IBOutlet weak var cpuCard: UIImageView!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    @IBOutlet weak var userCard: UIImageView!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var winner = CardGameWinner()
    
    
    let cards = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace", "back", "youWon", "gameOver", "itIsATie"]
    
    
    var user = Int()
    var cpu = Int()
    
    var userScore = Int()
    var cpuScore = Int()
    
    func updateUI(){
        
        userCard.image = UIImage(named: cards[user])
        cpuCard.image = UIImage(named: cards[cpu])
        
        userScoreLabel.text = String(userScore)
        cpuScoreLabel.text = String(cpuScore)
        
        
    }
    
   
    
    @IBAction func play(_ sender: UIButton) {
        
        var userR = Int()
        var cpuR = Int()
        var cpuS = Int()
        var userS = Int()
        
        (userR, cpuR, cpuS, userS) = winner.play()
        
        user = userR
        cpu = cpuR
        cpuScore += cpuS
        userScore += userS
        
        if ((userScore >= 21) || (cpuScore >= 21)){
           self.playButton.isEnabled = false
            
            let when = DispatchTime.now() + 1 // 1 second sleep time before card are turned
        DispatchQueue.main.asyncAfter(deadline: when) {
           
            if ((self.userScore >= 21) && !(self.cpuScore >= 21)){
                self.user = 14
                self.cpu = 13
                self.userScore = 21
                self.cpuScore = 0
                
            } else if((self.cpuScore >= 21) && !(self.userScore >= 21)){
                self.user = 15
                self.cpu = 13
                self.self.userScore = 0
                self.cpuScore = 21
                
            } else if ((self.userScore >= 21) && (self.cpuScore >= 21)){
                self.user = 16
                self.cpu = 16
                self.userScore = 21
                self.cpuScore = 21
                
            
            }
            self.updateUI()
          }
        }
        
        updateUI()
        
        
    }
    
    
 
    
    @IBAction func reset(_ sender: UIButton) {
        
        user = winner.reset().userRand
        cpu = winner.reset().cpuRand
        
        userScore = winner.reset().user
        cpuScore = winner.reset().cpu
        
        playButton.isEnabled = true
        
        updateUI()
    }
    
    
   

}

