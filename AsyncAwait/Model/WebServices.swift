//
//  WebServices.swift
//  AsyncAwait
//
//  Created by soni suman on 23/06/22.
//

import Foundation

class WebServices {
  func getDate() async throws -> CurrentDate? {
    guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
      fatalError("Url is incorrect!")
    }
    let (data , _) = try await URLSession.shared.data(from: url)
    return try? JSONDecoder().decode(CurrentDate.self, from: data)
  }
}
