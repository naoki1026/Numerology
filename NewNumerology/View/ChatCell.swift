//
//  ChatCell.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/01.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth

protocol ChatDelegate  {
  
  func chatOptionsTapped(chat: Chat)
  
}

class ChatCell: UITableViewCell {
  
  //MARK:Properties
  
  @IBOutlet weak var usernameLbl: UILabel!
  @IBOutlet weak var timeStampLbl: UILabel!
  @IBOutlet weak var chatTxtLbl: UILabel!

  @IBOutlet weak var optionsMenu: UIImageView!
  @IBOutlet weak var commentsNumLabel: UILabel!
  
  private var chat : Chat!
  private var delegate : ChatDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
 
  }
  

  
  func configureCell(chat : Chat){
    
    optionsMenu.isHidden = true
    self.chat = chat
    usernameLbl.text = chat.username
    chatTxtLbl.text = chat.chatTxt
    commentsNumLabel.text = String(chat.numComments)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, hh:mm"
    
    //dateValueでtimestamo型をdate型に変換することができる
    let timestamp = formatter.string(from: chat.timeStamp.dateValue())
    timeStampLbl.text = timestamp
    
    if chat.userId == Auth.auth().currentUser?.uid {
      
      //編集ボタンを有効にしている
      optionsMenu.isHidden = false
      optionsMenu.isUserInteractionEnabled = true
      let tap = UITapGestureRecognizer(target: self, action: #selector(chatOptionsTapped))
      optionsMenu.addGestureRecognizer(tap)
      
    }
  }
  
  @objc func chatOptionsTapped(){
    
    delegate?.chatOptionsTapped(chat: chat)
    
  }
}
