//
//  ClistTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/5/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit

class ClistTableViewController: UITableViewController {
    var genre : String = ""
    let listINFO : Clistinfo
    var CurrentList = [Clist]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 75
        CurrentList = listINFO.CINFO.filter({ (Clist) -> Bool in
            Clist.genre.lowercased().contains(genre.lowercased())
        })
    }
    required init?(coder aDecoder: NSCoder) {
        listINFO = Clistinfo()
        super.init(coder: aDecoder)
     
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "LIST", for: indexPath)
        let position = CurrentList[indexPath.row]
        textconfig(for: cell, with: position)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func textconfig(for cell : UITableViewCell, with item : Clist){
        cell.textLabel!.text = item.title
        cell.imageView?.image = UIImage(named: item.ima)
    }
}
