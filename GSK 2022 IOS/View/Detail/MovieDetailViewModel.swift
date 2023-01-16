//
//  MovieDetailViewModel.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 19/10/22.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
  
  @Published var movieList = [Movie]()
  
  func fetchRecommendedMovies(id: Int) {
    NetworkManager.shared.getRecommendations(id: id) { movies in
      print(movies)
      self.movieList.append(contentsOf: movies)
    }
  }
}
