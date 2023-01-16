//
//  NetworkManager.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 15/9/22.
//

import Moya
import Foundation

protocol Networkable {
  var provider: MoyaProvider<MovieApi> { get }
  func getPopularMovies(page: Int, completion: @escaping ([Movie])->())
  func getRecommendations(id: Int, completion: @escaping ([Movie])->())
}

class NetworkManager: Networkable {
  static let shared = NetworkManager()
  
  static let MovieAPIKey = "db0b624bf0d01d702c3dd9de13a73a79"
  
  //Initializer access level change now
  private init(){}
  
  var provider = MoyaProvider<MovieApi>(plugins: [NetworkLoggerPlugin()])
  
  func getPopularMovies(page: Int, completion: @escaping ([Movie]) -> ()) {
    provider.request(.popular(page: page)) { result in
      switch result {
      case let .success(response):
        do {
          //print(response.data.prettyPrintedJSONString!)
          let results = try JSONDecoder().decode(MovieResults.self, from: response.data)
          completion(results.movies)
        } catch let err {
          print("Error catch - \(err)")
        }
      case let .failure(error):
        print("Error failure - \(error)")
      }
    }
  }
  
  func getRecommendations(id: Int, completion: @escaping ([Movie]) -> ()) {
    provider.request(.recommended(id: id)) { result in
      switch result {
      case let .success(response):
        do {
          //print(response.data.prettyPrintedJSONString!)
          let results = try JSONDecoder().decode(MovieResults.self, from: response.data)
          completion(results.movies)
        } catch let err {
          print("Error catch - \(err)")
        }
      case let .failure(error):
        print("Error failure - \(error)")
      }
    }
  }
  
}
