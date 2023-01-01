//
//  IndustrialProductionIndexStorage.swift
//  DataKit
//
//  Created by Vladimir Shemet on 30.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import Foundation
import RxSwift

protocol IndustrialProductionIndexStorage {
  func getIndustrialProductionIndices() async throws -> IndustrialProductionIndicesEntity
}
