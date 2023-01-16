//
//  FavoriteItemView.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 20/10/22.
//

import SwiftUI
import SDWebImageSwiftUI
import RealmSwift

struct FavoriteItemView: View {
  let movie: RealmMovie
  @ObservedResults(RealmMovie.self) var favoriteMovies
  
  var body: some View {
    ZStack {
      WebImage(url: URL(string: movie.getBacdrop()))
        .resizable()
        .scaledToFit()
        .cornerRadius(8.0)
      VStack {
        HStack {
          Spacer()
          Button {
            $favoriteMovies.remove(movie)
          } label: {
            Image(systemName: "star.fill")
              .font(.system(size: 20))
              .foregroundColor(Color("yellow"))
              .shadow(color: Color.black, radius: 4)
              .padding(8.0)
          }
        }
        Spacer()
        AppHeadline(text: movie.title)
          .accentColor(Color.white)
          .padding(8.0)
      }
      .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.124825187, green: 0.1294132769, blue: 0.1380611062, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .center))
      .cornerRadius(8.0)
    }
  }}

struct FavoriteItemView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteItemView(movie: RealmMovie.dummy())
  }
}
