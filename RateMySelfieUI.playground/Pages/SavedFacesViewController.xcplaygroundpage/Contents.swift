//: [Previous](@previous)

import UIKit
import RateMySelfieUI
import TestData
import PlaygroundSupport

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

let savedFacesVC = UIStoryboard.main.instantiateSavedFacesVC()
savedFacesVC.savedFaces = TestData.SavedFaces.regular

let controllers = playgroundControllers(
    device: .phone5_5inch,
    orientation: .portrait,
    child: savedFacesVC)

PlaygroundPage.current.liveView = controllers.parent.view

//: [Next](@next)
