//
//  SigninView.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 26/12/22.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn
import Firebase

struct SigninView: View {
  var body: some View {
    Button("Sign In with Google") {
      handleSignInButton(viewController: getRootViewController())
    }
  }
}

func handleSignInButton(viewController: UIViewController) {
  GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
              
      if let error = error {
        print("ERROR: \(error)")
      }
              
      guard
        let idToken = result?.user.idToken
      else {
          print("DEBUG: FirebaseAuth.swift. authentication and idToken is nil")
          return
      }
    
    print("DEBUG: IdToken - \(idToken.tokenString)")
  }
}

struct SigninView_Previews: PreviewProvider {
  static var previews: some View {
    SigninView()
  }
}
