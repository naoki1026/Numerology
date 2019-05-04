//
//  DetailsViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/26.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
  
  var selectedNumber : Int!
  @IBOutlet weak var number: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var resultLabel1: UILabel!
  @IBOutlet weak var resultLabel2: UILabel!
  var categoryToPass: Detail!
  var navigationTitle : String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      navigationController?.navigationBar.tintColor = AppColors.navGold
      navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:  AppColors.navGold]
     navigationItem.title = navigationTitle
      
      number.text = String(categoryToPass.title)
      imageView.image = UIImage(named: categoryToPass.imageName)
      resultLabel1.text = categoryToPass.label1
      resultLabel2.text = categoryToPass.label2
      
  }
}
