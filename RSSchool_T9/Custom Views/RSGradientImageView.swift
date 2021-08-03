//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGradientImageView: UIImageView {
    
    var gradientLocations: [NSNumber]
    
    init(gradientLocations: [NSNumber]) {
        self.gradientLocations = gradientLocations
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        if (self.layer.sublayers?.count ?? 0 > 1) {
            for layer in self.layer.sublayers! {
                if let grlayer = layer as? CAGradientLayer {
                    grlayer.removeFromSuperlayer()
                }
            }
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.72).cgColor]
        gradientLayer.locations = gradientLocations
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
