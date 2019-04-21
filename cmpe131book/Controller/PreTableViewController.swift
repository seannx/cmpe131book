//
//  PrefTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/17/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit
import CoreData

class PrefTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    private var fetchedRC : NSFetchedResultsController<User>!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    let request = User.fetchRequest() as NSFetchRequest<User>
    var Test = ""
    var test = [User]()
    var currentTextfield = UITextField()
    var pickerView = UIPickerView()
    
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var Genre: UITextField!
    var  GenderT: [String] = ["Male", "Female", "Others"]
    var  AgeT:[String] = ["Teenager", "Adult", "elder"]
    var  GenreT:[String] = ["Art", "Fiction", "Non-Fiction", "Science"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextfield == Gender {
            return GenderT.count
        }
        else if currentTextfield == Age{
            return AgeT.count
        }
        else if currentTextfield == Genre{
            return GenreT.count
        }
        else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextfield == Gender {
            return GenderT[row]
        }
        else if currentTextfield == Age{
            return AgeT[row]
        }
        else if currentTextfield == Genre{
            return GenreT[row]
        }
        else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextfield == Gender {
            let user = User(entity: User.entity(), insertInto: context)
            Gender.text = GenderT[row]
            user.gender = GenderT[row]
            Test = GenreT[row]
            self.view.endEditing(true)
        }
        else if currentTextfield == Age{
            let user = User(entity: User.entity(), insertInto: context)
            Age.text = AgeT[row]
            user.age = AgeT[row]
            self.view.endEditing(true)
        }
        else if currentTextfield == Genre{
            let user = User(entity: User.entity(), insertInto: context)
            Genre.text = GenreT[row]
            user.age = GenreT[row]
            self.view.endEditing(true)
        }
        appDelegate.saveContext()
        Filter()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextfield = textField
        if currentTextfield == Gender {
            currentTextfield.inputView = pickerView
        }
        else if currentTextfield == Age{
            currentTextfield.inputView = pickerView
        }
        else if currentTextfield == Genre{
            currentTextfield.inputView = pickerView
        }
    }
    func Filter() {
        let filtertext = Test
        if !filtertext.isEmpty{
            request.predicate = NSPredicate(format: "gender CONTAINS %@", filtertext)
            do{
                test = try context.fetch(request)
            } catch let error as NSError{
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    
    
    
}
