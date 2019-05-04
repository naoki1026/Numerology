//
//  ResultViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/23.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class ResultVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
 
  @IBOutlet weak var tableView: UITableView!

  var resultLifepass = 0
  var resultSoul = 0
  var resultSpiritual = 0
  var resultDestiny = 0
  var resultPersonal = 0
  var resultBalance = 0
  var resultMyNumber  = 0
  var resultName = ""
  var resultColor = ""
  var resultBirthday = ""
  var myNumber = 0
  var categoryToPass: Detail!
  var navigationTitle : String = ""
  
  @IBOutlet weak var resultLabel1: UILabel!
  @IBOutlet weak var resultLabel2: UILabel!
  
  let realm = try! Realm()
  var resutls : Results<FortuneTellingResult>!
  var result : Results<FortuneTellingResult>!
  
  let data = DataSet()
  var selectedCategory : String!
  var details : [Detail]!
  //var recipeToPass: Detail!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.isScrollEnabled = false
    navigationController?.delegate = self
    
    self.navigationController?.navigationBar.tintColor = AppColors.navGold
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : AppColors.navGold]
    
    imageColor()
    
    tableView.tableFooterView = UIView(frame: .zero)
    
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultTableViewCell
    
    
    
    switch indexPath.row {
      
    case 0:
      cell.title.text = "名前"
      cell.content.text = resultName
      
    case 1:
      cell.title.text = "生年月日"
      cell.content.text = resultBirthday
      
    case 2:
      cell.title.text = "ライフパスナンバー"
      cell.content.text = String(resultLifepass)
      cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
      
    case 3:
      cell.title.text = "ディスティニーナンバー"
      cell.content.text = String(resultDestiny)
      cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
      
    case 4:
      cell.title.text = "ソウルナンバー"
      cell.content.text = String(resultSoul)
      cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
      
    case 5:
      cell.title.text = "パーソナルナンバー"
      cell.content.text = String(resultPersonal)
      cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
      
    case 6:
      cell.title.text = "イメージカラー"
      cell.content.text = String(resultColor)
      
    default : cell.title.text = "カラー"
      
    }
    
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    return 40
    
  }
  
    func imageColor(){
  
      switch resultLifepass {
  
      case 1:
        self.view.backgroundColor = data.lifepass[0].color
        resultColor = data.lifepass[0].colorName
        resultLabel1.text = data.lifepass[0].label1
        resultLabel2.text = data.lifepass[0].label2
        
  
      case 2:
        self.view.backgroundColor = data.lifepass[1].color
        resultColor = data.lifepass[1].colorName
        resultLabel1.text = data.lifepass[1].label1
        resultLabel2.text = data.lifepass[1].label2
  
      case 3:
        self.view.backgroundColor = data.lifepass[2].color
        resultColor = data.lifepass[2].colorName
        resultLabel1.text = data.lifepass[2].label1
        resultLabel2.text = data.lifepass[2].label2
  
      case 4:
        self.view.backgroundColor = data.lifepass[3].color
        resultColor = data.lifepass[3].colorName
        resultLabel1.text = data.lifepass[3].label1
        resultLabel2.text = data.lifepass[3].label2

      case 5:
        self.view.backgroundColor = data.lifepass[4].color
        resultColor = data.lifepass[4].colorName
        resultLabel1.text = data.lifepass[4].label1
        resultLabel2.text = data.lifepass[4].label2
  
  
      case 6:
        self.view.backgroundColor = data.lifepass[5].color
        resultColor = data.lifepass[5].colorName
        resultLabel1.text = data.lifepass[5].label1
        resultLabel2.text = data.lifepass[5].label2
  
      case 7:
        self.view.backgroundColor = data.lifepass[6].color
        resultColor = data.lifepass[6].colorName
        resultLabel1.text = data.lifepass[6].label1
        resultLabel2.text = data.lifepass[6].label2

      case 8:
        self.view.backgroundColor = data.lifepass[7].color
        resultColor = data.lifepass[7].colorName
        resultLabel1.text = data.lifepass[7].label1
        resultLabel2.text = data.lifepass[7].label2
  
      case 9:
        self.view.backgroundColor = data.lifepass[8].color
        resultColor = data.lifepass[8].colorName
        resultLabel1.text = data.lifepass[8].label1
        resultLabel2.text = data.lifepass[8].label2
  
      case 11:
        self.view.backgroundColor = data.lifepass[9].color
        resultColor = data.lifepass[9].colorName
        resultLabel1.text = data.lifepass[9].label1
        resultLabel2.text = data.lifepass[9].label2

      case 22:
        self.view.backgroundColor = data.lifepass[10].color
        resultColor = data.lifepass[10].colorName
        resultLabel1.text = data.lifepass[10].label1
        resultLabel2.text = data.lifepass[10].label2
  
      case 33:
        self.view.backgroundColor = GradientColor(gradientStyle: UIGradientStyle.leftToRight, frame: view.frame, colors: [UIColor.red, UIColor.yellow, UIColor.green, UIColor.blue]) //rainbow
        resultColor = data.lifepass[11].colorName
        resultLabel1.text = data.lifepass[11].label1
        resultLabel2.text = data.lifepass[11].label1
  
      default : self.view.backgroundColor = .white
  
      }
    }
  
  func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    
    if viewController is FortuneTellingVC {
      if myNumber == 1 {
        
        //最初の画面に戻る
        navigationController.popToRootViewController(animated: true)
        
      }
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  
    
    if indexPath.row == 2 {
      
      let number = changeNumber(number: resultLifepass)
      categoryToPass = data.lifepass[number]
      navigationTitle = "ライフパスナンバー"
      nextPage()
      
    } else if indexPath.row == 3 {
      
      let number = changeNumber(number: resultDestiny)
     categoryToPass = data.destiny[number]
       navigationTitle = "ディスティニーナンバー"
      nextPage()
    
      
    } else if indexPath.row == 4 {
      
      let number = changeNumber(number: resultSoul)
    categoryToPass = data.soul[number]
       navigationTitle = "ソウルナンバー"
      nextPage()
      
    } else if indexPath.row == 5 {
      
      let number = changeNumber(number: resultPersonal)
    categoryToPass = data.personal[number]
       navigationTitle = "パーソナルナンバー"
      nextPage()
      
    }
    
  }
  
  func changeNumber(number : Int) -> Int{
    
    var changeNumber = 0
    
    switch number {
      
    case 1: changeNumber = 0
    case 2: changeNumber = 1
    case 3: changeNumber = 2
    case 4: changeNumber = 3
    case 5: changeNumber = 4
    case 6: changeNumber = 5
    case 7: changeNumber = 6
    case 8: changeNumber = 7
    case 9: changeNumber = 8
    case 11: changeNumber = 9
    case 22: changeNumber = 10
    case 33: changeNumber = 11
    default : changeNumber = 0
      
    }
    
    return changeNumber
    
  }
  
  func nextPage(){
    
    let storyboard = UIStoryboard(name: "Numerology", bundle: Bundle(for: type(of: self)))
    let detailsVC : DetailsVC = storyboard.instantiateViewController(withIdentifier : "Details") as! DetailsVC
    
    detailsVC.navigationTitle = navigationTitle
    detailsVC.categoryToPass = categoryToPass
    self.navigationController?.pushViewController(detailsVC, animated: true)
  }
  
}
