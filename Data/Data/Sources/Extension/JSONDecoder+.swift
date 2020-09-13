//
//  JSONDecoder+.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

extension JSONDecoder {
  static var iso8601compatible: JSONDecoder { JSONDecoder(dateDecodingStrategy: .iso8601) }
  
  convenience init(dateDecodingStrategy: DateDecodingStrategy) {
    self.init()
      
    self.dateDecodingStrategy = dateDecodingStrategy
  }
}
