//
//  FavoriteView.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 19/10/22.
//

import SwiftUI
import RealmSwift

struct FavoriteView: View {
  @ObservedResults(RealmMovie.self) var favoriteMovies
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      withAnimation {
        ForEach(favoriteMovies) { movie in
          NavigationLink(
            destination: MovieDetailsView(movie: movie.mapToMovie()),
            label: {
              FavoriteItemView(movie: movie)
                .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 4.0, trailing: 10.0))
            })
        }
        .navigationBarTitle("Favorite")
      }
    }
  }
}

struct FavoriteView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteView()
  }
}
