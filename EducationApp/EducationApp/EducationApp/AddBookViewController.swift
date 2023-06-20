//
//  AddBookViewController.swift
//  EducationApp
//
//  Created by anupriya on 2023-04-18.
//

import UIKit

class AddBookViewController: UIViewController {

    //Define the text fields
    //For book name
    @IBOutlet weak var txtName: UITextField!
    //For book price
    @IBOutlet weak var txtPrice: UITextField!
    //For book type
    @IBOutlet weak var txtType: UITextField!
    //For writer
    @IBOutlet weak var txtWriter: UITextField!
    //For book format
    @IBOutlet weak var pickerType: UIPickerView!
    
    var formatSelected : String?
    
    //book formats
    let types = ["hardcover","paperback","ebook","audiobooks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerType.delegate = self
        pickerType.dataSource = self

    }
    
    @IBAction func onClickAdd(_ sender: Any) {
        
        //Extract the values from the text fields
        //checks the if any text field is empty or nil
        if let name = txtName.text, !name.isEmpty,
           let price = txtPrice.text, !price.isEmpty,
           let type = txtType.text, !type.isEmpty,
           let writer = txtWriter.text, !writer.isEmpty,
           let format = formatSelected, !format.isEmpty
        {
            //Initialized the values
            let newBook = Book(context: DBManager.share.context)
            newBook.name = name
            newBook.price = price
            newBook.type = type
            newBook.writer = writer
            newBook.format = format
            
            DBManager.share.saveContext()
        }
    }
    
}


//Implement the UIPickerViewDelegate and UIPickerViewDataSource protocols
extension AddBookViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerType: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerType: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return types.count
    }
    func pickerView(_ pickerType: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    func pickerView(_ pickerType: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        formatSelected = types[row]
    }
    
}
