//
//  DependencyFactory.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import Foundation
import DataKit
import Swinject

final class DependencyFactory: ObservableObject {
  private lazy var assembler = Assembler([DataAssembly()] + UI().assemblies)
  
  var resolver: Resolver {
    assembler.resolver
  }
}

// MARK: - UI Assemblies
private extension DependencyFactory {
  struct UI {
    var assemblies: [Assembly] = [
      LandingAssembly(),
      ExchangeRatesAssembly()
    ]
  }
}
