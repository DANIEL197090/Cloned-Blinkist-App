//
//  ViewController.swift
//  BlinkistApp
//
//  Created by Decagon on 26/07/2021.
//
import UIKit
class ViewController: UIViewController {
  var data = [Authors]()// creating an empty array
  @IBOutlet weak var collectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    //data = DataLoader().userData // loading data using closure
    let dataLoader = DataLoader()
    dataLoader.delegate = self
    dataLoader.load()
    collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    //setting the layout
  }
  
}

// MARK: - UICollectionViewDataSource protocol and UICollectionViewDelegate protocol
extension  ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.data.count //return number of rows in section
  }
  
  // make a cell for each cell index path
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DataCollectionViewCell
    cell.setUp(with: self.data[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //return number of rows in section
    let viewController  =  storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
    viewController?.newImage =   UIImage(named: self.data[indexPath.row].image)!
    viewController?.titleHolder = self.data[indexPath.row].title
    viewController?.authorHolder = self.data[indexPath.row].author
    viewController?.descriptionHolder = self.data[indexPath.row].description
    self.navigationController?.pushViewController(viewController!, animated: true)
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let bounds = collectionView.bounds
    return  CGSize(width: bounds.width/2 - 5, height: bounds.height/2)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}

extension ViewController: delegateData {
  func fetchData(detail: [Authors]) {
    self.data = detail
  }
}
