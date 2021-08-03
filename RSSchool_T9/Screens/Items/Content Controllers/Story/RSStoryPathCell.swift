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
    
    let shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeEnd = 1
        shapeLayer.lineWidth = 1
        shapeLayer.fillColor = UIColor.clear.cgColor
        return shapeLayer
    }()
    
    static let reuseID = "StoryCell"
      
    func set(with strokeColor: CGColor, and path: CGPath) {
        layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = strokeColor
        shapeLayer.path = path
    }
}
