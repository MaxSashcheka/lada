//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSStoryPathCell: UICollectionViewCell {
    
    static let reuseID = "StoryCell"
      
    func set(with strokeColor: CGColor, and path: CGPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = 1
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        layer.addSublayer(shapeLayer)
    }
}
