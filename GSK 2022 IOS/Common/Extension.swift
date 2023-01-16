//
//  Extension.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 21/10/22.
//

import Foundation
import SwiftUI

extension Data {
  var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
    guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
       let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
       let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
    return prettyPrintedString
  }
}

extension View {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        

        return root
    }
}
