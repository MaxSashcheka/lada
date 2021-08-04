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
    
    private var shapeLayer: CAShapeLayer!
    
    static let reuseID = "StoryPathCell"
      
    func set(with strokeColor: CGColor, and path: CGPath, animated: Bool) {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.frame = self.bounds//
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = 1
        shapeLayer.strokeEnd = 1
        
        if animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 3
            animation.fromValue = 0
            animation.toValue = 1
            shapeLayer.add(animation, forKey: "animatePath")
        }
        
        layer.addSublayer(shapeLayer)
    }
    
    func removeShapeLayer() {
        if shapeLayer != nil {
            shapeLayer.removeFromSuperlayer()
        }
    }
}
