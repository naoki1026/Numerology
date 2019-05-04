//
//  ChatCell.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/05/04.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
  
  
  @IBOutlet weak var numberView: UIView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var chatLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  @IBOutlet weak var numberLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      
      numberView.layer.cornerRadius = 25
    }

   
}
