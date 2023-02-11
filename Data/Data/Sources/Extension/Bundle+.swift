//
//  Bundle+.swift
//  DataKit
//
//  Created by Vladimir Shemet on 31.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import Foundation

final class DataKitBundle {
    static var current: Bundle { Bundle.current }
}

extension Bundle {
    static var current: Bundle { Bundle(for: ___Bundle.self) }
}

/// The class is defined just for detecting current bundle purpose
private final class ___Bundle { }
