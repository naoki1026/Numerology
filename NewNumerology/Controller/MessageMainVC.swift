//
//  MessageMainVC.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/01.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class MessageMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  //MARK:Outlets
  @IBOutlet private weak var tableView: UITableView!
  
  
  //Properties
  //Chatクラスを配列の中に入れている
  private var chats = [Chat]()
  private var chatsCollectionRef : CollectionReference!
  private var chatsListener : ListenerRegistration!
  private var user : User?
  private var users = [User]()
  
  //後で追加
  private var handle : AuthStateDidChangeListenerHandle?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.estimatedRowHeight = 80
    
    //ここで高さを動的に変更することができる
    tableView.rowHeight = UITableView.automaticDimension
    
    //Firestoreのデータを読み込んでいる
    chatsCollectionRef = Firestore.firestore().collection(CHATS_REF)
    
    navigationController?.navigationBar.tintColor = AppColors.navGold
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:  AppColors.navGold]
    
    self.navigationItem.title = "チャット"

   initialDataUpload()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {

    setListener()
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    
    if chatsListener != nil {
      
      chatsListener.remove()
      
    }
  }
  
  
  func setListener(){
    
    print("setListener")
    
      guard let currentUid = Auth.auth().currentUser?.uid else {return}
    
    var docRef : DocumentReference!
    
    if currentUid != adminID {
      
      docRef = Firestore.firestore().collection(CHATS_REF).document(currentUid)
      docRef.getDocument { (document, error) in
        
        guard let document = document, document.exists else { return }
        guard  let data = document.data() else {return}
        
        if let err = error {
          
          debugPrint("Error fetching docs: \(err)")
          
        } else {
          
          //ここで削除することによってダブルで表示されなくなる
          self.chats.removeAll()
          let username = data[USERNAME] as? String ?? "Anonymous"
          //timestamp型に変換
          let timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
          let chatTxt = data[CHAT_TXT] as? String ?? ""
          //let numLikes = data[NUM_LIKES] as? Int ?? 0
          let numComments = data[NUM_COMMENTS] as? Int ?? 0
          let documentId = document.documentID
          let userId = data[USER_ID] as? String ?? ""
          
          let newChat = Chat(username: username, documentId: documentId, timeStamp: timeStamp, numComments: numComments, chatText: chatTxt, userId: userId)
          self.chats.append(newChat)
          self.tableView.reloadData()
          
        }
      }
      
    } else {
      
      chatsListener = chatsCollectionRef.order(by: TIMESTAMP, descending: true).addSnapshotListener { (snapshot, error) in

        
        if let err = error {
          
          debugPrint("Error fetching docs: \(err)")
          
        } else {
          
          //ここで削除することによってダブルで表示されなくなる
          self.chats.removeAll()
          self.chats = Chat.parseData(snapshot: snapshot)
          self.tableView.reloadData()
          
        }
      }
    }
  }
  
  func initialDataUpload() {
    
    guard let currentUid = Auth.auth().currentUser?.uid else {return}
    if currentUid == adminID {return}
    
    let docRef = Firestore.firestore().collection("chats").document(currentUid)
    docRef.getDocument { (document, error) in
      
      if document?.data() == nil {
        
        Firestore.firestore().collection(CHATS_REF).document(currentUid).setData([
          
          NUM_COMMENTS : 0,
          CHAT_TXT : "この度は、アプリをダウンロードしていただきありがとうございます。より詳しく話を聞きたい場合は、こちらをクリックしてチャットでご連絡ください。",
          TIMESTAMP : FieldValue.serverTimestamp(),
          USERNAME : "数秘術鑑定士",
          FROM_ID: Auth.auth().currentUser?.uid ?? "",
          TO_ID: adminID
          
          ])
        
        self.setListener()
      
      } else {
        
        print("ok")
        
      }
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  chats.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as? ChatCell {
      
      cell.configureCell(chat: chats[indexPath.row])
      return cell
      
    } else {
      
      return UITableViewCell()
      
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "toComments", sender: chats[indexPath.row])
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toComments" {
      
      if let destinationVC = segue.destination as? CommentsVC {
        
        if let thoght = sender as? Chat {
          
          destinationVC.chat = thoght
          
        }
      }
    }
  }
}
