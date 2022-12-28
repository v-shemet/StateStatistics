//
//  LandingView.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import SwiftUI
import DataKit

struct LandingView: View {
  @EnvironmentObject
  var dependencyFactory: DependencyFactory
  
  var body: some View {
    NavigationView {
      List {
        NavigationLink("Exchange Rates") {
          dependencyFactory.resolver.resolve(ExchangeRatesView.self)!
            .navigationBarTitleDisplayMode(.inline)
        }
      }
      .navigationTitle("Landing")
    }
  }
}
