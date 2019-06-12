//
//  CustomViewCell.swift
//  WeatherApp
//
//  Created by Grace Njoroge on 12/06/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
  
  var myLocationLabel: UILabel = {
    let label = UILabel()
    label.text = "Your Location"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var weatherIconView: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "cloud")
    img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    return img
  }()
  
  var tempLabel: UILabel = {
    let label = UILabel()
    label.text = "23C"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var rightChevron: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "right")
    img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    return img
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(myLocationLabel)
    addSubview(weatherIconView)
    addSubview(tempLabel)
    addSubview(rightChevron)
    
    NSLayoutConstraint.activate([
      myLocationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      myLocationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
      ])

    NSLayoutConstraint.activate([
      weatherIconView.heightAnchor.constraint(equalToConstant: 50),
      weatherIconView.widthAnchor.constraint(equalToConstant: 50),
      weatherIconView.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: 8),
      weatherIconView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
      ])

    NSLayoutConstraint.activate([
      tempLabel.topAnchor.constraint(equalTo: weatherIconView.topAnchor, constant: 8),
      tempLabel.leftAnchor.constraint(equalTo: weatherIconView.rightAnchor, constant: 8)
      ])
    
    NSLayoutConstraint.activate([
      rightChevron.heightAnchor.constraint(equalToConstant: 20),
      rightChevron.widthAnchor.constraint(equalToConstant: 20),
      rightChevron.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
      rightChevron.topAnchor.constraint(equalTo: weatherIconView.topAnchor)
      ])

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }
  
}
