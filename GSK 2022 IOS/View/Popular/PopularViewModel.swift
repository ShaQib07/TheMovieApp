//
//  ViewModel.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 15/9/22.
//

import Foundation
import RealmSwift

class PopularViewModel: ObservableObject {
  
  @Published var movieList = [Movie]()
  
  func fetchNewMovies(page: Int) {
    NetworkManager.shared.getPopularMovies(page: page) { movies in
      self.movieList.append(contentsOf: movies)
    }
  }
}
