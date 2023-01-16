//
//  Movie.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 15/9/22.
//

import Foundation

struct Movie {
  let id: Int
  let posterPath: String?
  let backdrop: String?
  let title: String
  let releaseDate: String
  let rating: Float
  let overview: String
  
  func getPosterPath() -> String {
    return "https://image.tmdb.org/t/p/w500/\(self.posterPath ?? "/pHkKbIRoCe7zIFvqan9LFSaQAde.jpg")"
  }
  
  func getBacdrop() -> String {
    return "https://image.tmdb.org/t/p/w500/\(self.backdrop ?? "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg")"
  }
  
  func mapToRealmMovie() -> RealmMovie {
    return RealmMovie(
      id: self.id,
      posterPath: self.posterPath,
      backdrop: self.backdrop,
      title: self.title,
      releaseDate: self.releaseDate,
      rating: self.rating,
      overview: self.overview
    )
  }
  
  static func dummy() -> Movie {
    return Movie(
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

extension Movie: Decodable {
  enum MovieCodingKeys: String, CodingKey {
    case id
    case posterPath = "poster_path"
    case backdrop = "backdrop_path"
    case title
    case releaseDate = "release_date"
    case rating = "vote_average"
    case overview
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieCodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    posterPath = try? container.decode(String.self, forKey: .posterPath)
    backdrop = try? container.decode(String.self, forKey: .backdrop)
    title = try container.decode(String.self, forKey: .title)
    releaseDate = try container.decode(String.self, forKey: .releaseDate)
    rating = try container.decode(Float.self, forKey: .rating)
    overview = try container.decode(String.self, forKey: .overview)
  }
}
