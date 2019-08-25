/*
 Modified from Apple sample code at: https://developer.apple.com/documentation/vision/selecting_a_selfie_based_on_capture_quality
 See LICENSE folder for this sample’s licensing information.
*/

import UIKit

public struct SavedFace {
    var image: UIImage
    var qualityScore: Float
    
    public init(url: URL, qualityScore: Float) {
        self.image = UIImage(contentsOfFile: url.path)!
        self.qualityScore = qualityScore
    }
    
    public init(image: UIImage, qualityScore: Float) {
        self.image = image
        self.qualityScore = qualityScore
    }
}
