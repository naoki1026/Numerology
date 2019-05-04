//
//  NumericalInversion .swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/27.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation

class NumericalInversion {
  
  //子音を数字に置き換える
  static func changeShiin (alphabet: String) -> Int {
    
    var resultShiin = 0
    
    switch alphabet {
      
    case "b" : resultShiin = 2
    case "c" : resultShiin = 3
    case "d" : resultShiin = 4
    case "f" : resultShiin = 6
    case "g" : resultShiin = 7
    case "h" : resultShiin = 8
    case "j" : resultShiin = 1
    case "k" : resultShiin = 2
    case "l" : resultShiin = 3
    case "m" : resultShiin = 4
    case "n" : resultShiin = 5
    case "p" : resultShiin = 7
    case "q" : resultShiin = 8
    case "r" : resultShiin = 9
    case "s" : resultShiin = 1
    case "t" : resultShiin = 2
    case "v" : resultShiin = 4
    case "w" : resultShiin = 5
    case "x" : resultShiin = 6
    case "y" : resultShiin = 7
    case "z" : resultShiin = 8
    case "B" : resultShiin = 2
    case "C" : resultShiin = 3
    case "D" : resultShiin = 4
    case "F" : resultShiin = 6
    case "G" : resultShiin = 7
    case "H" : resultShiin = 8
    case "J" : resultShiin = 1
    case "K" : resultShiin = 2
    case "L" : resultShiin = 3
    case "M" : resultShiin = 4
    case "N" : resultShiin = 5
    case "P" : resultShiin = 7
    case "Q" : resultShiin = 8
    case "R" : resultShiin = 9
    case "S" : resultShiin = 1
    case "T" : resultShiin = 2
    case "V" : resultShiin = 4
    case "W" : resultShiin = 5
    case "X" : resultShiin = 6
    case "Y" : resultShiin = 7
    case "Z" : resultShiin = 8
    default  : resultShiin = 0
      
    }
    
    return resultShiin
    
  }
  
  static func changeBoin (alphabet: String) -> Int {
    
    var resultBoin = 0
    
    switch alphabet {
      
    case "a" : resultBoin = 1
    case "e" : resultBoin = 5
    case "i" : resultBoin = 9
    case "o" : resultBoin = 6
    case "u" : resultBoin = 3
    case "A" : resultBoin = 1
    case "E" : resultBoin = 5
    case "I" : resultBoin = 9
    case "O" : resultBoin = 6
    case "U" : resultBoin = 3
    default  : resultBoin = 0
      
    }
    
    return resultBoin
    
  }
  
}
