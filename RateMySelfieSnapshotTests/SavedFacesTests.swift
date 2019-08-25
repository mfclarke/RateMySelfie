//
//  SavedFacesTests.swift
//  RateMySelfieUITests
//
//  Created by Maximilian Clarke on 25/8/19.
//  Copyright © 2019 Maximilian Clarke. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import RateMySelfieUI
@testable import TestData

class SavedFacesTests: XCTestCase, SnapshottingTestCase {
    
    func testNoFaces() {
        forEachSnapshotConfiguration { config in
            let sut = UIStoryboard.main.instantiateSavedFacesVC()
            
            assertSnapshot(matching: sut, as: .image(on: config))
        }
    }
    
    func testDifferentSizedFaces() {
        forEachSnapshotConfiguration { config in
            let sut = UIStoryboard.main.instantiateSavedFacesVC()
            
            sut.savedFaces = TestData.SavedFaces.regular
            
            assertSnapshot(matching: sut, as: .image(on: config))
        }
    }

}
