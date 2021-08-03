//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGalleryCell: UICollectionViewCell {
    
    var imageView: RSGalleryImageView!
    
    static let reuseID = "GalleryCell"
    
    func set(with image: UIImage) {
        self.imageView = RSGalleryImageView(image: image)
        addSubview(imageView)
        imageView.pinToEdges(of: self)
    }
    
}
