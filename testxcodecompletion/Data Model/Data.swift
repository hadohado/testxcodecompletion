//
//  Data.swift
//  testxcodecompletion
//
//  Created by ha tuong do on 10/21/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import Foundation

import RealmSwift


//----------------------------------------------------
// Object is a class defined to use Realm model object
// use Object to enable use to let Realm save our Data !!!
//----------------------------------------------------
class Data : Object {
    @objc dynamic var name :  String = ""
    @objc dynamic var age : Int = 1
}
