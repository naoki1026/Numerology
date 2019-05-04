//
//  KeyboardBoundView.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/01.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

extension UIView {
  
  func bindToKeyboard(){
    NotificationCenter.default.addObserver(self, selector: #selector(UIView.keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
  }
  
  @objc func keyboardWillChange(_ notification: NSNotification) {
    let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    let curFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    let targetFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    
    let tabBarController: UITabBarController = UITabBarController()
    let tabBarHeight = tabBarController.tabBar.frame.size.height
    var deltaY : CGFloat
    
    deltaY = targetFrame.origin.y - curFrame.origin.y + tabBarHeight
    
    if UIScreen.main.nativeBounds.height == 2436 {

      if  targetFrame.origin.y < curFrame.origin.y {

         deltaY = targetFrame.origin.y - curFrame.origin.y + tabBarHeight + 35

      } else {


         deltaY = targetFrame.origin.y - curFrame.origin.y

      }

    } else {

      if  targetFrame.origin.y < curFrame.origin.y {

       deltaY = targetFrame.origin.y - curFrame.origin.y + tabBarHeight
       print(deltaY)

      } else {

        deltaY = targetFrame.origin.y - curFrame.origin.y - tabBarHeight
        print("targetFrame.origin.y - curFrame.origin.y")
        print(deltaY)
        
      }

    }
    
    UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
      
      self.frame.origin.y += deltaY
      
    },completion: {(true) in
      self.layoutIfNeeded()
    })
    
    print(targetFrame.origin.y)
    print(curFrame.origin.y)
    print(self.frame.origin.y)
    
  }
}
