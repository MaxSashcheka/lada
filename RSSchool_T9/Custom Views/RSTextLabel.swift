//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSTextLabel: UILabel {
    
    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets, textAlignment: NSTextAlignment, numberOfLines: Int = 1) {
        self.insets        = insets
        super.init(frame: .zero)
        layer.cornerRadius    = 8
        layer.borderWidth     = 1
        layer.borderColor     = UIColor.white.cgColor
        layer.backgroundColor = UIColor.black.cgColor
        textColor             = UIColor.white
        font                  = UIFont(name: "Rockwell-Regular", size: 24)
        self.textAlignment    = textAlignment
        self.numberOfLines    = numberOfLines
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
}
