//
//  User.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/04.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

class User {
  
  //attributes
  //データベース上に保有しているユーザー情報である
  //辞書型で保有している
  var username : String!
  var name : String!
  var profileImageUrl : String!
  var uid : String!
  var isFollowed = false
  
  
  init(uid: String, dictionary: Dictionary<String, AnyObject>) {
    
    self.uid = uid
    
    //"username"は辞書型におけるキー値である
    if let username = dictionary["username"] as? String {
      self.username = username
      
    }
    
    if let name = dictionary["name"] as? String {
      self.name = name
      
    }
    
    if let profileImageUrl = dictionary["profileImageUrl"] as? String {
      self.profileImageUrl = profileImageUrl
      
    }
  }
}
