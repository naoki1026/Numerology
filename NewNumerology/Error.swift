//
//  Error.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/23.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//


import UIKit

extension String {
  
  //文字型に対してエクステンションを行う
  var isNotEmpty : Bool {
    
    return !isEmpty
    
  }
  
}


extension FortuneTellingVC {
  
  
  
  func inputError () {
    
    
    if fullName.text != "" &&  dateField.text == "" {
      
      //simpleAlert(title: "入力エラー", msg: "生年月日を選択してください。")
      
      
    }  else if fullName.text == "" && dateField.text == ""  {
      
     // simpleAlert(title: "入力エラー", msg: "生年月日を選択して、名前を入力してください。")
      
      
    }    else if fullName.text == "" && dateField.text != ""  {
      
      //simpleAlert(title: "入力エラー", msg: "名前を入力してください。")
      
      //    } else {
      
      //    nextButton.isEnabled = true
      //    self.nextButton.setTitleColor(UIColor.white, for: .normal)
      //    nextButton.setTitle("確認する", for: .normal)
      
    }
    
  }
  
}
