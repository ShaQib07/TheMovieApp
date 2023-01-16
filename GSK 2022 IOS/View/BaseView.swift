//
//  BaseView.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 3/10/22.
//

import SwiftUI

struct AppTitle: View {
  let text: String
  
  var body: some View {
    Text(text.uppercased())
        .kerning(2)
        .font(.title)
        .fontWeight(.black)
  }
}

struct AppHeadline: View {
  let text: String
  
  var body: some View {
    Text(text.uppercased())
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.title2)
  }
}

struct AppSubHeadline: View {
  let text: String
  
  var body: some View {
    Text(text)
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.title3)
  }
}

struct AppText: View {
  let text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.light)
  }
}

struct AppButton: View {
  let text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.accentColor)
      .foregroundColor(.white)
      .cornerRadius(12.0)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack{
      AppTitle(text: "This is our title text.")
      AppHeadline(text: "This is our headline text.")
      AppSubHeadline(text: "This is our sub headline text.")
      AppText(text: "This is our basic text.")
      AppButton(text: "Press the button")
    }
    .padding()
  }
}
