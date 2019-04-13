//
//  DetailTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/3/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit
import CoreData

class DetailTableViewController: UITableViewController {

    
    @IBOutlet weak var T: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var Genre: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var pages: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var IBSN: UILabel!
    weak var delegate : DetailTableViewController?
    weak var BooKINFO : Bookinfo?
    weak var INFO : Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        T.text = INFO?.title
        author.text = INFO?.author
        Genre.text = INFO?.genre
        rating.text = String(INFO!.rating)
        pages.text = String(INFO!.numofpages)
//        level.text = INFO?.readLevel
        publisher.text = INFO?.publisher
        year.text = String(INFO!.year)
        IBSN.text = String(INFO!.isbn)
    }

    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
