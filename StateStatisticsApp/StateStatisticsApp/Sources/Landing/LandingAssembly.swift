//
//  LandingAssembly.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 29.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import Foundation
import Swinject

final class LandingAssembly: Assembly {
  func assemble(container: Container) {
    register(in: container)
  }
}

// MARK: - Privates
private extension LandingAssembly {
  func register(in container: Container) {
    container.register(LandingView.self) { resolver in
      LandingView()
    }
  }
}
