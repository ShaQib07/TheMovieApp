//
//  RecommendedItemView.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 19/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecommendedItemView: View {
  let movie: Movie
  
  @State var isFavorite = false
  
  var body: some View {
    VStack {
      ZStack {
        WebImage(url: URL(string: movie.getPosterPath()))
          .resizable()
          .scaledToFit()
          .cornerRadius(8.0)
        VStack {
          HStack {
            Spacer()
            Button(
              action: {
                isFavorite = !isFavorite
              }
            ) {
              Image(systemName: isFavorite ? "star.fill" : "star")
                .font(.system(size: 16))
                .foregroundColor(Color("yellow"))
                .shadow(color: Color.black, radius: 4)
                .padding(6.0)
            }
          }
          Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.124825187, green: 0.1294132769, blue: 0.1380611062, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .center))
        .cornerRadius(8.0)
      }
      .frame(width: 200.0, height: 300.0)
      
      AppSubHeadline(text: movie.title)
        .lineLimit(1)
        .frame(width: 160.0)
        .padding(.horizontal)
    }
  }
}

struct RecommendedItemView_Previews: PreviewProvider {
  static var previews: some View {
    RecommendedItemView(movie: Movie.dummy())
  }
}
