//
//  SettingVC.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/04.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Firebase

class SettingVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      self.navigationController?.navigationBar.tintColor = AppColors.navGold
      self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : AppColors.navGold]

  
    }
  
  
  @IBAction func clickedLogout(_ sender: Any) {
    
    do {
      //サインアウトを試みる
      try Auth.auth().signOut()
      
      
      print("Successfully logged user out")
      //let viewController = UIViewController() as! LoginViewController
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      // appDelegate.window?.rootViewController = viewController
      
      let storyboard = UIStoryboard(name: "Login", bundle: Bundle(for: type(of: self)))
      appDelegate.window?.rootViewController = storyboard.instantiateInitialViewController()
      
    } catch {
      
      //handle error
      print("Falied to sign out")
      
    }
  }
  
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }

  

}
