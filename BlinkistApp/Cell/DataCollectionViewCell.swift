//
//  DataCollectionViewCell.swift
//  BlinkistApp
//
//  Created by Decagon on 27/07/2021.
//

import UIKit
class DataCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var bookTypeLabel: UILabel!
  @IBOutlet weak var freeCaptionLabel: UILabel!
  @IBOutlet weak var timeLengthLabel: UILabel!
  
  func setUp(with authorDetails: Authors){
    if authorDetails.access == "locked"{  // checking if acces is locked
      freeCaptionLabel.text = "🔒"
    }else{
      freeCaptionLabel.text = ""
    }
    titleLabel.text = authorDetails.title
    authorLabel.text = authorDetails.author
    bookTypeLabel.text = authorDetails.book_type
    timeLengthLabel.text = "·" + String(authorDetails.length/60) + "h"
    img.image = UIImage(named: authorDetails.image)
  }
}
