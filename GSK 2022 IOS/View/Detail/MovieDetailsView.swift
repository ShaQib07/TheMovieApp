//
//  MovieDetailsView.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 14/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailsView: View {
  @Environment(\.presentationMode) var presentationMode
  @StateObject private var viewModel = MovieDetailViewModel()
  
  let movie: Movie
  let posterBaseUrl = "https://image.tmdb.org/t/p/w500/"
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading) {
        WebImage(url: URL(string: movie.getPosterPath()))
          .resizable()
          .scaledToFit()
        
        AppTitle(text: movie.title)
          .padding(.leading, 16.0)
          .padding(.bottom, 2.0)
        
        AppText(text: movie.overview)
          .multilineTextAlignment(.leading)
          .lineSpacing(0.0)
          .padding(.horizontal, 12.0)
        
        AppHeadline(text: "Recommended Movies")
          .padding(.leading, 16.0)
          .padding(.top, 2.0)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack {
            ForEach(viewModel.movieList, id: \.id) { movie in
              RecommendedItemView(movie: movie)
                .padding(EdgeInsets(top: 0.0, leading: 4.0, bottom: 8.0, trailing: 0.0))
            }
          }
        }
        .padding(.horizontal, 8.0)
      }
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(
        leading:
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }) {
            HStack {
              Image(systemName: "arrow.left")
                .font(.system(size: 20))
                .shadow(color: Color.black, radius: 4)
            }
          })
    }
    .ignoresSafeArea(.all, edges: .top)
    .onAppear { viewModel.fetchRecommendedMovies(id: movie.id) }
  }
}

struct MovieDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetailsView(movie: Movie.dummy())
  }
}
