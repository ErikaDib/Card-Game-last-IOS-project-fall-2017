//
//  ViewController.swift
//  DicePIgGAme
//
//  Created by Erika Nieto on 11/20/17.
//  Copyright © 2017 Erika Dibenedetto. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    
    @IBOutlet var diceVIewController: UIImageView!
    //@IBOutlet var labelDiceValue: UILabel!
    @IBOutlet var userLabel: UILabel!
    //@IBOutlet var computerLabel: UILabel!
  
    @IBOutlet var computerLabelDiceValue: UILabel!
    @IBOutlet var computerDiceView: UIImageView!
    @IBOutlet var sumOfScores: UILabel!
   
    @IBOutlet var sumOfScoresComputer: UILabel!
    
    @IBOutlet var rollbtn: UIButton!
    @IBOutlet var passbtn: UIButton!
    @IBOutlet var resetbtn: UIButton!
    
    
    private var game : DiceGame = DiceGame()
    
    //let queue = DispatchQueue(label:"queue.1")
    

    func updaceDiceImage(){
     // diceVIewController.image =
    }
    
    @IBAction func rollDice(_ sender: UIButton) {
       
        game.setDice()
        diceVIewController.image = UIImage(named: game.dicecube)
     
        setLabel()
        
       // queue.async{
           // if(self.game.currentUser=="computer"){
               // print ("lalala")
               // self.test()
                //self.computerLabel.text = "\(self.game.computerScore)"
               // self.computerLabelDiceValue.text = "\(self.game.diceVal)"
                
          //  }
       // }
        
        
    }
    
    @IBAction func passTurn(_ sender: UIButton) {
        
        game.passTurn()
        sumOfScores.text = "\(game.passUserScore)"
       // userLabel.text = "\(game.passUserScore)"
       
        //computerLabel.text = "\(game.passComputerScore)"
        test()
        
    }
    


    @IBAction func resetButton(_ sender: UIButton) {
        resetCurrentGame()
        
    }
    
    func resetCurrentGame(){
        game.resetGame()
        userLabel.text=""
        //computerLabel.text=""
        //labelDiceValue.text=""
        computerLabelDiceValue.text=""
        sumOfScores.text=""
        sumOfScoresComputer.text=""
        computerDiceView.image = UIImage(named:"dice1")
        diceVIewController.image = UIImage(named:"dice1")
        self.rollbtn.backgroundColor=UIColor.white
        self.passbtn.backgroundColor=UIColor.white
        self.resetbtn.backgroundColor=UIColor.white
        
    }
    
    
    func setLabel(){
        
        let value : Int = game.diceValue(diceName: game.dicecube)
       // labelDiceValue.text = "\(value)"
        game.calculateScore(diceValue: value);
       // game.calculateScore(diceValue: game.diceVal)
        game.diceVal = value
        userLabel.text="\(game.userScore)"
        
        //computerDiceView.image=UIImage(named: game.dicecube)!
        //computerLabel.text = "\(game.computerScore)"
        //computerLabelDiceValue.text = "\(game.diceVal)"
        
        
        print("------user--------")
        print("current User:"+game.currentUser)
        print("name os dice:"+game.dicecube)
        print("dice value "+"\(game.diceVal)")
        print("passComputer Score " + "\(game.passUserScore)")
       
        print("user current score: "+"\(game.userScore)")
        print("winner is: "+game.winner)
        print("------enf of user--------")
        
        
        test()
    }
    
    
    //func setComputerLabel(){
        //computerDiceView.image = UIImage(named:"dice1")
       // game.currentUser="user"
   // }
    func setLastLabel(){
       computerLabelDiceValue.text="\(game.passComputerScore)"
       //game.currentUser="user"
    }
    
    
    func showAlert(winner:String){
        let alert = UIAlertController(title: winner+" won!", message: "do you want to start over", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler:{ (UIAlertAction) in
            self.resetCurrentGame()
        })
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
    
    var inactiveQueue: DispatchQueue!
    func concurrentQueue(){
         let anotherQueue = DispatchQueue(label: "diceAnotherQueue", qos: .utility, attributes: .initiallyInactive)
        inactiveQueue = anotherQueue
        anotherQueue.async {
            let numberOfTries:Int = Int(arc4random_uniform(10-1)+1)
            var counter : Int = 0
            DispatchQueue.main.async {
                self.rollbtn.backgroundColor=UIColor.gray
                self.passbtn.backgroundColor=UIColor.gray
                self.resetbtn.backgroundColor=UIColor.gray
                self.rollbtn.isEnabled=false
                self.passbtn.isEnabled=false
                self.resetbtn.isEnabled=false
            }
            
            while counter < numberOfTries{
                
                sleep(1)
                let selectedDice = self.game.AIComputer()
                if(selectedDice=="dice1"){
                   DispatchQueue.main.async {
                    self.computerDiceView.image = UIImage(named:"dice1")
                    //self.computerLabel.text = "\(self.game.diceVal)"
                    self.sumOfScoresComputer.text="\(self.game.computerScore)"
                    //self.game.computerScore=0
                   
                    self.game.passTurn()
                    print("this happens when computer draw dice1")
                    print("current user"+self.game.currentUser)
                    //self.game.calculateComputerScore()
                    print("pass computerScore:"+"\(self.game.passComputerScore)")
                    print("------------------------")
                    }
                    break
                }
                DispatchQueue.main.async {
                    self.computerDiceView.image = UIImage(named:selectedDice)
                   // self.computerLabel.text = "\(self.game.diceVal)"
                    self.sumOfScoresComputer.text="\(self.game.computerScore)"
                    
                    
                    print("-----------computer--------")
                    print("number of tries: "+"\(numberOfTries)")
                    print("current user comp:"+self.game.currentUser)
                    print("computer score:"+"\(self.game.computerScore)")
                    print("pass computer score:"+"\(self.game.passComputerScore)")
                    print("dice value :"+"\(self.game.diceVal)")
                    print("dice :"+self.game.dicecube)
                    print("winner is: "+self.game.winner)
                    print("----------end of computer--------")
                    
                }
                counter+=1
            }
            DispatchQueue.main.async {
                self.game.passTurn()
                print("------"+"\(self.game.calculateComputerScore())")
                self.computerLabelDiceValue.text="\(self.game.passComputerScore)"
                if(self.game.passComputerScore>=100){
                    
                    self.showAlert(winner:"Computer")
                }
                self.rollbtn.isEnabled=true
                self.passbtn.isEnabled=true
                self.resetbtn.isEnabled=true
                self.rollbtn.backgroundColor=UIColor.white
                self.passbtn.backgroundColor=UIColor.white
                self.resetbtn.backgroundColor=UIColor.white
                
            }
            
           //self.setLastLabel()
        }
       
    }
    func test(){
        checkForWinnerQueue()
        if(game.currentUser=="computer"){
            concurrentQueue()
            if let queue = inactiveQueue {
                queue.activate()
               
            }
    }
    }
   // func buttonDisabled(button:UIButton){
       // if(game.currentUser=="computer"){
         //   button.isEnabled=false
       // }else if(game.currentUser=="user"){
        //    button.isEnabled=true
       // }
    //}
    func checkForWinnerQueue(){
        let winnerQueue = DispatchQueue(label:"winnerQueue")
        winnerQueue.async {
          //  if(self.game.passComputerScore>=20){
              //  self.showAlert()
           // }
         // DispatchQueue.main.async {
            
            
           // }
          //  if(self.game.currentUser=="computer"){
              //    self.rollbtn.isEnabled=false
             //  }
           // if(self.game.currentUser=="user"){
              //     self.rollbtn.isEnabled=true
              //  }
           
           // }
            
            
            if(self.game.winner=="user"){
                self.showAlert(winner:"user")
              }
          
           // buttonDisabled(button: rollbutton!)
        }
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        diceVIewController.image=UIImage(named:"dice1")
        computerDiceView.image=UIImage(named:"dice1")

    }
}






// game.AIComputer()
//var timer : Timer!
// timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: Selector ("updateImageDice"), userInfo: nil, repeats: true)
// func updateImageDice(){
// diceVIewController.image = UIImage(named: game.dicecube)
//computerDiceView.image=UIImage(named: game.dicecube)


// var numtest : Int = 0
// while numtest<5{
//game.setDice()
//let
// diceVIewController.animationImages = [ UIImage(named: "dice3")!,UIImage(named: "dice4")!,UIImage(named: "dice6")!,UIImage(named: "dice5")!]
//diceVIewController.image = UIImage(named: game.dicecube)!
//diceVIewController.animationDuration=4
// diceVIewController.startAnimating()
//numtest+=1
// }

