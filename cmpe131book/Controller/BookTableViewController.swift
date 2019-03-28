//
//  BOOKTableViewController.swift
//  BOOK
//
//  Created by 安博 on 3/13/19.
//  Copyright © 2019 安博. All rights reserved.
//

import UIKit

class BOOKTableViewController: UITableViewController {
    let BooKINFO : Bookinfo
    let function : functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100 // set the hight of each cell
    }
    required init?(coder aDecoder: NSCoder) {
        BooKINFO = Bookinfo()
        function = functions()
        super.init(coder: aDecoder)
    }// init book info
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BooKINFO.Book.count
    }// init number of cells
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)// enable animation for selection
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let position = BooKINFO.Book[indexPath.row]
        textconfig(for: cell, with: position)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        BooKINFO.Book.remove(at: indexPath.row)
        let InDexpath = [indexPath]
        tableView.deleteRows(at: InDexpath, with: .fade)
    }//delete function
    
    func textconfig(for cell : UITableViewCell, with item : Infobase){
        cell.textLabel!.text = item.Title
        cell.detailTextLabel!.text = item.Abstruct
        cell.imageView?.image = UIImage(named: item.ima)
        cell.textLabel!.textColor = function.randomColor()
        cell.detailTextLabel!.textColor = function.randomColor()
    }// set textconten for each cell
    
}




