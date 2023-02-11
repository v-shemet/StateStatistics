//
//  DataAssembly.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Swinject

public final class DataAssembly: Assembly {
  private let assemblies: [Assembly] = [
    EconomicIndicatorsAssembly(),
    ExchangeRatesAssembly(),
    NetworkingAssembly()
  ]
  
  public init() { }
  
  public func assemble(container: Container) {
    assemblies
      .forEach { $0.assemble(container: container) }
  }
}
