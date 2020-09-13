//
//  NetworkJSONResponseFormatter.swift
//  DataKit
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

final class NetworkJSONResponseFormatter {
  func format(_ data: Data) -> String {
    let resultData: Data
        
    do {
      let dataAsJSON = try JSONSerialization.jsonObject(with: data)
      resultData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
    } catch {
      resultData = data
    }
        
    return String(data: resultData, encoding: .utf8) ?? "## Cannot map data to String ##"
  }
}
