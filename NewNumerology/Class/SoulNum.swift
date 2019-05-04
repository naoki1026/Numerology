//
//  SoulNum.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/27.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation

class SoulNum : NSObject {
  
  //ソウルナンバーを算出する
  static func calcSoul(name : String) -> Int {
    
    let upper = Int(name.count) - 1
    //var calcSoul = changeBoin(alphabet: name)
    var boinNumber = 0
    var sumBoinNumber = 0
    
    for count in 0...upper {
      
      boinNumber = NumericalInversion.changeBoin(alphabet: (String(name[name.index(name.startIndex, offsetBy: (0 + count))..<name.index(name.startIndex, offsetBy: (count + 1))])))
      sumBoinNumber += boinNumber
      
    }
    
    //指定した番号の文字列を抽出して、数値型にキャスト
    let firstBoin = Int(String(sumBoinNumber).prefix(1))!
    let secondBoin = Int(String(sumBoinNumber).suffix(1))!
    let sumBoin = firstBoin + secondBoin
    var resultSoulNumber = 0
    
    switch sumBoinNumber {
      
    case 10 : resultSoulNumber = 1
    case 11 : resultSoulNumber = 11
    case 22 : resultSoulNumber = 22
    case 33 : resultSoulNumber = 33
    default:
      
      
      switch sumBoin {
        
      case 10 : resultSoulNumber = 1
      case 11 : resultSoulNumber = 11
      case 22 : resultSoulNumber = 22
      case 33 : resultSoulNumber = 33
      default:
        
        if sumBoin < 10 {
          
          resultSoulNumber = sumBoin
          
        } else {
          
          switch Int(String(sumBoin).prefix(1))! + Int(String(sumBoin).suffix(1))! {
            
          case 10 : resultSoulNumber = 1
          case 11 : resultSoulNumber = 11
          case 22 : resultSoulNumber = 22
          case 33 : resultSoulNumber = 33
          default:  resultSoulNumber = Int(String(sumBoin).prefix(1))! + Int(String(sumBoin).suffix(1))!
            
          }
        }
      }
    }
    
    return resultSoulNumber
    
  }

}
