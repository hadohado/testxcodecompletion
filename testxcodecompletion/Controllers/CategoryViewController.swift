//
//  ViewController.swift
//  testxcodecompletion
//
//  Created by ha tuong do on 10/21/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    //-----------------------
    // this works can write to Realm database and read back
    // to display on phone
    //----------------------
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    var todoItems = ["king", "queen", "princess", "prince", "lord"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()  //    <--- NEED THIS to load previous Category database
        // Do any additional setup after loading the view.
        
    }

/* old code to populate phone table with hard-code things
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("able to do xcode completion when start typing tableview... and todoItems.count = ", todoItems.count)
        return todoItems.count 
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = super.tableView(tableView, cellForRowAt: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = todoItems[indexPath.row]
        return cell
    }
*/
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableView number or rows = ", categories?.count ?? 1)
        // it prints nil !!!
        return categories?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 'UITableView dataSource returned a nil cell for row at index path: <NSIndexPath: 0xde6b95d812be4639>
        print("start 1 tableView cellForRowAt ...........................")
        
        // next line causes problem !!!
        // let cell = super.tableView(tableView, cellForRowAt: indexPath)
        //..............................
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        print("start 2 tableView cellForRowAt ...........................")
        if let category = categories?[indexPath.row] {
            print("start indexPath.row tableView cellForRowAt, ", indexPath.row, ".....")
            print("tableView cellForRowAt category.name = ", category.name)
            cell.textLabel?.text = category.name
            print("cell = ", cell.textLabel) // this print nil
            // guard let categoryColour = UIColor(named: category.colour) else {fatalError()}
            // cell.backgroundColor = categoryColour
            // cell.textLabel?.textColor = UIColor.green
        }
       return cell
    }

    
    //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    // code to add category to database here !
    //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    
    
    //----------------------------------------------------------------
    // this start the sequence of adding a new Category
    // then we "save" a new Category entry into Realm db using save()
    //----------------------------------------------------------------
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            // newCategory.colour = UIColor.green
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
    
    func loadCategories() {
        categories  = realm.objects(Category.self)
        print("loadCategories() tableView.reloadData() start .........")
        tableView.reloadData()
        print("loadCategories() tableView.reloadData() done ..........")
    }

    
    //MARK: - Data Manipulation Methods
    func save(category: Category) {
        do {
            try realm.write { realm.add(category) }
        } catch { print("Error saving category \(error)") }
        print("save() tableView.reloadData() start ..............")
        tableView.reloadData()
        print("save() tableView.reloadData() done................")
    }
    
    
    
}

