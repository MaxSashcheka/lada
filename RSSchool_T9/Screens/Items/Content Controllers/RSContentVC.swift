//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSContentVC: UIViewController {
    
    let scrollView  = UIScrollView()
    let contentView = UIView()
    
    // MARK: - Customized UI Elements
    let dismissButtton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor          = .white
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth  = 1
        btn.layer.borderColor  = UIColor.white.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        return btn
    }()
    
    @objc private func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    let imageView: UIImageView = {
        let img = UIImageView()
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
        view.backgroundColor = .black
        configureScrollView()
        layoutUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.72).cgColor]
        gradientLayer.locations = [0.5, 1]
        imageView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    // MARK: - Configurations
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1000)//work on height
        ])
    }
    
    private func layoutUI() {
        contentView.addSubviews(dismissButtton, imageView, typeLabel, separationLine)
        imageView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            dismissButtton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            dismissButtton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dismissButtton.heightAnchor.constraint(equalToConstant: 40),
            dismissButtton.widthAnchor.constraint(equalToConstant: 40),
            
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
