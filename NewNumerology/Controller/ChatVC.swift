//
//  MessagesController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/04.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Firebase

class ChatVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
    tableView.delegate = self
    tableView.dataSource = self
    self.navigationController?.navigationBar.tintColor = AppColors.navGold
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : AppColors.navGold]
    self.navigationItem.title = "チャット"

      
    }
  
  
  @IBAction func handleNewMessage(_ sender: Any) {
    
    
    
  }
  
}

extension ChatVC :  UITableViewDelegate, UITableViewDataSource{
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
     cell.selectionStyle = .none
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 75
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Did select row")
  }
  

  
}
