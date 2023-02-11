//
//  Country.swift
//  DomainKit
//
//  Created by Vladimir Shemet on 01.01.2023.
//  Copyright © 2023 Vladimir Shemet. All rights reserved.
//

import Foundation

public struct Country {
  public let code: String
  public let name: String
  
  public init(code: String, name: String) {
    self.code = code
    self.name = name
  }
}
