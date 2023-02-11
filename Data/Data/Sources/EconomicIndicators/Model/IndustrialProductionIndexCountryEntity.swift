//
//  IndustrialProductionIndexCountryEntity.swift
//  DataKit
//
//  Created by Vladimir Shemet on 01.01.2023.
//  Copyright © 2023 Vladimir Shemet. All rights reserved.
//

import Foundation

struct IndustrialProductionIndexCountryEntity: Decodable {
  let countryCode: String
  let countryName: String
  let indices: [ProductionIndexEntity]
}
