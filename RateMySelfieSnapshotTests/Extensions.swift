//
//  Extensions.swift
//  RateMySelfieSnapshotTests
//
//  Created by Maximilian Clarke on 25/8/19.
//  Copyright © 2019 Maximilian Clarke. All rights reserved.
//

import UIKit
import RateMySelfieUI

extension Bundle {
    static var ui: Bundle { Bundle(for: SavedFacesViewController.self) }
}

extension UIStoryboard {
    static var main: UIStoryboard {
        UIStoryboard(name: "Main", bundle: Bundle.ui)
    }
    
    func instantiateSavedFacesVC() -> SavedFacesViewController {
        instantiateViewController(identifier: "SavedFacesViewController") as! SavedFacesViewController
    }
}
