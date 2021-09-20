//
//  DataLoader.swift
//  BlinkistApp
//
//  Created by Decagon on 04/08/2021.
//

import UIKit
protocol  delegateData {
  func fetchData(detail: [Authors])
}
 class DataLoader {
  var userData = [Authors]()
  init() {
    // using closure to pass data
    //      load { data in
    //        self.userData =  data
    //      }
    sort()
  }
  var delegate: delegateData?
  //  func load(completionHandler:([Authors])-> Void?) { // using a closure
  func load(){
    if let fileLocation = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
      // do catch in case of an error
      do {
        let data = try Data(contentsOf: fileLocation)
        let jsonDecoder = JSONDecoder()
        let dataFromJson = try jsonDecoder.decode([Authors].self, from: data)
        self.userData = dataFromJson
       // completionHandler?(dataFromJson)
        delegate?.fetchData(detail: dataFromJson)
      } catch {
        print("\(error)")
      }
    }
  }
  func sort() {
    self.userData = self.userData.sorted(by: {$0.id < $1.id})
  }
}
