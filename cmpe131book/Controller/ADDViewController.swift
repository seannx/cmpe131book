//
//  ADDViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/17/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit
import CoreData
protocol AddViewControllerDelegate:class {
    func addViewControllerDidADD(_ controller: ADDViewController)
}

class ADDViewController: UIViewController {
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    private var fetchedRC : NSFetchedResultsController<Book>!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
    let request = Book.fetchRequest() as NSFetchRequest<Book>
    weak var delegate: AddViewControllerDelegate?
    
      weak var BINFO : Book?
    @IBOutlet weak var Abs: UILabel!
    @IBOutlet weak var abstext: UITextView!
    @IBOutlet weak var IMA: UIImageView!
    @IBAction func ADDBOOK(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let book = Book(entity: Book.entity(), insertInto: context)
        book.title = BINFO?.title
        book.author = BINFO?.author
        book.genre = BINFO?.genre
        book.publisher = BINFO?.publisher
        appDelegate.saveContext()
        delegate?.addViewControllerDidADD(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Abs.text = BINFO?.title
        // Do any additional setup after loading the view.
    }

}

