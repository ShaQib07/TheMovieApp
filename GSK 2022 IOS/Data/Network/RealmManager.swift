//
//  RealmManager.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 25/10/22.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
  private(set) var localRealm: Realm?
  @Published private(set) var movieList = [RealmMovie]()
  
  init() {
    openRealm()
    getMovies()
  }
  
  func openRealm() {
    do {
      let config = Realm.Configuration(schemaVersion: 1)
      Realm.Configuration.defaultConfiguration = config
      localRealm = try Realm()
    } catch {
      print("Error opening Realm: \(error)")
    }
  }
  
  func addMovie(movie: RealmMovie) {
    if let localRealm = localRealm {
      do {
        try localRealm.write{
          localRealm.add(movie)
          getMovies()
          print("Added new movie to Realm: \(movie.title)")
        }
      } catch {
        print("Error adding movie to Realm: \(error)")
      }
    }
  }
  
  func getMovies() {
    if let localRealm = localRealm {
      let allMovies = localRealm.objects(RealmMovie.self)
      movieList = []
      allMovies.forEach { movie in
        movieList.append(movie)
      }
    }
  }
  
  func updateMovie(movie: RealmMovie) {
    if let localRealm = localRealm {
      do {
        let movieToUpdate = localRealm.objects(RealmMovie.self).filter(NSPredicate(format: "id == %@", movie.id))
        guard !movieToUpdate.isEmpty else { return }
        
        try localRealm.write{
          movieToUpdate[0].title = "Updated \(movie.title)"
          getMovies()
          print("Updated movie title: \(movie.title)")
        }
      } catch {
        print("Error updating movie \(movie.title) to Realm: \(error)")
      }
    }
  }
  
  func deleteMovie(movie: RealmMovie) {
    if let localRealm = localRealm {
      do {
        try localRealm.write{
          movieList = []
          localRealm.delete(movie)
          getMovies()
          print("Deleted movie from Realm: \(movie.title)")
        }
      } catch {
        print("Error deleting movie from Realm: \(error)")
      }
    }
  }
  
}
