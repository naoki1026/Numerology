//
//  FortuneTellingViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/22.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import ProgressHUD
import RealmSwift
import Firebase


class FortuneTellingVC: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var dateField: UITextField!
  @IBOutlet var fullName: UITextField!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var headder: UILabel!
  
  let realm = try! Realm()
  var results : Results<FortuneTellingResult>!
  var result : Results<FortuneTellingResult>!
  var myNumber = 0
  
  //名前から数字を算出するための変数
  var buttonFlag = 0

  //UIDatePickerを定義するための変数
  var datePicker: UIDatePicker = UIDatePicker()
  var year : String  = ""
  var month : String = ""
  var day: String = ""
  var fullNameText = ""
  
  // 日付のフォーマット
  let formatter = DateFormatter()
  let formatterYear = DateFormatter()
  let formatterMonth = DateFormatter()
  let formatterDay = DateFormatter()
  
  private var users = [User]()
  private var user : User!
  
  //画面が読み込まれた瞬間に呼び出される
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("myNumberは")
    print(myNumber)
    
    headder.text = myNumber == 1 ? "自分の鑑定" : "鑑定"
    
    self.navigationController?.navigationBar.tintColor = AppColors.navGold
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : AppColors.navGold]
    
    fullName.keyboardType = UIKeyboardType.alphabet
    
    dateField.addTarget(self, action: #selector(formaValidation), for: .allEvents)
    fullName.addTarget(self, action: #selector(formaValidation), for: .editingChanged)
    
    headder.layer.cornerRadius = 5
    nextButton.layer.cornerRadius = 5
 
    // ピッカー設定
    datePicker.datePickerMode = UIDatePicker.Mode.date
    datePicker.timeZone = NSTimeZone.local
    
    //日本用のピッカーに変更している
    datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
    dateField.inputView = datePicker
    
    // 決定バーの生成
    let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
    let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
    toolbar.setItems([spacelItem, doneItem], animated: true)
    
    // インプットビュー設定(紐づいているUITextfieldへ代入)
    dateField.inputView = datePicker
    dateField.inputAccessoryView = toolbar
    
    //dateField.delegate = self
    fullName.delegate = self
    
    //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
    formatter.dateFormat = "yyyy年MM月dd日"
    formatterYear.dateFormat = "yyyy"
    
    //ここはMMにしないとおかしい数字が表示されてしまうので注意
    formatterMonth.dateFormat = "MM"
    formatterDay.dateFormat = "dd"

  }
  
  // UIDatePickerのDoneを押したら発火
  @objc func done() {
    
    dateField.endEditing(true)
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy年MM月dd日"
    dateField.text = "\(formatter.string(from: datePicker.date))"
    buttonFlag = 1
    checkValidation()
    
  }
  
  @IBAction func button(_ sender: Any) {
    
     fullNameText = fullName.text!
     year = String(formatterYear.string(from: datePicker.date))
     month = String(formatterMonth.string(from: datePicker.date))
     day = String(formatterDay.string(from: datePicker.date))
    
    
    //各番号を出す
    let lifepassNumber = LifePassNum.calcLifePass(year: year, month: month, day: day)
    let destinyNumber = DestinyNum.calcDestiny(name: fullNameText)
    let soulNumber = SoulNum.calcSoul(name: fullNameText)
    let personalNumber = PersonalNum.calcPersonal(name: fullNameText)
    let spiritualNumber = SpiritualNum.calcSpiritual(year: year, month: month, day: year)
    let balanceNumber = BalanceNum.calcBalance(year: year, month: month, day: day)

    
    let result = FortuneTellingResult()
    
    result.myNumber = myNumber == 1 ? 1 : 0
    result.uuid = NSUUID().uuidString
    result.fullName = fullName.text!
    result.birthday = dateField.text!
    result.lifepass = lifepassNumber
    result.soul = soulNumber
    result.spiritual = spiritualNumber
    result.destiny = destinyNumber
    result.balance = balanceNumber
    result.personal = personalNumber
    result.lastUpdate = Int(NSDate().timeIntervalSince1970)
    
    if myNumber == 1 {
      
      print("書き込み開始")
      
      guard let userId = Auth.auth().currentUser?.uid else {return}
      Firestore.firestore().document("users/\(userId)").updateData(["number" : lifepassNumber])
      
    }
    
    
    do {
      
      let realm = try Realm()
      try realm.write {
        realm.add(result)
      }
      
    } catch {
      
      print("Error")
      
    }
      
    let resultViewController : ResultVC = self.storyboard?.instantiateViewController(withIdentifier : "Result") as! ResultVC
      
    resultViewController.resultLifepass = lifepassNumber
    resultViewController.resultSoul = soulNumber
    resultViewController.resultSpiritual = spiritualNumber
    resultViewController.resultDestiny = destinyNumber
    resultViewController.resultPersonal = personalNumber
    resultViewController.resultBalance = balanceNumber
    resultViewController.resultName = fullNameText
    resultViewController.resultBirthday = dateField.text!
    resultViewController.myNumber = myNumber
    
    self.navigationController?.pushViewController(resultViewController, animated: true)
    
   }
  
  @objc func formaValidation () {
    
   checkValidation()
    
  }
  
  func checkValidation(){
    
    guard dateField.hasText, fullName.hasText else {
      
      //入力内容を満たしていない場合
      nextButton.isEnabled = false
      nextButton.backgroundColor = AppColors.inValidBlue
      return
    }
    
    //正しく入力されている場合
    nextButton.isEnabled = true
    nextButton.backgroundColor =  AppColors.validBlue
    return
    
  }
  
  
  @IBAction func clickedButton(_ sender: Any) {
    
    
    let vc = RomajiViewController()
    
    //どのように画面に遷移するか
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overCurrentContext
    present(vc, animated: true, completion: nil)
    
    
  }
}

//アルファベット以外入力できない
extension FortuneTellingVC {
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    do {
      
      let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
      
      if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
        ProgressHUD.showError("ローマ字で入力してください")
        fullName.text = ""
        
      }
    }
      
    catch {
      print("ERROR")
      
    }
    
    return true
    
  }
}

extension FortuneTellingVC {
  
  //空いているところをクリックした時にキーボードを閉じる
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    fullName.resignFirstResponder()
  }
  
  //リターンキーをクリックした時にキーボードを閉じる
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    //キーボードを閉じる
    textField.resignFirstResponder()
    
    return true
    
  }
  
}

