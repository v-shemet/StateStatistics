//
//  Encodable+.swift
//  DataKit
//
//  Created by Владимир on 17.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

extension Encodable {
  func asDictionary(with encoder: JSONEncoder) throws -> [String: Any] {
    let data = try encoder.encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    
    return dictionary
  }
}
