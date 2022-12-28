//
//  StateStatisticsApp.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import SwiftUI
import Swinject

@main
struct StateStatisticsApp: App {
  let dependencyFactory: DependencyFactory = DependencyFactory()
  
  var body: some Scene {
    WindowGroup {
      dependencyFactory.resolver.resolve(LandingView.self)!
        .environmentObject(dependencyFactory)
    }
  }
}
