//
//  Item.swift
//  testxcodecompletion
//
//  Created by ha tuong do on 10/21/19.
//  Copyright © 2019 alpine. All rights reserved.
//
import Foundation

import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
    // note that Category is a class
    // whereas Category.self is a Type
    // we need a Type !
    // "items" is the name of the forward relationship defined in Item.swift:   let items = List<Item>()
    
}
