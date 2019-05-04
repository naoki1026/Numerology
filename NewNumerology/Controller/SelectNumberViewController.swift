//
//  SelectNumberViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/25.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import ChameleonFramework

class SelectNumberVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
   var categoryToPass : Int = 0
   var selectedNumber : Int = 0
  
  @IBOutlet weak var collectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      collectionView.delegate = self
      collectionView.dataSource = self
      collectionView.isScrollEnabled = false
      
      navigationController?.navigationBar.tintColor = AppColors.navGold
      navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:  AppColors.navGold]
      
      switch categoryToPass {
        
      case 0: navigationItem.title = "ライフパスナンバー"
      case 1: navigationItem.title = "ディスティニーナンバー"
      case 2: navigationItem.title = "ソウルナンバー"
      case 3: navigationItem.title = "パーソナルナンバー"
      default: navigationItem.title = "なし"
        
      }
    }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 13
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberCell", for: indexPath) as! SelectNumberCell
    cell.layer.cornerRadius = 5
    
    switch  indexPath.item {
      
    case 0:
      cell.layer.backgroundColor = AppColors.red.cgColor
      cell.numberLabel.text = "1"
      
    case 1:
      cell.layer.backgroundColor = AppColors.orange.cgColor
       cell.numberLabel.text = "2"
      
    case 2:
      cell.layer.backgroundColor = AppColors.yellow.cgColor
      cell.numberLabel.text = "3"
      
    case 3:
      cell.layer.backgroundColor = AppColors.green.cgColor
      cell.numberLabel.text = "4"
      
    case 4:
      cell.layer.backgroundColor = AppColors.blue.cgColor
      cell.numberLabel.text = "5"
      
    case 5:
      cell.layer.backgroundColor = AppColors.darkBlue.cgColor
      cell.numberLabel.text = "6"
      
    case 6:
      cell.layer.backgroundColor = AppColors.purple.cgColor
      cell.numberLabel.text = "7"
      
    case 7:
      cell.layer.backgroundColor = AppColors.wineRed.cgColor
      cell.numberLabel.text = "8"
      
    case 8:
      cell.layer.backgroundColor = AppColors.gray.cgColor
      cell.numberLabel.text = "9"
      
    case 9:
      cell.layer.backgroundColor = AppColors.silver.cgColor
      cell.numberLabel.text = "11"
      
    case 10:
      cell.layer.backgroundColor = AppColors.gold.cgColor
      cell.numberLabel.text = "22"
      
    case 11:
      cell.selectImageView.alpha = 1
      cell.numberLabel.text = "33"
      
    default : cell.layer.backgroundColor = UIColor.white.cgColor
      
    }
    
    return cell
    
    }
  
  //セルとセルの間隔を定義
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
    return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = (view.frame.width - 36) / 3
    return CGSize(width: width, height: width)
    
   }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let detailsVC : DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier : "Details") as! DetailsViewController
    
    
    switch indexPath.item {
      
    case 0: selectedNumber = 1
    case 1: selectedNumber = 2
    case 2: selectedNumber = 3
    case 3: selectedNumber = 4
    case 4: selectedNumber = 5
    case 5: selectedNumber = 6
    case 6: selectedNumber = 7
    case 7: selectedNumber = 8
    case 8: selectedNumber = 9
    case 9: selectedNumber = 11
    case 10: selectedNumber = 22
    case 11: selectedNumber = 33
    default : selectedNumber = 1
      
    }
    
    print(selectedNumber)
    
    detailsVC.categoryToPass = categoryToPass
    detailsVC.selectedNumber = selectedNumber
    
    self.navigationController?.pushViewController(detailsVC, animated: true)
    
  }
  
}
