//
//  CategoryViewController.swift
//  testxcodecompletion
//
//  Created by ha tuong do on 10/21/19.
//  Copyright © 2019 alpine. All rights reserved.
//

// import Foundation
import UIKit
import RealmSwift
// import ChameleonFramework

class XXXCategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?

    /*
         Results is an auto-updating container type in Realm returned from object queries.
         Declaration

         final class Results<Element> : NSObject, NSFastEnumeration where Element : RealmCollectionValue
         Discussion

         Results can be queried with the same predicates as List<Element>, and you can chain queries to further filter query results.
         Results always reflect the current state of the Realm on the current thread, including during write transactions on the current thread. The one exception to this is when using for...in enumeration, which will always enumerate over the objects which matched the query when the enumeration is begun, even if some of them are deleted or modified to be excluded by the filter during the enumeration.
         Results are lazily evaluated the first time they are accessed; they only run queries when the result of the query is requested. This means that chaining several temporary Results to sort and filter your data does not perform any unnecessary work processing the intermediate state.
         Once the results have been evaluated or a notification block has been added, the results are eagerly kept up-to-date, with the work done to keep them up-to-date done on a background thread whenever possible.
         Results instances cannot be directly instantiated.
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        tableView.separatorStyle = .none
    }
    
    //-------------------------------------------------------
    //MARK: - Add New Categories
    //-------------------------------------------------------
    // @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            // newCategory.colour = UIColor.randomFlat().hexValue()
            
            self.save(category: newCategory)
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    //-------------------------------
    // create new data inside Realm db
    //-------------------------------
    func loadCategories() {
        categories  = realm.objects(Category.self)
        tableView.reloadData()
    }

    //MARK: - Data Manipulation Methods
    func save(category: Category) {
        do {
            try realm.write { realm.add(category) }
        } catch { print("Error saving category \(error)") }
        tableView.reloadData()
    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let category = categories?[indexPath.row] {
            cell.textLabel?.text = category.name
            guard let categoryColour = UIColor(named: category.colour) else {fatalError()}
            
            cell.backgroundColor = categoryColour
            cell.textLabel?.textColor = UIColor.green
        }
       return cell
    }

}
