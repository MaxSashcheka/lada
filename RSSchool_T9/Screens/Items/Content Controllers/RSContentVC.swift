//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSContentVC: RSBlackClosableVC {
    
    // MARK: - Customized UI Elements
    let imageView: GradientImageView = {
        let img = GradientImageView(gradientLocations: [0.5, 1])
        img.layer.cornerRadius = 8
        img.layer.borderWidth  = 1
        img.layer.borderColor  = UIColor.white.cgColor
        img.contentMode        = .scaleAspectFill
        img.clipsToBounds      = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor      = .white
        lbl.font           = UIFont(name: "Rockwell-Regular", size: 48)
        lbl.numberOfLines  = 0
        lbl.lineBreakMode  = .byWordWrapping
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        lbl.attributedText = NSMutableAttributedString(string: "Man’s best \nfriend", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let typeLabel: InsetLabel = {
        let lbl = InsetLabel()
        lbl.layer.cornerRadius    = 8
        lbl.layer.borderWidth     = 1
        lbl.layer.borderColor     = UIColor.white.cgColor
        lbl.layer.backgroundColor = UIColor.black.cgColor
        lbl.textColor             = UIColor.white
        lbl.font                  = UIFont(name: "Rockwell-Regular", size: 24)
        lbl.textAlignment         = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let separationLine: UILabel = {
        let lbl = UILabel()
        lbl.layer.borderWidth     = 1
        lbl.layer.borderColor     = UIColor.white.cgColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    
    // MARK: - Configurations
    private func layoutUI() {
        contentView.addSubviews(imageView, typeLabel, separationLine)
        imageView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 3000),
            
            imageView.topAnchor.constraint(equalTo: dismissButtton.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.337),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -55),
            
            typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            separationLine.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 39),
            separationLine.heightAnchor.constraint(equalToConstant: 1),
            separationLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            separationLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
        ])
    }
    
    
    // MARK: - API for Child VC's
    func setupBasicUI(with content: ContentRepresentable) {
        titleLabel.text = content.title
        imageView.image = content.coverImage
        setTypeLabelText(to: content.type)
    }
    
    func setTypeLabelText(to text: String) {
        typeLabel.text = text
        typeLabel.sizeToFit()
        typeLabel.widthAnchor.constraint(equalToConstant: typeLabel.bounds.width + 60).isActive = true
        view.setNeedsLayout()
    }
    
}
