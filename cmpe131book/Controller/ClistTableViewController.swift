//
//  ClistTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/5/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit
import CoreData

class ClistTableViewController: UITableViewController {
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    private var fetchedRC : NSFetchedResultsController<Book>!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var commitPredicate: NSPredicate?
    let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BookDB")
    
    var genre : String = ""
    var CurrentList = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 75
        Filter()
        tableView.reloadData()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     
    }
    
    func Filter() {
        let filtertext = genre
        if !filtertext.isEmpty{
            let request = Book.fetchRequest() as NSFetchRequest<Book>
            request.predicate = NSPredicate(format: "genre CONTAINS %@", filtertext)
                do{
                    CurrentList = try context.fetch(request)
                } catch let error as NSError{
                    print("Could not fetch. \(error), \(error.userInfo)")
                    }
        }

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
    
    func textconfig(for cell : UITableViewCell, with item : Book){
        cell.textLabel!.text = item.title
    }
}
