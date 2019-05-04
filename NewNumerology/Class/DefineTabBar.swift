
//
//  TabController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/27.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class DefineTabBar : NSObject {
  
  static func createTabBar(){
    
    
    let tabController = UITabBarController()
    
    //storyboardをコードで定義している
    let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
    let numorologyStoryboard = UIStoryboard(name: "Numerology", bundle: nil)
    let messageStoryboard = UIStoryboard(name: "Message", bundle: nil)
    let chatStoryboard = UIStoryboard(name: "Chat", bundle: nil)
    let settingStoryboard = UIStoryboard(name: "Setting", bundle: nil)
    
    //インスタンス（実体化）からViewControllerを取得している
    let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "Home") as! HomeVC
    let numerologyVC = numorologyStoryboard.instantiateViewController(withIdentifier: "Numerology") as! NumerologyVC
    let messageMainVC = messageStoryboard.instantiateViewController(withIdentifier: "MessageMain") as! MessageMainVC
    let chatVC = chatStoryboard.instantiateViewController(withIdentifier: "Chat") as! ChatVC
    let settingVC = settingStoryboard.instantiateViewController(withIdentifier: "Setting") as! SettingVC
    
    //配列の中に、タプルで複数の型の値をまとめている
    let vcData : [(UIViewController, UIImage, UIImage)] = [
      
      (homeVC, UIImage(named: "house_white")!, UIImage(named: "house_gold")!),
      (numerologyVC, UIImage(named: "numerology_white")!, UIImage(named: "numerology_gold")!),
      (messageMainVC, UIImage(named: "comment_white")!, UIImage(named: "comment_gold")!),
      (chatVC, UIImage(named: "comment_white")!, UIImage(named: "comment_gold")!),
      (settingVC, UIImage(named: "setting_white")!, UIImage(named: "setting_gold")!)
      
    ]
    
    let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
      
      let nav  = UINavigationController(rootViewController: vc)
      nav.tabBarItem.image = defaultImage
      nav.tabBarItem.selectedImage = selectedImage
      return nav
      
    }
    
    tabController.viewControllers = vcs
    
    //タブバーを透明にするかしないか
    tabController.tabBar.isTranslucent = false
    
    
    if let items = tabController.tabBar.items {
      
      for item in items {
        
        if let image = item.image {
          
          //画像が一色に塗りつぶされないようにするため、.alwaysOriginalでオリジナル画像を描画する
          item.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          
        }
        
        if let selectedImage = item.selectedImage {
          
          item.selectedImage = selectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          
        }
        
        item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
      }
    }
    
    UINavigationBar.appearance().backgroundColor = UIColor.white
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController = tabController
    
  }
 }

