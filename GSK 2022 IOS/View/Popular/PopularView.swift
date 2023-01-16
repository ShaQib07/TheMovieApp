//
//  ContentView.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 15/9/22.
//

import SwiftUI

struct PopularView: View {
  @StateObject private var viewModel = PopularViewModel()
  @State var goToFavorite = false
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        ForEach(viewModel.movieList, id: \.id) { movie in
          NavigationLink( 
            destination: MovieDetailsView(movie: movie),
            label: {
              ItemView(viewModel: viewModel, movie: movie)
                .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 4.0, trailing: 10.0))
            })
        }
      }
      .navigationBarTitle("Popular")
      .navigationBarItems(
        trailing:
          NavigationLink(destination: FavoriteView(), label: {
            Image(systemName: "star.fill")
          })
      )
      .onAppear { viewModel.fetchNewMovies(page: 1) }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    PopularView()
  }
}
