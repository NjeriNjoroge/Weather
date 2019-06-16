//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Grace Njoroge on 16/06/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import Foundation
import Moya

private let appId = "0fd65ae8051cec4f21c386659c25955b"

enum WeatherService {
  case city(citycode: String)
}

extension WeatherService: TargetType {
  var baseURL: URL {
    return URL(string: "http://api.openweathermap.org/data/2.5/forecast")!
  }
  
  var path: String {
    return ""
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var sampleData: Data {
    return self.sampleData
  }
  
  var parameters: [String: Any]? {
    switch self {
    case .city(let citycode):
      return ["q": citycode, "appid": appId]
    }
  }
  
  var parameterEncoding: Moya.ParameterEncoding {
      return URLEncoding.queryString
  }
  
  var task: Task {
    guard let parameters = self.parameters else { return .requestPlain }
    return .requestParameters(parameters: parameters, encoding: parameterEncoding)
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application.json"]
  }
  
  
}
