//
//  ViewController.swift
//  EducationApp
//
//  Created by anupriya on 2023-04-18.
//

import UIKit

class ViewController: UIViewController {
    
    var books = [Book]()

    @IBOutlet weak var bookTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        books = DBManager.share.fetchBook()
        bookTableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    //fetches all the books from Core Data and returns them as an array of Book objects
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let aBook = books[indexPath.row]
        cell.textLabel?.text = aBook.name
        cell.detailTextLabel?.text = aBook.type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            
            //Declare error type
            enum MyError: Error {
                case deletingError
            }

            //Check the deleting part working correctly and if not display some error message
                do{
                    if indexPath.row  >= books.count {
                        throw MyError.deletingError
                    }
                    DBManager.share.context.delete(books[indexPath.row])
                    DBManager.share.saveContext()
                    books.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
                catch{
                    print("Error occurs when deleting")
                }
            
        }
    }
    
    
}

