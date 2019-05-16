//
//  User.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/04.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation
import Firebase

class User {
  
  private(set) var username : String!
  private(set) var timeStamp : Timestamp!
  private(set) var number : Int!
  private(set) var userId : String!

  
  init(username : String,  timeStamp: Timestamp, number: Int, userId: String) {
    
    self.username = username
    self.timeStamp = timeStamp
    self.number = number
    self.userId = userId
   
    
  }
  
  class func parseData(snapshot: QuerySnapshot?) -> [User]{
    
    var users = [User]()
    
    guard let snap = snapshot else { return users }
    let currentUid = Auth.auth().currentUser?.uid
    
    for document in snap.documents {
      
      let data = document.data()
      let username = data[USERNAME] as? String ?? "Anonymous"
      
      //timestamp型に変換
      let timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()

      let number = data["number"] as? Int ?? 0
      
      let userId = data["userId"] as? String ?? ""
    
      
      let newUser = User(username: username, timeStamp: timeStamp, number: number, userId: userId)
      
      if newUser.userId != currentUid {
        
        users.append(newUser)
        
      }
    }
    
    return users
    
  }
}
