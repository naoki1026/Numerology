//
//  CommentsVC.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/01.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth

class CommentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CommentDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  //variable
  var chat : Chat!
  var comments = [Comment]()
  var user : User?
  var chatRef: DocumentReference!
  let firestore = Firestore.firestore()
  var username : String!
  var commentListener : ListenerRegistration!
  
  
  lazy var containerView : UIView = {
    let containerView = UIView()
    
    
     if UIScreen.main.nativeBounds.height == 2436 {
      
    containerView.frame = CGRect(x: 0, y: 0, width: 100, height: 85)
      
     } else {
      
      containerView.frame = CGRect(x: 0, y: 0, width: 100, height: 55)
      
    }
    
    let sendButton = UIButton(type: .system)
    sendButton.setTitle("送信", for: .normal)
    sendButton.setTitleColor(AppColors.navGold, for: .normal)
    sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
    containerView.addSubview(sendButton)
    sendButton.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 50, height: 0)
    sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    
    containerView.addSubview(messageTextField)
    messageTextField.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: sendButton.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    
    let separatorView = UIView()
    separatorView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    containerView.addSubview(separatorView)
    separatorView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    
    containerView.backgroundColor = AppColors.white
    
    return containerView
    
  }()
  
  let messageTextField : UITextField = {
    
    let tf = UITextField()
    tf.placeholder = "メッセージを入力してください..."
    return tf
    
  }()
  
  override func viewDidLoad() {
  super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    chatRef = firestore.collection(CHATS_REF).document(chat.documentId)
    
    if let name = Auth.auth().currentUser?.displayName { username = name }
      
      navigationController?.navigationBar.tintColor = AppColors.navGold
      navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:  AppColors.navGold]
      navigationItem.title = user?.username
    
//    tableView.estimatedRowHeight = 5
//    tableView.rowHeight = UITableView.automaticDimension

  }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      tabBarController?.tabBar.isHidden = true
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      tabBarController?.tabBar.isHidden = false
      
    }
    
    override var inputAccessoryView: UIView?{
      
      get {
        
        return containerView
        
      }
    }
    
    override var canBecomeFirstResponder: Bool {
      
      return true
      
    }
  
  override func viewDidAppear(_ animated: Bool) {
    commentListener = Firestore.firestore().collection("chats").document(self.chat.documentId).collection( "comments").order(by: TIMESTAMP, descending: true).addSnapshotListener({ (snapshot, error) in

      guard let snapshot = snapshot else {

        print("Error")
        return
      }

      self.comments.removeAll()
      self.comments = Comment.parseData(snapshot: snapshot)
      self.tableView.reloadData()

    })
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    commentListener.remove()
  }
  
  func commentActionsTapped(comment: Comment) {
    
    let alert = UIAlertController(title: "アラート表示", message: "コメントの編集、または削除を行います", preferredStyle: .actionSheet)
    let deleteAction = UIAlertAction(title: "削除", style: .destructive) { (action) in
      self.firestore.runTransaction({ (transaction, errorPointer) -> Any? in
        
        //do以下をchatDocumentの中に入れている
        let chatDocument : DocumentSnapshot
        
        //read
        do {
          
          try chatDocument = transaction.getDocument(self.firestore.collection(CHATS_REF).document(self.chat.documentId))
          
        } catch {
          
          print("Error")
          return nil
          
        }
        
        guard let oldNumComments = chatDocument.data()?[NUM_COMMENTS] as? Int else {return nil}
        
        if oldNumComments == 1 {
          
          transaction.updateData([CHAT_TXT: "この度は、アプリをダウンロードしていただきありがとうございます。鑑定結果の詳細を確認したい場合は、こちらをクリックしてチャットにてご連絡ください。"], forDocument: self.chatRef)
          transaction.updateData([NUM_COMMENTS : 0], forDocument: self.chatRef)
          transaction.updateData([TIMESTAMP: TIMESTAMP], forDocument: self.chatRef)
          transaction.updateData([USERNAME : "数秘術鑑定士"], forDocument: self.chatRef)
          transaction.updateData([FROM_ID: Auth.auth().currentUser?.uid ?? "" ], forDocument: self.chatRef)
          transaction.updateData([TO_ID: adminID], forDocument: self.chatRef)
          
        } else {
          
          //update
          transaction.updateData([CHAT_TXT: "コメント削除"], forDocument: self.chatRef)
          transaction.updateData([NUM_COMMENTS : oldNumComments - 1], forDocument: self.chatRef)
          transaction.updateData([TIMESTAMP: TIMESTAMP], forDocument: self.chatRef)
          transaction.updateData([USERNAME : "削除"], forDocument: self.chatRef)
          
        }
        
        let commentRef = self.firestore.collection(CHATS_REF).document(self.chat.documentId).collection(COMMENTS_REF).document(comment.documentId)
        
        transaction.deleteDocument(commentRef)
        return nil
        
      }) { (object, error) in
        
        if error != nil {
          
          print("Error")
          
          
        } else {
          
          alert.dismiss(animated: true, completion: nil)
          
        }
      }
    }
    
    let editAction = UIAlertAction(title: "編集", style: .default) { (action) in
      
      self.performSegue(withIdentifier: "toEditComment", sender: (comment, self.chat))
      alert.dismiss(animated: true, completion: nil)
    }
    
    let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
    
    
    alert.addAction(editAction)
    alert.addAction(deleteAction)
    alert.addAction(cancelAction)
    present(alert, animated: true, completion: nil)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? UpdateCommentVC {
      
      if let commentData = sender as? (comment: Comment, chat: Chat) {
        destination.commentData = commentData
      }
    }
  }
  
  
  @objc func handleSend (){
    
    guard let commentTxt = messageTextField.text else { return }
    
    firestore.runTransaction({ (transaction, errorPointer) -> Any? in
      
      //do以下をchatDocumentの中に入れている
      let chatDocument : DocumentSnapshot
      
      //read
      do {
        
        try chatDocument = transaction.getDocument(self.firestore.collection(CHATS_REF).document(self.chat.documentId))
        
      } catch {
        
        print("chatDocument Error")
        return nil
        
      }
      
      guard let oldNumComments = chatDocument.data()?[NUM_COMMENTS] as? Int else {return nil}
      
      //update
      transaction.updateData([NUM_COMMENTS : oldNumComments + 1], forDocument: self.chatRef)
      transaction.updateData([CHAT_TXT : commentTxt], forDocument: self.chatRef)
      transaction.updateData([USERNAME : self.username!], forDocument: self.chatRef)
      transaction.updateData([TIMESTAMP: TIMESTAMP], forDocument: self.chatRef)
      
      let newCommentRef = self.firestore.collection(CHATS_REF).document(self.chat.documentId).collection(COMMENTS_REF).document()
      
      //write
      transaction.setData([
        COMMENT_TXT : commentTxt,
        TIMESTAMP: FieldValue.serverTimestamp(),
        USERNAME : self.username ?? "",
        USER_ID : Auth.auth().currentUser?.uid ?? ""
        
        ], forDocument: newCommentRef)
      
      return nil
      
    }) { (object, error) in
      
      if error != nil {
        
        print("Error")
        
        
      } else {
        
        self.messageTextField.text = " "
        //ボタンをクリックしたら閉じるようになっている
        self.messageTextField.resignFirstResponder()
        
      }
    }
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return comments.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentCell {
      
      cell.configureCell(comment: comments[indexPath.row], delegate: self )
      return cell
      
    }
    
    return UITableViewCell()
  }
}
