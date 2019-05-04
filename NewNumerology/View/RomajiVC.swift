//
//  AboutRomajiViewController.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/27.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class AboutRomajiVC: UIViewController {
  
  @IBOutlet weak var closeButton: UIButton!
  
  @IBOutlet weak var containerView: UIView!
  

    override func viewDidLoad() {
        super.viewDidLoad()

      containerView.layer.cornerRadius = 5
      closeButton.layer.cornerRadius = 5
    }


  @IBAction func clickedCloseButton(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
  }
  
}
