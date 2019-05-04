//
//  Model.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/23.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation
import RealmSwift

class FortuneTellingResult : Object {
  
  @objc dynamic var uuid : String = ""
  @objc dynamic var fullName : String = ""
  @objc dynamic var birthday : String = ""
  @objc dynamic var myNumber : Int = 0
  @objc dynamic var lifepass : Int  = 0
  @objc dynamic var soul : Int = 0
  @objc dynamic var spiritual : Int = 0
  @objc dynamic var destiny : Int = 0
  @objc dynamic var balance : Int = 0
  @objc dynamic var personal : Int = 0
  @objc dynamic var lastUpdate : Int = 0
  
}

class MyFortuneTellingResult : Object {
  
  @objc dynamic var uuid : String = ""
  @objc dynamic var fullName : String = ""
  @objc dynamic var birthday : String = ""
  @objc dynamic var myNumber : Int = 0
  @objc dynamic var lifepass : Int  = 0
  @objc dynamic var soul : Int = 0
  @objc dynamic var spiritual : Int = 0
  @objc dynamic var destiny : Int = 0
  @objc dynamic var balance : Int = 0
  @objc dynamic var personal : Int = 0
  @objc dynamic var lastUpdate : Int = 0
  
}
