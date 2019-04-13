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
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
//    var currentbook = [Infobase]()
//    var filteredbook = [Infobase]()
    private var BOOK = [Book]()
    private var filterBook = [Book]()
    private var selected : IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100 // set the hight of each cell
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done

    }
    required init?(coder aDecoder: NSCoder) {
//        BooKINFO = Bookinfo()
//        function = functions()
        super.init(coder: aDecoder)
//        currentbook = BooKINFO.Book
        
    }// init book info
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Addbook() {
        let data = Bookdata()
        let book = Book(entity: Book.entity(), insertInto: context)
        book.title = data.title
        book.author = data.author
        book.genre = data.genre
        book.publisher = data.publisher
        appDelegate.saveContext()
        BOOK.append(book)
        let index = IndexPath(row: BOOK.count-1, section: 0)
        tableview?.insertRows(at: [index], with: .automatic)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return BOOK.count
    }// init number of cells
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)// enable animation for selection
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let BOOKINFO = BOOK[indexPath.row]
        textconfig(for: cell, with: BOOKINFO)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Passdetail"{
            if let DetailTableViewController = segue.destination as? DetailTableViewController{
                if let cell = sender as? UITableViewCell, let indexp = tableView.indexPath(for: cell){
                    let information = BOOK[indexp.row]
                    DetailTableViewController.INFO = information
                }
            }
        }
    }// pass data to detailtableviewcontroller
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let Position = BOOK[indexPath.row]
        
        if editingStyle == .delete{
            context.delete(Position)
            do{
                try context.save()
            } catch let error as NSError{
                print ("Error while deleting Note: \(error.userInfo)")
            }
        }
        
        do{
            BOOK = try context.fetch(fetchrequest) as! [Book]
        } catch let error as NSError{
            print("Error while fetching data from DB: \(error.userInfo)")
        }
        tableView.reloadData()
//        BOOK.remove(at: indexPath.row)
//        let InDexpath = [indexPath]
//        tableView.deleteRows(at: InDexpath, with: .fade)
    }//delete function

    func textconfig(for cell : UITableViewCell, with item : Book){
        cell.textLabel!.text = item.title
        cell.detailTextLabel?.text = item.author
//        cell.textLabel!.textColor = functions.randomColor()
//        cell.detailTextLabel!.textColor = functions.randomColor()
    }//set textconten for each cell
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let query = searchBar.text else {
            return
        }
        if !query.isEmpty{
        let request = Book.fetchRequest() as NSFetchRequest<Book>
        request.predicate = NSPredicate(format: "title CONTAINS %@", query)
        
        do{
            BOOK = try context.fetch(request)
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
    
    func saveBook(){
        
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard let query = searchBar.text else {
//            return
//        }
//        let request = Book.fetchRequest() as NSFetchRequest<Book>
//        request.predicate = NSPredicate(format: "title == %@", query)
//
//        do{
//            BOOK = try context.fetch(request)
//        }catch let error as NSError{
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//        searchBar.resignFirstResponder()
//        tableview.reloadData()
//    }
    
    private func refresh(){
        do{
            BOOK = try context.fetch(Book.fetchRequest())
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
//        guard !searchText.isEmpty else {
//            filterBook = BOOK
//            tableview.reloadData()
//            return}
//        filterBook = BOOK.filter({ (Book) -> Bool in
//            (Book.title?.lowercased().contains(searchText.lowercased()))!
//        })
//        tableview.reloadData()
//    }

}




