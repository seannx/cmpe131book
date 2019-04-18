//
//  PrefTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/17/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit

class PrefTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
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
            Gender.text = GenderT[row]
            self.view.endEditing(true)
        }
        else if currentTextfield == Age{
            Age.text = AgeT[row]
            self.view.endEditing(true)
        }
        else if currentTextfield == Genre{
            Genre.text = GenreT[row]
            self.view.endEditing(true)
        }
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
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    
    
    
}
