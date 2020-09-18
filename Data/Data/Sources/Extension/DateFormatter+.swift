//
//  DateFormatter+.swift
//  DataKit
//
//  Created by Владимир on 17.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

extension DateFormatter {
  static func date(timeZone: TimeZone = .UTC) -> DateFormatter {
    buildDateFormatter(with: "yyyyMMdd", timeZone: timeZone)
  }
  
  static func dateWithDot(timeZone: TimeZone = .UTC) -> DateFormatter {
    buildDateFormatter(with: "dd.MM.yyyy", timeZone: timeZone)
  }
  
  private static func buildDateFormatter(with dateFormat: String, timeZone: TimeZone) -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    formatter.timeZone = timeZone
    return formatter
  }
}
