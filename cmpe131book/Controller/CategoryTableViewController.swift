//
//  CategoryTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 3/28/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 75 // set the hight of each cell

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    } // number of category displayed on screen
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)// enable animation for selection
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TOPRATING", for: indexPath)
        textconfig(for: cell, with: indexPath)
        return cell
    }
    
    func textconfig(for cell : UITableViewCell, with item : IndexPath){
        cell.textLabel?.text = "Romantic"
        cell.imageView?.image = UIImage(named: "5")
    }

}
