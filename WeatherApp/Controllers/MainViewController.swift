//
//  ViewController.swift
//  WeatherApp
//
//  Created by Grace Njoroge on 12/06/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  let myTableView = UITableView()
  let myCellId = "CustomViewCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationItem.title = "Weather"
    setupTableView()
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
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: myCellId, for: indexPath) as! CustomViewCell
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  
}
