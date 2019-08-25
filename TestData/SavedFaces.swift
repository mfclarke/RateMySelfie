//
//  SavedFaces.swift
//  TestData
//
//  Created by Maximilian Clarke on 25/8/19.
//  Copyright © 2019 Maximilian Clarke. All rights reserved.
//

import UIKit
import RateMySelfieUI

extension TestData {
    public struct SavedFaces {
        public static let regular: [SavedFace] = [
            SavedFace(image: UIImage(named: "Selfie1", in: Bundle.testData, with: nil)!, qualityScore: 0.3245433),
            SavedFace(image: UIImage(named: "Selfie2", in: Bundle.testData, with: nil)!, qualityScore: 0.6334252),
            SavedFace(image: UIImage(named: "Selfie3", in: Bundle.testData, with: nil)!, qualityScore: 0.7045789),
            SavedFace(image: UIImage(named: "Selfie4", in: Bundle.testData, with: nil)!, qualityScore: 0.7523444)
        ]
    }
}

extension Bundle {
    static var testData: Bundle { Bundle(for: TestData.self) }
}
