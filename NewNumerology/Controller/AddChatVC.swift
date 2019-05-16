//
//  AddChatVC.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/01.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AddChatVC: UIViewController, UITextViewDelegate {
  
  //MARK: Outlets
  
  @IBOutlet private weak var categorySegment: UISegmentedControl!
  //@IBOutlet private  weak var usernameTxt: UITextField!
  @IBOutlet private weak var chatTxt: UITextView!
  @IBOutlet private weak var postBtn: UIButton!
  
  //MARK: Variables
  
  
  //privateは同一の定義の中でのみ使用可能、仮の目的のために使用するか？
//  private var selectedCategory = ThoughtCategory.funny.rawValue
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    postBtn.layer.cornerRadius = 4
    chatTxt.layer.cornerRadius = 4
    chatTxt.text = "My random thought..."
    chatTxt.textColor = .lightGray
    chatTxt.delegate = self
    
    navigationController?.navigationBar.tintColor = AppColors.navGold
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:  AppColors.navGold]
    
  }
  
  //テキストの入力があるたびに呼び出されるデリゲートメソッド
  func textViewDidBeginEditing(_ textView: UITextView) {
    chatTxt.text = ""
    chatTxt.textColor = .darkGray
    
  }
  
  
  @IBAction func postButtonTapped(_ sender: Any) {
    
    //guard let username = usernameTxt.text else {return}
    
    Firestore.firestore().collection(CHATS_REF).addDocument(data: [
      
      //CATEGORY : selectedCategory,
      NUM_COMMENTS : 0,
      NUM_LIKES : 0,
      CHAT_TXT : chatTxt.text!,
      TIMESTAMP : FieldValue.serverTimestamp(),
      USERNAME : Auth.auth().currentUser?.displayName ?? "",
      USER_ID: Auth.auth().currentUser?.uid ?? ""
      
    ]) { (err) in
      
      if let err = err {
        
        debugPrint("Error adding document: \(err)")
        
      } else {
        
        self.navigationController?.popViewController(animated: true)
        
      }
    }
  }
  



  @objc func addTapped(){
    
    self.dismiss(animated: true, completion: nil)
    
  }
}
