//
//  DetailViewController.swift
//  BlinkistApp
//
//  Created by Decagon on 27/07/2021.
//

import UIKit
class DetailViewController: UIViewController {
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var authorlabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  var newImage = UIImage()
  var titleHolder = ""  // empty string holder the title
  var authorHolder = ""
  var descriptionHolder: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    label.text = "\(titleHolder)"    // assigning author title to label
    authorlabel.text = "\(authorHolder)"
    descriptionLabel.text = "\(descriptionHolder)"
    img.image = newImage
  }

}
