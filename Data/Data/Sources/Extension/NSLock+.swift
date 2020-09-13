//
//  NSLock+.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

extension NSLocking {
  func sync<T>(_ closure: () -> T) -> T {
    lock()
        
    defer {
      unlock()
    }
        
    return closure()
  }
}
