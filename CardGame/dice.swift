//
//  File.swift
//  DicePIgGAme
//
//  Created by Erika Nieto on 11/20/17.
//  Copyright © 2017 Erika Dibenedetto. All rights reserved.
//
import UIKit
import Foundation
class dice{
  private var dicePicture: String = "dice1"
    
    init(){
        func rollDice()->String{
            let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
            let randomNumber = Int(arc4random_uniform(6))
            return diceArray[randomNumber]
        }
        let name = rollDice()
        dicePicture = name
    }
    
    public var computed : String{
        get{
            return self.dicePicture
        }
        set{
            self.dicePicture = newValue
        }
    }
    
    
    
   // func diceValue(diceName:String)->Int{
      //  let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
      //  if(diceName=="dice1"){
        //    return 0
      //  }
       // if let i = diceArray.index(of: diceName){
         //   return i+1
       // }
       // return 0

  //}
    
    

}




