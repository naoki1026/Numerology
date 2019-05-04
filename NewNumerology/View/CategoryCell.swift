//
//  CategoryCell.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/24.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
  
  
  @IBOutlet weak var categoryTitle: UILabel!
  @IBOutlet weak var categoryContent: UILabel!
  
  //@IBOutlet weak var view: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
  
  func configureCell(category: Category) {
    
    categoryTitle.text = category.title
    categoryContent.text = category.content
    
    
  }
}
