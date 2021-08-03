//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGalleryImageView: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds      = true
        iv.layer.cornerRadius = 4
        iv.contentMode        = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    init(image: UIImage) {
        super.init(frame: .zero)
        
        clipsToBounds      = true
        layer.borderWidth  = 1
        layer.borderColor  = UIColor.white.cgColor
        layer.cornerRadius = 8
        
        imageView.image = image
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.337)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
