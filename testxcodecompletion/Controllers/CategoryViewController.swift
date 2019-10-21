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

//class CategoryViewController: UITableViewController {
//    
//    let realm = try! Realm()
//    
//    var categories: Results<Category>?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loadCategories()
//        tableView.separatorStyle = .none
//    }
//    
//    func loadCategories() {
//        categories  = realm.objects(Category.self)
//        tableView.reloadData()
//    }
//
//    //MARK: - TableView Datasource Methods
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return categories?.count ?? 1
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = super.tableView(tableView, cellForRowAt: indexPath)
//        
//        if let category = categories?[indexPath.row] {
//            cell.textLabel?.text = category.name
//            guard let categoryColour = UIColor(named: category.colour) else {fatalError()}
//            
//            cell.backgroundColor = categoryColour
//            cell.textLabel?.textColor = UIColor.green
//        }
//       return cell
//    }
//
//}
