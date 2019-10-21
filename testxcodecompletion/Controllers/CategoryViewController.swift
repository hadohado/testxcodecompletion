//
//  ViewController.swift
//  testxcodecompletion
//
//  Created by ha tuong do on 10/21/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {

    
    var todoItems = ["king", "queen", "princess", "prince", "lord"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

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
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }

}

