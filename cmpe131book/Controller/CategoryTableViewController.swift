//
//  CategoryTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 3/28/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    let Genre : genreinfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 75 // set the hight of each cell

    }
    required init?(coder aDecoder: NSCoder) {
        Genre = genreinfo()
        super.init(coder: aDecoder)
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Genre.GenreINFO.count
    } // number of category displayed on screen
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)// enable animation for selection
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TOPRATING", for: indexPath)
        let position = Genre.GenreINFO[indexPath.row]
        textconfig(for: cell, with: position)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CINFO"{
            if let ClistTableView = segue.destination as? ClistTableViewController{
                if let cell = sender as? UITableViewCell, let indexp = tableView.indexPath(for: cell){
                    let item = Genre.GenreINFO[indexp.row]
                    ClistTableView.genre = item.genre
                }
            }
        }
    }
    
    func textconfig(for cell : UITableViewCell, with item : genre){
        cell.textLabel?.text = item.genre
    }

}
