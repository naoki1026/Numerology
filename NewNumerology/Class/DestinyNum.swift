//
//  DestinyNum.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/23.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class DestinyNum : NSObject {
  //ミッションナンバーを算出する
  static func calcDestiny(name : String) -> Int {

    let upper = Int(name.count) - 1
    
    //指定した番号の文字列を抽出して、数値型にキャスト
     var sumShiinNumber = 0
     var shiinNumber = 0
     var sumBoinNumber = 0
     var boinNumber = 0
     var sumFullNameNumber = 0
    
    for count in 0...upper {
      
      shiinNumber = NumericalInversion.changeShiin(alphabet: (String(name[name.index(name.startIndex, offsetBy: (0 + count))..<name.index(name.startIndex, offsetBy: (count + 1))])))
      sumShiinNumber += shiinNumber
      
    }
    
    let firstShiin = Int(String(sumShiinNumber).prefix(1))!
    let secondShiin = Int(String(sumShiinNumber).suffix(1))!
    
    //指定した番号の文字列を抽出して、数値型にキャスト
    for count in 0...upper {
      
      boinNumber = NumericalInversion.changeBoin(alphabet: (String(name[name.index(name.startIndex, offsetBy: (0 + count))..<name.index(name.startIndex, offsetBy: (count + 1))])))
      sumBoinNumber += boinNumber
      
    }
    
    let firstBoin = Int(String(sumBoinNumber).prefix(1))!
    let secondBoin = Int(String(sumBoinNumber).suffix(1))!
    
    sumFullNameNumber = firstShiin + secondShiin + firstBoin + secondBoin
   
    //指定した番号の文字列を抽出して、数値型にキャスト
    let firstFull = Int(String(sumFullNameNumber).prefix(1))!
    let secondFull = Int(String(sumFullNameNumber).suffix(1))!
    var sumFull = 0
    
    if  sumFullNameNumber < 10 {
      
      sumFull = sumFullNameNumber
      
    } else {
      
      sumFull = firstFull + secondFull
   
      
    }
    
    var resultDestinyNumber = 0
    
    
    switch sumFull {
      
    case 10 : resultDestinyNumber = 1
    case 11 : resultDestinyNumber = 11
    case 22 : resultDestinyNumber = 22
    case 33 : resultDestinyNumber = 33
    default:
      
      
      switch sumFullNameNumber {
        
      case 10 : resultDestinyNumber = 1
      case 11 : resultDestinyNumber = 11
      case 22 : resultDestinyNumber = 22
      case 33 : resultDestinyNumber = 33
      default:
        
        if sumFull < 10 {
          
          resultDestinyNumber = sumFull
          
        } else {
          
          switch Int(String(sumFull).prefix(1))! + Int(String(sumFull).suffix(1))! {
            
          case 10 : resultDestinyNumber = 1
          case 11 : resultDestinyNumber = 11
          case 22 : resultDestinyNumber = 22
          case 33 : resultDestinyNumber = 33
          default:  resultDestinyNumber = Int(String(sumFull).prefix(1))! + Int(String(sumFull).suffix(1))!
            
          }
        }
      }
    }
    
    return resultDestinyNumber
    
  }
  
  

}
