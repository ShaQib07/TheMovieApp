//
//  RealmMovie.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 19/10/22.
//

import Foundation
import RealmSwift

class RealmMovie: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var id: Int
  @Persisted var posterPath: String?
  @Persisted var backdrop: String?
  @Persisted var title: String
  @Persisted var releaseDate: String
  @Persisted var rating: Float
  @Persisted var overview: String
  
  func getPosterPath() -> String {
    return "https://image.tmdb.org/t/p/w500/\(self.posterPath ?? "/pHkKbIRoCe7zIFvqan9LFSaQAde.jpg")"
  }
  
  func getBacdrop() -> String {
    return "https://image.tmdb.org/t/p/w500/\(self.backdrop ?? "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg")"
  }
  
  convenience init(id: Int, posterPath: String?, backdrop: String?, title: String, releaseDate: String, rating: Float, overview: String) {
    self.init()
    self.id = id
    self.posterPath = posterPath
    self.backdrop = backdrop
    self.title = title
    self.releaseDate = releaseDate
    self.rating = rating
    self.overview = overview
  }
  
  func mapToMovie() -> Movie {
    return Movie(
      id: self.id,
      posterPath: self.posterPath,
      backdrop: self.backdrop,
      title: self.title,
      releaseDate: self.releaseDate,
      rating: self.rating,
      overview: self.overview
    )
  }
  
  static func dummy() -> RealmMovie {
    return RealmMovie(
      id: 575322,
      posterPath: "/pHkKbIRoCe7zIFvqan9LFSaQAde.jpg",
      backdrop: "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg",
      title: "Orphan : First Kill",
      releaseDate: "01/01/01",
      rating: 9.9,
      overview: "Good Movie.\nVery not so scary movie."
    )
  }
}
