//
//  PersonalNum.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/23.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class PersonalNum : NSObject {
  
  //パーソナルナンバーを算出する
  
  static func calcPersonal(name : String) -> Int {
    
    let upper = Int(name.count) - 1
    
    //var calcSoul = changeBoin(alphabet: name)
    var sumShiinNumber = 0
    var shiinNumber = 0
    
    for count in 0...upper {
      
      shiinNumber = NumericalInversion.changeShiin(alphabet: (String(name[name.index(name.startIndex, offsetBy: (0 + count))..<name.index(name.startIndex, offsetBy: (count + 1))])))
      sumShiinNumber += shiinNumber
      
    }
    
    //指定した番号の文字列を抽出して、数値型にキャスト
    let firstShiin = Int(String(sumShiinNumber).prefix(1))!
    let secondShiin = Int(String(sumShiinNumber).suffix(1))!
    
    let sumShiin = firstShiin + secondShiin
    var resultPersonalNumber = 0
    
    switch sumShiinNumber {
      
    case 10 : resultPersonalNumber = 1
    case 11 : resultPersonalNumber = 11
    case 22 : resultPersonalNumber = 22
    case 33 : resultPersonalNumber = 33
    default:
      
      switch sumShiin {
        
      case 10 : resultPersonalNumber = 1
      case 11 : resultPersonalNumber = 11
      case 22 : resultPersonalNumber = 22
      case 33 : resultPersonalNumber = 33
      default:
        
        if sumShiin < 10 {
          
          resultPersonalNumber = sumShiin
          
        } else {
          
          switch Int(String(sumShiin).prefix(1))! + Int(String(sumShiin).suffix(1))! {
            
          case 10 : resultPersonalNumber = 1
          case 11 : resultPersonalNumber = 11
          case 22 : resultPersonalNumber = 22
          case 33 : resultPersonalNumber = 33
          default:  resultPersonalNumber = Int(String(sumShiin).prefix(1))! + Int(String(sumShiin).suffix(1))!
            
          }
        }
      }
    }
    
    return resultPersonalNumber
    
  }
  
}
