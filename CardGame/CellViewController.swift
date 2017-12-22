//
//  CellViewController.swift
//  CardGame
//
//  Created by Noranyi Brito on 11/24/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import UIKit

class CellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 5
   }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.backgroundImage.image = UIImage(named: "background-1")
        return cell
   }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}
