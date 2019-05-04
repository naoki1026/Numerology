//
//  BalanceNum.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/27.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation

class BalanceNum : NSObject {
  
  //バランスナンバーを算出する
  static func calcBalance(year: String, month: String, day: String) -> Int {
    
    var balanceNumber = 0
    let lifepassNumber = LifePassNum.calcLifePass(year: year, month: month, day: day)
    let calcBalance = 9 - lifepassNumber
    
    switch lifepassNumber {
      
    case 11: balanceNumber = 7
    case 22: balanceNumber = 5
    case 33: balanceNumber = 6
    case  9: balanceNumber = 0
    default: balanceNumber = calcBalance
      
    }
    
    return balanceNumber
    
  }
  
  
  
  
}
