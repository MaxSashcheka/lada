//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.minimumScaleFactor = 0.5

import UIKit

class RSItemCell: UICollectionViewCell {
    
    static let reuseID = "ItemCell"
    
    let imageView: RSGradientImageView = {
        let img = RSGradientImageView(gradientLocations: [0.64, 0.95])
        img.layer.cornerRadius = 10
        img.layer.borderColor  = UIColor.black.cgColor
        img.layer.borderWidth  = 1.0
        img.clipsToBounds      = true
        img.contentMode        = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let titleLabel: UILabel = {
        let lbl       = UILabel()
        lbl.textColor = UIColor.white
        lbl.font      = UIFont(name: "Rockwell", size: 16)

        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let typeLabel: UILabel = {
        let lbl       = UILabel()
        lbl.textColor = UIColor(hexString: "B6B6B6")
        lbl.font      = UIFont(name: "Rockwell", size: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 18
        layer.borderWidth  = 1.0
        layer.borderColor  = UIColor.black.cgColor
    }
    
    private func layoutUI() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
        
        imageView.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -50),
            typeLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
            typeLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        imageView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -3),
            titleLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
}
