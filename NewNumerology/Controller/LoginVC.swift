//
//  LoginViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/26.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Pastel
import Firebase
import ProgressHUD

class LoginVC: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var loginButton: UIButton!
  
  
  let dontHaveAccountButton : UIButton = {
    let button = UIButton(type: .system)
    
    let attributedTitle = NSMutableAttributedString(string: "アカウントを持っていない場合", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.white])
    
    attributedTitle.append(NSAttributedString(string: " 登録はこちら", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.white]))
    
    //ボタンがタップされたタイミングでhandleShowSignUp関数が発動する
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
    
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextField.text = "naoki@gmail.com"
    passwordTextField.text = "12345678"
    loginButton.backgroundColor = AppColors.validBlue
    
    emailTextField.addTarget(self, action: #selector(formaValidation), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(formaValidation), for: .editingChanged)
    
    //ログインボタンの角を丸くする
    loginButton.layer.cornerRadius = 5
    
    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
    //ナビゲーションバーの非表示
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    //グラデーションの設定
    let pastelView = PastelView(frame: view.bounds)
    
    // Custom Direction
    pastelView.startPastelPoint = .bottomLeft
    pastelView.endPastelPoint = .topRight
    
    // Custom Duration
    pastelView.animationDuration = 2.0
    
    // Custom Color
    pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                          UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                          UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                          UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                          UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                          UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
    
    pastelView.startAnimation()
    view.insertSubview(pastelView, at: 0)
  }
  
  //MARK:Handlers
  
  @objc func handleShowSignUp () {
    
    performSegue(withIdentifier: "toRegister", sender: self)
  }
  
  
  @IBAction func forgotPassClicked(_ sender: Any) {
    
    //ここでのvcはForgotPasswordVCのことを指す
    let vc = ForgotPasswordVC()
    
    //どのように画面に遷移するか
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overCurrentContext
    present(vc, animated: true, completion: nil)
    
  }
  
  @IBAction func loginClicked(_ sender: Any) {
    
    guard let email = emailTextField.text, email.isNotEmpty ,
      let password = passwordTextField.text, password.isNotEmpty else {
        
        ProgressHUD.showError("メールアドレスとパスワードを入力してください")
        
        return }
    
    ProgressHUD.show("ログイン中です・・・")
    
    //{ (user, error)に関して、今のところはこういうものだと理解しておけばいいのかな
    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
      
      if error != nil {
        ProgressHUD.showError("入力内容が正しくありません")
        return
        
      }
      
      ProgressHUD.showSuccess("ログインに成功しました")
      
      //Present the app
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

         DefineTabBar.createTabBar()
        
      }
    }
  }
  
  @objc func formaValidation(){
    
    guard
      emailTextField.hasText,
      passwordTextField.hasText else {
        
        //入力内容を満たしていない場合
        loginButton.isEnabled = false
        loginButton.backgroundColor = AppColors.inValidBlue
        return
    }
    
    //正しく入力されている場合
    loginButton.isEnabled = true
    loginButton.backgroundColor = AppColors.validBlue
    return
    
  }
}

extension LoginVC {
  
  //空いているところをクリックした時にキーボードを閉じる
  override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    emailTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
    
  }
  
  //リターンキーをクリックした時にキーボードを閉じる
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    //キーボードを閉じる
    emailTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
    
    return true
    
  }
  
}
