//
//  RegisterViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/26.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Firebase
import ProgressHUD

class RegisterVC: UIViewController, UITextFieldDelegate {
  
  
  @IBOutlet weak var emailTxt: UITextField!
  @IBOutlet weak var passwordTxt: UITextField!
  @IBOutlet weak var confirmPassTxt: UITextField!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
 
  @IBOutlet weak var registerButton: UIButton!
  
  @IBOutlet weak var passChecking: UIImageView!
  @IBOutlet weak var confirmPassChecking: UIImageView!
  
  let dontHaveAccountButton : UIButton = {
    
    let button = UIButton(type: .system)
    
    let attributedTitle = NSMutableAttributedString(string: "すでにアカウントをお持ちの場合", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    
    attributedTitle.append(NSAttributedString(string: " ログイン", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: AppColors.validBlue]))
    
    //ボタンがタップされたタイミングでhandleShowSignUp関数が発動する
    button.addTarget(self, action: #selector(handlebackLogin), for: .touchUpInside)
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
    
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTxt.delegate = self
    passwordTxt.delegate = self
    confirmPassTxt.delegate = self
    
    passwordTxt.addTarget(self, action: #selector(textFielDidChange(_:)), for: UIControl.Event.editingChanged)
    confirmPassTxt.addTarget(self, action: #selector(textFielDidChange(_:)), for: UIControl.Event.editingChanged)
    registerButton.isEnabled = false
    
    registerButton.layer.cornerRadius = 5
    
    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
  }
  
  @objc func handlebackLogin(){
    
    self.dismiss(animated: true, completion: nil)
    
  }
  
  //文字が入力された時に反応するメソッド
  @objc func textFielDidChange(_ textField: UITextField) {
    
    guard let passTxt = passwordTxt.text else { return }
    
    //confirmPassTxtを入力し始めた時
    if textField == confirmPassTxt {
      
      //マークの赤色が緑色に変わる
      passChecking.isHidden = false
      confirmPassChecking.isHidden = false
      
    } else {
      
      //passTxtが入力されていない場合
      if passTxt.isEmpty {
        
        passChecking.isHidden = true
        confirmPassChecking.isHidden = true
        confirmPassTxt.text = ""
        
      }
    }
    
    //
    //パスワードが一致しているときに、チェックマークが赤色から緑色に変わる
    if passwordTxt.text == confirmPassTxt.text {
      
      passChecking.image = UIImage(named: "green_check")
      confirmPassChecking.image = UIImage(named: "green_check")
      
    } else {
      
      passChecking.image = UIImage(named: "red_check")
      confirmPassChecking.image = UIImage(named: "red_check")
      
    }
    
    guard let email = emailTxt.text, email.isNotEmpty ,
      let password = passwordTxt.text, password.isNotEmpty,
      let confirm = confirmPassTxt.text, confirm.isNotEmpty else { return }
    
    registerButton.backgroundColor = AppColors.validBlue
    registerButton.isEnabled = true
    
  }
  
  @IBAction func registerClicked(_ sender: Any) {
    
    guard let email = emailTxt.text, email.isNotEmpty ,
      let password = passwordTxt.text, password.isNotEmpty else {
        
        ProgressHUD.showError("全ての項目を入力してください")
        return
    }
    //, confirmPass == password <- この部分はなおかつと捉えればいいのかな
    guard let confirmPass = confirmPassTxt.text , confirmPass == password else {
      
      ProgressHUD.showError("パスワードが一致していません")
      return
    }
    
    //メールアドレスとパスワードがnilではないことを確認できた後にIndicatorを表示する
    activityIndicator.startAnimating()
    
    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
      
      if  error != nil {
        
        ProgressHUD.showError("エラーのため、登録できませんでした")
        
        return
      } else {
        
        //インディケーターを止める
        self.activityIndicator.stopAnimating()
        ProgressHUD.showSuccess("登録に成功しました")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
          //戻る
          self.dismiss(animated: true, completion: nil)
          
        }
      }
    }
  }
}

//エクステンション
extension RegisterVC {
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    emailTxt.resignFirstResponder()
    passwordTxt.resignFirstResponder()
    confirmPassTxt.resignFirstResponder()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    
    emailTxt.resignFirstResponder()
    passwordTxt.resignFirstResponder()
    confirmPassTxt.resignFirstResponder()
    
    return true
    
  }
  
}
