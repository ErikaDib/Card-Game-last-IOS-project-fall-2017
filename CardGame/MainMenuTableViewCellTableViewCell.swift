//
//  CustomTableViewCell.swift
//  CardGame
//
//  Created by Noranyi Brito on 11/24/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var add21logo: UIImageView!
        {
        didSet{
            add21logo.shake()
           
            
        }
    }
    
    
    
    @IBOutlet weak var rollTheDice: UIImageView!
        {
        didSet{
            
            let when = DispatchTime.now() + 0.25
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.rollTheDice.shake()
            }
            
        }
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension UIImageView{
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.25
        shake.repeatCount = .infinity
        
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x:center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }

}
