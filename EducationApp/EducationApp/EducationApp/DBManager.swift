//
//  DBManager.swift
//  EducationApp
//
//  Created by anupriya on 2023-04-18.
//

import UIKit
import CoreData

class DBManager {
    
    static let share = DBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "EducationApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                //If there any error occurs display error message
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)") //If there any error occurs display error message
            }
        }
    }
    
    //fetches all the books from Core Data and returns them as an array of Book objects
    
    func fetchBook() -> [Book] {
        
        var book = [Book]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Book.description())
        
        do{
            book = try context.fetch(fetchRequest) as! [Book]
        }catch{
            print("Error occurs when fetching")
        }
        
        return book
    }
}
