//
//  JSONEncoder+.swift
//  DataKit
//
//  Created by Владимир on 17.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

extension JSONEncoder {
  static var iso8601compatible: JSONEncoder { JSONEncoder(dateEncodingStrategy: .iso8601) }
  
  static func encoder(with customDateFormatter: DateFormatter) -> JSONEncoder {
    JSONEncoder(dateEncodingStrategy: .formatted(customDateFormatter))
  }
  
  private convenience init(dateEncodingStrategy: DateEncodingStrategy) {
    self.init()
      
    self.dateEncodingStrategy = dateEncodingStrategy
  }
}
