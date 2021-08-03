//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSDismissButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setImage(UIImage(systemName: "xmark"), for: .normal)
        tintColor          = .white
        layer.cornerRadius = 20
        layer.borderWidth  = 1
        layer.borderColor  = UIColor.white.cgColor
        adjustsImageWhenHighlighted = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
