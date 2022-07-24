//
//  CurrentDate.swift
//  AsyncAwait
//
//  Created by soni suman on 24/06/22.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
  let id = UUID()
  let date: String
  
  private enum CodingKeys: String, CodingKey {
    case date = "date"
  }
}
