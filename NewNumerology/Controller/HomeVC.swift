//
//  HomeViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/22.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import Firebase
import ProgressHUD

class HomeVC: UIViewController {
  

  @IBOutlet weak var tableView: UITableView!
  
  //MARK: -Properties
  let realm = try! Realm()
  var myResult : Results<FortuneTellingResult>!
  var results : Results<FortuneTellingResult>!
  
  //MARK: -Init
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
    
    let userDefault = UserDefaults.standard
    let dict = ["firstLaunch": true]
    userDefault.register(defaults: dict)

    if userDefault.bool(forKey: "firstLaunch") {
      userDefault.set(false, forKey: "firstLaunch")
      //initialData()
      
    }
    
        myResult = realm.objects(FortuneTellingResult.self).filter("myNumber == 1")
        results = realm.objects(FortuneTellingResult.self).filter("myNumber == 0")
        results = results.sorted(byKeyPath: "lastUpdate", ascending: false)
    
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: AppColors.navGold]

    }
  
  override func viewWillAppear(_ animated: Bool) {
    
    tableView.reloadData()

  }
  
 //MARK: -Helpers
  
  @IBAction func selectedTab(_ sender: UISegmentedControl) {
    
    switch sender.selectedSegmentIndex {
      
    case 0: results = results.sorted(byKeyPath: "lastUpdate", ascending: false)
    case 1: results = results.sorted(byKeyPath: "lifepass", ascending: true)
    case 2: results = results.sorted(byKeyPath: "fullName", ascending: true)
    default: return
    
  }
    
    tableView.reloadData()
  
  }
  
  @IBAction func pushLogout(_ sender: Any) {
    
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
}

extension HomeVC:  UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {

    return 2

  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

    return section == 0 ? "" : "鑑定結果（自分以外)"

  }

  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

    view.tintColor = AppColors.navGold

    let header = view as! UITableViewHeaderFooterView

    header.textLabel?.textColor = .white
    header.textLabel?.font = UIFont.systemFont(ofSize: 13)

  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    

    if section == 0 {

    return 1;

    } else {

    return results.count;
      
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
    
    if indexPath.section == 0 {
      
      if myResult.count < 1 {
        
        cell.name.text = "左の星をクリックして、\n自分のナンバーを登録してください"
        cell.rainbowImageView.image = UIImage(named: "fortuneTelling_gold_large")
        cell.rainbowImageView.alpha = 1
        cell.view.layer.cornerRadius = 25
        cell.name.font = UIFont.systemFont(ofSize: 14)
        cell.lifepassNumber.text = ""
        cell.view.layer.backgroundColor = UIColor.white.cgColor
        
        
      } else {
        
        cell.name.text = myResult[indexPath.row].fullName
        cell.lifepassNumber.text = String(myResult[indexPath.row].lifepass)
        cell.view.layer.cornerRadius = 25
        cell.name.font = UIFont.systemFont(ofSize: 17)
    
    switch  myResult[indexPath.row].lifepass {
      
    case 1: cell.view.layer.backgroundColor = AppColors.red.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 2: cell.view.layer.backgroundColor = AppColors.orange.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 3: cell.view.layer.backgroundColor = AppColors.yellow.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 4: cell.view.layer.backgroundColor = AppColors.green.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 5: cell.view.layer.backgroundColor = AppColors.blue.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 6: cell.view.layer.backgroundColor = AppColors.darkBlue.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 7: cell.view.layer.backgroundColor = AppColors.purple.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 8: cell.view.layer.backgroundColor = AppColors.wineRed.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 9: cell.view.layer.backgroundColor = AppColors.gray.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 11: cell.view.layer.backgroundColor = AppColors.silver.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 22: cell.view.layer.backgroundColor = AppColors.gold.cgColor
    cell.rainbowImageView.alpha = 0
      
    case 33:
      cell.rainbowImageView.image = UIImage(named: "smallRainbow")
      cell.rainbowImageView.alpha = 1
      
    default : cell.layer.backgroundColor = UIColor.white.cgColor
      
     }
    }

    } else if indexPath.section == 1 {
      
      cell.name.text = results[indexPath.row].fullName
      cell.lifepassNumber.text = String(results[indexPath.row].lifepass)
      cell.view.layer.cornerRadius = 25
  
    if (results.count) > 0 {
      
      switch  results[indexPath.row].lifepass {
        
      case 1: cell.view.layer.backgroundColor = AppColors.red.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 2: cell.view.layer.backgroundColor = AppColors.orange.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 3: cell.view.layer.backgroundColor = AppColors.yellow.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 4: cell.view.layer.backgroundColor = AppColors.green.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 5: cell.view.layer.backgroundColor = AppColors.blue.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 6: cell.view.layer.backgroundColor = AppColors.darkBlue.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 7: cell.view.layer.backgroundColor = AppColors.purple.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 8: cell.view.layer.backgroundColor = AppColors.wineRed.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 9: cell.view.layer.backgroundColor = AppColors.gray.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 11: cell.view.layer.backgroundColor = AppColors.silver.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 22: cell.view.layer.backgroundColor = AppColors.gold.cgColor
      cell.rainbowImageView.alpha = 0
        
      case 33: cell.rainbowImageView.alpha = 1
        
      default : cell.layer.backgroundColor = UIColor.white.cgColor
        
      }
     }
    }
    
    //セルが選択されても色を変更させない
    cell.selectionStyle = .none
    
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    
    if indexPath.section == 0 {
        if myResult.count == 0 {
      
       let fortuneTellingVC : FortuneTellingVC = self.storyboard?.instantiateViewController(withIdentifier : "Fortune") as! FortuneTellingVC
      
      fortuneTellingVC.myNumber = 1
      print("この分岐")
      
       self.navigationController?.pushViewController(fortuneTellingVC, animated: true)
      
        } else {
          
          let resultVC : ResultVC = self.storyboard?.instantiateViewController(withIdentifier : "Result") as! ResultVC
          
          resultVC.resultLifepass = myResult[indexPath.row].lifepass
          resultVC.resultSoul = myResult[indexPath.row].soul
          resultVC.resultSpiritual = myResult[indexPath.row].spiritual
          resultVC.resultDestiny = myResult[indexPath.row].destiny
          resultVC.resultPersonal = myResult[indexPath.row].personal
          resultVC.resultBalance = myResult[indexPath.row].balance
          resultVC.resultName = myResult[indexPath.row].fullName
          resultVC.resultBirthday = myResult[indexPath.row].birthday
          
          self.navigationController?.pushViewController(resultVC, animated: true)
          
      }
          
    } else {
      
    let resultVC : ResultVC = self.storyboard?.instantiateViewController(withIdentifier : "Result") as! ResultVC
    
    resultVC.resultLifepass = results[indexPath.row].lifepass
    resultVC.resultSoul = results[indexPath.row].soul
    resultVC.resultSpiritual = results[indexPath.row].spiritual
    resultVC.resultDestiny = results[indexPath.row].destiny
    resultVC.resultPersonal = results[indexPath.row].personal
    resultVC.resultBalance = results[indexPath.row].balance
    resultVC.resultName = results[indexPath.row].fullName
    resultVC.resultBirthday = results[indexPath.row].birthday
    
    self.navigationController?.pushViewController(resultVC, animated: true)
    
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      
      if indexPath.section == 0 {
        if myResult.count == 0 {
          
          ProgressHUD.showError("ナンバーが登録されていないため削除することができません")
  
          return
          
        } else {
        
          if let categoryForDeletion = self.myResult?[indexPath.row] {
            
            do {
              
              try self.realm.write {
                
                self.realm.delete(categoryForDeletion) }
              
            } catch {
              
              print("Error deleting category, \(error)")
              
            }
            
            tableView.reloadData()
            
          }
        }

        
      } else {
        
      
      if let categoryForDeletion = self.results?[indexPath.row] {
        
        do {
          
          try self.realm.write {
            
            self.realm.delete(categoryForDeletion) }
          
        } catch {
          
          print("Error deleting category, \(error)")
          
        }
        
        tableView.reloadData()
        
       }
      }
    }
  }
}

