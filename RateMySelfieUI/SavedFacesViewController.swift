/*
 Modified from Apple sample code at: https://developer.apple.com/documentation/vision/selecting_a_selfie_based_on_capture_quality
 See LICENSE folder for this sample’s licensing information.

Abstract:
Implements the view controller responsible for reviewing sorted face quality scores for previously captured faces.
*/

import UIKit

class SavedFaceCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelContainer.layer.cornerRadius = 5
        labelContainer.layer.masksToBounds = true
    }
    
    func configure(with face: SavedFace) {
        let faceImage = face.image
        imageView.image = faceImage
        let percent = Int((face.qualityScore * 100).rounded(.up))
        label.text = "\(percent)%"
        labelContainer.backgroundColor = color(forScore: face.qualityScore)
    }
    
    private func color(forScore score: Float) -> UIColor {
        switch score {
        case 0..<0.33:
            return .systemRed
        case 0.33..<0.66:
            return .systemYellow
        case 0.66...1.0:
            return .systemGreen
        default:
            return .systemBlue
        }
    }
}

public class SavedFacesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    public var savedFaces = [SavedFace]()
    var itemSize: CGSize = .zero
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Sort faces in descending quality score order.
        savedFaces.sort { $0.qualityScore < $1.qualityScore }

        calculateItemSize()
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calculateItemSize()
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        calculateItemSize()
    }
    
    func calculateItemSize() {
        let desiredItems = traitCollection.horizontalSizeClass == .compact ? CGFloat(2) : CGFloat(4)
        // Set item size so there are desiredItems items per line.
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        let sectionInset = layout.sectionInset
        let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right
        let squareSideLength = floor(availableWidth / desiredItems - layout.minimumInteritemSpacing * (desiredItems - 1))
        let size = CGSize(width: squareSideLength, height: squareSideLength * 1.333)
        itemSize = size
    }
    
    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedFaces.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedFaceCell", for: indexPath) as? SavedFaceCell else {
            fatalError("Unexpected cell class")
        }
        
        let savedFace = savedFaces[indexPath.item]
        cell.configure(with: savedFace)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
}
