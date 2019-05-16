//
//  Chat.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/01.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation
import Firebase

class Chat {
  
  private(set) var username : String!
  private(set) var timeStamp : Timestamp!
  private(set) var numComments : Int!
  private(set) var numLikes : Int!
  private(set) var chatTxt : String!
  private(set) var documentId : String!
  private(set) var userId : String!
  
  init(username : String, documentId : String, timeStamp: Timestamp, numComments : Int, chatText : String, userId : String) {
    
    self.username = username
    self.documentId = documentId
    self.timeStamp = timeStamp
    self.numComments = numComments
    self.chatTxt = chatText
    self.userId = userId
    
  }
  
  class func parseData(snapshot: QuerySnapshot?) -> [Chat]{
    
    var chats = [Chat]()
    
    guard let snap = snapshot else { return chats }
    
    for document in snap.documents {
      
      let data = document.data()
      let username = data[USERNAME] as? String ?? "Anonymous"
      
      //timestamp型に変換
      let timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
      let chatTxt = data[CHAT_TXT] as? String ?? ""
      let numComments = data[NUM_COMMENTS] as? Int ?? 0
      let documentId = document.documentID
      let userId = data[USER_ID] as? String ?? ""
      
      let newChat = Chat(username: username, documentId: documentId, timeStamp: timeStamp, numComments: numComments, chatText: chatTxt, userId: userId)
      chats.append(newChat)
      
    }
    
    return chats
    
    
  }
  
}
