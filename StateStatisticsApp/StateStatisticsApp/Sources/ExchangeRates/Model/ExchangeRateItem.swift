//
//  ExchangeRateItem.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import Foundation

struct ExchangeRateItem: Identifiable {
  let id: UUID = UUID()
  let text: String
  let value: String
  let isHighlighted: Bool
}
