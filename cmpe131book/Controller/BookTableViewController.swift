//
//  BOOKTableViewController.swift
//  BOOK
//
//  Created by 安博 on 3/13/19.
//  Copyright © 2019 安博. All rights reserved.
//

import UIKit
import CoreData
class BOOKTableViewController: UITableViewController, UISearchBarDelegate{
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    private var fetchedRC : NSFetchedResultsController<Book>!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
    let request = Book.fetchRequest() as NSFetchRequest<Book>
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var filterBook = [Book]()
    private var selected : IndexPath!
    private var query = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100 // set the hight of each cell
        defaultBK()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }// init book info
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func Addbook(_ sender: Any) {
//        let data = Bookdata()
//        let book = Book(entity: Book.entity(), insertInto: context)
//        book.title = data.title
//        book.author = data.author
//        book.genre = data.genre
//        book.publisher = data.publisher
//        appDelegate.saveContext()
//        refresh()
//        tableview.reloadData()
//    }
    func ResetDB(){
        let Dele = NSBatchDeleteRequest(fetchRequest: fetchrequest)
        do{
            try context.execute(Dele)
        } catch let error as NSError{
            print("Cannot Delete, \(error), \(error.userInfo)")
        }
    }
   

    func defaultBK(){
        if launch == "Y"{
            ResetDB()
            
//            let Dtitle = ["Where the Crawdads Sing","The Silent Patient","The Road Beyond Ruin","Beyond the Great River"]
//            let entity = NSEntityDescription.entity(forEntityName: "Book", in: context)!
//
//            for title in Dtitle{
//                let TITLE = NSManagedObject(entity: entity, insertInto: context)
//                TITLE.setValue(title, forKey: "title")
//                TITLE.setValue(title, forKey: "author")
//                TITLE.setValue(title, forKey: "genre")
//                TITLE.setValue(title, forKey: "publisher")
//            }
            let IN = Bookdata()
            var i = IN.count-1
            print("the number of count is ,\(i)")
            while i >= 0{
            let data = Bookdata()
            let book = Book(entity: Book.entity(), insertInto: context)
            book.title = data.title[i]
            book.author = data.author[i]
            book.genre = data.genre[i]
            book.publisher = data.publisher[i]
                i = i - 1
            }
            appDelegate.saveContext()
            refresh()
            tableview.reloadData()
        } else{
            refresh()
            tableView.reloadData()
            print("NOT FIRST TIME")
        }
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let objs = fetchedRC.fetchedObjects else{
            return 0
        }
       return objs.count
    }// init number of cells
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)// enable animation for selection
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let BOOKINFOP = fetchedRC.object(at: indexPath)
        textconfig(for: cell, with: BOOKINFOP)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Passdetail"{
            if let DetailTableViewController = segue.destination as? DetailTableViewController{
                if let cell = sender as? UITableViewCell, let indexp = tableView.indexPath(for: cell){
                    let information = fetchedRC.object(at: indexp)
                    DetailTableViewController.INFO = information
                }
            }
        }
    }// pass data to detailtableviewcontroller
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let Position = fetchedRC.object(at: indexPath)
        
        if editingStyle == .delete{
            context.delete(Position)
            do{
                try context.save()
            } catch let error as NSError{
                print ("Error while deleting Note: \(error.userInfo)")
            }
            
        }
        
        do{
            fetchedRC = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            try fetchedRC.performFetch()
        } catch let error as NSError{
            print("Error while fetching data from DB: \(error.userInfo)")
        }
        refresh()
        tableView.reloadData()

    }//delete function

    func textconfig(for cell : UITableViewCell, with item : Book){
        cell.textLabel!.text = item.title
        cell.detailTextLabel?.text = item.author
//        cell.textLabel!.textColor = functions.randomColor()
//        cell.detailTextLabel!.textColor = functions.randomColor()
    }//set textconten for each cell
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let txt = searchBar.text else {
            return
        }
        query = txt
        if !query.isEmpty{
        request.predicate = NSPredicate(format: "title CONTAINS %@", query)
        
        do{
            fetchedRC = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            try fetchedRC.performFetch()
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
            tableview.reloadData()
        } else {
            refresh()
            searchBar.text = nil
            tableview.reloadData()
        }
    }
    

    
    private func refresh(){
        if !query.isEmpty{
            request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", query)
        }
        let sort = NSSortDescriptor(key: #keyPath(Book.title), ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
        request.sortDescriptors = [sort]
        do{
            fetchedRC = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            try fetchedRC.performFetch()
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}




