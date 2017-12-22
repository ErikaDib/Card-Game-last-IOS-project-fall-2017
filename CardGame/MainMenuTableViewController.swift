//
//  MainMenuTableViewController.swift
//  CardGame
//
//  Created by Noranyi Brito on 12/9/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {
    var cell = MainMenuTableViewCell()
 
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
    
   
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
         add21logo.shake()
         let when = DispatchTime.now() + 0.25
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.rollTheDice.shake()
        }
        
    }
    
    
    
    
 override func viewDidLoad() {
   super.viewDidLoad()
     
        
   }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destinationViewController = segue.destination
        if let navigationViewController = destinationViewController as? UINavigationController {
            destinationViewController = navigationViewController.visibleViewController ?? destinationViewController
        }
        
    }
    
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UITableViewController, animated: Bool) {
        if let controller = viewController as? MainMenuTableViewController {
            controller.tableView.reloadData()
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    

}

