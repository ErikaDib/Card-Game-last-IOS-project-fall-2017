//
//  GameMenuTableViewCell.swift
//  CardGame
//
//  Created by Noranyi Brito on 12/9/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import UIKit

class GameMenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var play: UIButton!
        {
        didSet{
            play.pulsate()
            
            
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

