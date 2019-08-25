//
//  SnapshottingTestCase.swift
//  RateMySelfieSnapshotTests
//
//  Created by Maximilian Clarke on 25/8/19.
//  Copyright © 2019 Maximilian Clarke. All rights reserved.
//

import Foundation
import XCTest
import SnapshotTesting

protocol SnapshottingTestCase {
}

extension SnapshottingTestCase where Self: XCTestCase {
    func forEachSnapshotConfiguration(snapshot: @escaping (ViewImageConfig) -> Void) {
        let configs: [ViewImageConfig] = [
            .iPhoneXr(.portrait),
            .iPhoneSe(.portrait),
            .iPadPro10_5(.portrait),
            .iPadPro10_5(.landscape)
        ]
        
        configs.forEach(snapshot)
    }
}
