//
//  LifePassNum.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/23.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class LifePassNum : NSObject  {
  
  //ライフパスナンバーを算出する
  static func calcLifePass(year : String, month: String, day: String) -> Int {
    
    //年の指定した番号の文字列を抽出して、数値型にキャスト
    let firstYear = Int(year.prefix(1))!
    let secondYear = Int(year[year.index(year.startIndex, offsetBy: 1)..<year.index(year.startIndex, offsetBy: 2)])!
    let thirdYear = Int(year[year.index(year.startIndex, offsetBy: 2)..<year.index(year.startIndex, offsetBy: 3)])!
    let fourthYear = Int(year.suffix(1))!
    
    //年の合計値を算出
    let sumYear = firstYear + secondYear + thirdYear + fourthYear
    
    //月の指定した番号の文字列を抽出して、数値型にキャスト
    let firstMonth = Int(month.prefix(1))!
    let secondMonth = Int(month.suffix(1))!
    let sumMonth = firstMonth + secondMonth
    
    //日の指定した番号の文字列を抽出して、数値型にキャスト
    let firstDay = Int(day.prefix(1))!
    let secondDay = Int(day.suffix(1))!
    let sumDay = firstDay + secondDay
    
    //ライフパスナンバーを算出
    let lifePassNumber = String(sumYear + sumMonth + sumDay)
    let firstLPN = Int(lifePassNumber.prefix(1))!
    let secondLPN = Int(lifePassNumber.suffix(1))!
    
    let finalLPN = firstLPN + secondLPN
    var resultLifePassNumber = 0
    
    //年月日を合算した数字
    let birthday = sumYear + sumMonth + sumDay
    
    //年月日を合算した数字からライフパスナンバーを算出
    switch birthday {
      
    case 10 : resultLifePassNumber = 1
    case 11 : resultLifePassNumber = 11
    case 22 : resultLifePassNumber = 22
    case 33 : resultLifePassNumber = 33
    default:
      
      switch finalLPN {
      case 10 : resultLifePassNumber = 1
      case 11 : resultLifePassNumber = 11
      case 22 : resultLifePassNumber = 22
      case 33 : resultLifePassNumber = 33
      default:
        
        if finalLPN < 10 {
          
          resultLifePassNumber = finalLPN
          
        } else {
          
          switch Int(String(finalLPN).prefix(1))! + Int(String(finalLPN).suffix(1))! {
            
          case 10 : resultLifePassNumber = 1
          case 11 : resultLifePassNumber = 11
          case 22 : resultLifePassNumber = 22
          case 33 : resultLifePassNumber = 33
          default:  resultLifePassNumber = Int(String(finalLPN).prefix(1))! + Int(String(finalLPN).suffix(1))!
            
          }
        }
      }
    }
    
    return resultLifePassNumber
    
  }
}
