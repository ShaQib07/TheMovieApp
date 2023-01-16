//
//  MovieApi.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 15/9/22.
//

import Moya
import Foundation

enum MovieApi {
  case recommended(id: Int)
  case popular(page: Int)}

extension MovieApi: TargetType {
  
  var baseURL: URL {
    guard let url = URL(string: "https://api.themoviedb.org/3/")
                    else { fatalError("Base url could not be configured.") }
    return url
  }
  
  var path: String {
    switch self {
    case .recommended(let id):
      return "movie/\(id)/recommendations"
    case .popular:
      return "movie/popular"    }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Moya.Task {
    switch self {
    case .recommended:
      return .requestParameters(parameters: ["api_key" : NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
    case .popular(let page):
      return .requestParameters(parameters: ["page" : page, "api_key" : NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-type": "application/json"]
  }
  
}
