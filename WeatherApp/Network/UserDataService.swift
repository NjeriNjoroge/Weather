//
//  UserDataService.swift
//  WeatherApp
//
//  Created by Grace Njoroge on 16/06/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import Foundation

class UserDataService {
  
  /// the singleton
  static let shared = UserDataService()
  
  // prevent others from using the default initializer of this class
  private init() {}
  
  /// the user's record id
  open var imageIcon: String?

}
