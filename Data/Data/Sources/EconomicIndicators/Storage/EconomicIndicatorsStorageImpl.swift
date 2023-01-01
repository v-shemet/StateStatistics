//
//  IndustrialProductionIndexStorageImpl.swift
//  DataKit
//
//  Created by Vladimir Shemet on 30.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import Foundation
import RxSwift

final class IndustrialProductionIndexStorageImpl {
  private let path: String
  private let jsonDecoder: JSONDecoder
  
  init(path: String,
       jsonDecoder: JSONDecoder) {
    self.path = path
    self.jsonDecoder = jsonDecoder
  }
}

// MARK: - EconomicIndicatorsStorage
extension IndustrialProductionIndexStorageImpl: IndustrialProductionIndexStorage {
  func getIndustrialProductionIndices() async throws -> IndustrialProductionIndicesEntity {
    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    let decodedData = try jsonDecoder.decode(IndustrialProductionIndicesEntity.self, from: data)
    
    return decodedData
  }
}
