/*
 Modified from Apple sample code at: https://developer.apple.com/documentation/vision/selecting_a_selfie_based_on_capture_quality
 See LICENSE folder for this sample’s licensing information.

Abstract:
Implements the view controller responsible for capturing images and processing them with Vision to get face capture quality metric.
*/

import Foundation
import RateMySelfieUI

public class SavedFacesDataSource {
    
    let baseURL: URL
    public var savedFaces = [SavedFace]()
    
    public init() {
        guard let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Unable to locate Documents directory.")
        }
        self.baseURL = docsURL
        removePreviouslySavedFaces()
    }
    
    public func saveFaceCrop(_ jpegData: Data, faceId: String, qualityScore: Float) {
        let fileURL = baseURL.appendingPathComponent(faceId).appendingPathExtension("jpeg")
        do {
            try jpegData.write(to: fileURL)
            let newFace = SavedFace(url: fileURL, qualityScore: qualityScore)
            savedFaces.append(newFace)
        } catch {
            print("Unable to save face crop: \(error.localizedDescription)")
        }
    }
    
    public func removePreviouslySavedFaces() {
        let fileMgr = FileManager.default
        guard let files = try? fileMgr.contentsOfDirectory(at: baseURL, includingPropertiesForKeys: nil) else {
            return
        }
        for file in files {
            try? fileMgr.removeItem(at: file)
        }
        savedFaces.removeAll()
    }
}
