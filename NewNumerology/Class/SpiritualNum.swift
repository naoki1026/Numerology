//
//  SpiritualNum.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/23.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class SpiritualNum : NSObject {
  
  //スピリチュアルナンバーを算出する
  static func calcSpiritual (year: String, month: String, day: String) -> Int {
    
    //日の指定した番号の文字列を抽出して、数値型にキャスト
    let firstDay = Int(day.prefix(1))!
    let secondDay = Int(day.suffix(1))!
    
    let sumDay = firstDay + secondDay
    var resultSpiritNumber = 0
    
    switch sumDay {
      
    case 10 : resultSpiritNumber = 1
    case 11 : resultSpiritNumber = 11
    case 22 : resultSpiritNumber = 22
    case 33 : resultSpiritNumber = 33
    default:  resultSpiritNumber = sumDay
      
    }
    
    return resultSpiritNumber
    
  }
  
 
}

