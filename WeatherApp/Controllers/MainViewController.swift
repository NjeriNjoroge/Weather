//
//  ViewController.swift
//  WeatherApp
//
//  Created by Grace Njoroge on 12/06/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import Kingfisher


class MainViewController: UIViewController {

  let myTableView = UITableView()
  let myCellId = "CustomViewCell"
  let provider = MoyaProvider<WeatherService>()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationItem.title = "Weather"
    setupTableView()
    getData()
  }
  
  func setupTableView() {
    view.addSubview(myTableView)
    myTableView.translatesAutoresizingMaskIntoConstraints = false
    
    myTableView.dataSource = self
    myTableView.delegate = self
    
   myTableView.register(CustomViewCell.self, forCellReuseIdentifier: "CustomViewCell")
    
    NSLayoutConstraint.activate([
      myTableView.topAnchor.constraint(equalTo: view.topAnchor),
      myTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      myTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
  }
  
  func getData() {
    provider.request(.city(citycode: "Kenya")) { result in
      
      switch result {
      case let .success(moyaResponse):
        do {
          let data = moyaResponse.data
          let json = JSON(data) // convert network data to json
          
          //save data
          let weatherData = json["list"][0].dictionaryValue
          let temp = weatherData["main"]!["temp"].intValue
          let cloud = weatherData["clouds"]!["all"].intValue
          let wind = weatherData["wind"]!["speed"].intValue
          let weatherIcon = weatherData["weather"]![0]["icon"].stringValue
  
          UserDataService.shared.imageIcon = weatherIcon
          
        } catch { print(error) }
        
      case let .failure(error):
        print("error: \(error)")
      }
    }
  }
  
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: myCellId, for: indexPath) as! CustomViewCell
    if let icon = UserDataService.shared.imageIcon {
      let mainUrl = URL(string: "http://openweathermap.org/img/w/\(icon)")!
      cell.weatherIconView.kf.setImage(with: mainUrl)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let destinationVC = DetailViewController()
    navigationController?.pushViewController(destinationVC, animated: true)
  }

}

