//
//  RecomTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/18/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit
import CoreData
class RecomTableViewController: UITableViewController {

    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    private var fetchedRC : NSFetchedResultsController<Book>!
    private var UfetchedRC : NSFetchedResultsController<User>!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
    let request = Book.fetchRequest() as NSFetchRequest<Book>
    let Ufetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    let Urequest = User.fetchRequest() as NSFetchRequest<User>
    private var RecommendationList = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  RecommendationList.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)// enable animation for selection
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "REC", for: indexPath)
        let BOOKINFOP = fetchedRC.object(at: indexPath)
        textconfig(for: cell, with: BOOKINFOP)
        return cell
    }
    
    func textconfig(for cell : UITableViewCell, with item : Book){
        cell.textLabel!.text = item.title
        cell.detailTextLabel?.text = item.author
        //        cell.textLabel!.textColor = functions.randomColor()
        //        cell.detailTextLabel!.textColor = functions.randomColor()
    }
    
    
//    func Filter() {
//        var Pgenre = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        do{
//        var results = try context.execute(Pgenre)
//        }catch let error as NSError{
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//        
//        let filtertext = Pgenre
//        if !filtertext.isEmpty{
//            request.predicate = NSPredicate(format: "genre CONTAINS %@", filtertext)
//            do{
//                RecommendationList = try context.fetch(request)
//            } catch let error as NSError{
//                print("Could not fetch. \(error), \(error.userInfo)")
//            }
//        }
//    }
//    
}
