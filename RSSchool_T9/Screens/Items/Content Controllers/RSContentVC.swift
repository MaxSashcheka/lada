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
    
    // MARK: - Customized UI Elements
    var imageLeadingConstraint:  NSLayoutConstraint!
    var imageTrailingConstraint: NSLayoutConstraint!
    
    let scrollView  = UIScrollView()
    let contentView = UIView()
    let dismissButtton = RSDismissButton()
    
    let imageView: RSGradientImageView = {
        let img = RSGradientImageView(gradientLocations: [0.5, 1])
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
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let typeLabel = RSTextLabel(insets: UIEdgeInsets(top: 8, left: 30, bottom: 3, right: 30),  textAlignment: .center)
    
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
        dismissButtton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    }
    
    @objc private func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        imageLeadingConstraint.constant  = UIScreen.isPortrait ? 20 : UIScreen.main.bounds.width * 0.25
        imageTrailingConstraint.constant = -imageLeadingConstraint.constant
    }
    
    
    // MARK: - API for Child VC's
    func setupBasicUI(with content: ContentRepresentable) {
        imageView.image = content.coverImage
        setTypeLabelText(to: content.type)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        titleLabel.attributedText = NSMutableAttributedString(string: content.title.trimmingCharacters(in: .newlines), attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    private func setTypeLabelText(to text: String) {
        typeLabel.text = text
        typeLabel.sizeToFit()
        typeLabel.widthAnchor.constraint(equalToConstant: typeLabel.bounds.width + 60).isActive = true
        view.setNeedsLayout()
    }
    
    
    // MARK: - Configurations
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToSafeAreaEdges(of: view)
        contentView.pinToEdges(of: scrollView)
    }
    
    private func layoutUI() {
        instantiateImageConstraints()
        
        contentView.addSubviews(imageView, typeLabel, separationLine, dismissButtton)
        imageView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            dismissButtton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            dismissButtton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            dismissButtton.heightAnchor.constraint(equalToConstant: 40),
            dismissButtton.widthAnchor.constraint(equalToConstant: 40),
            
            imageLeadingConstraint,
            imageTrailingConstraint,
            imageView.topAnchor.constraint(equalTo: dismissButtton.bottomAnchor, constant: 30),
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
    
    private func instantiateImageConstraints() {
        imageLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: contentView,
                                                     attribute: .leading,
                                                     multiplier: 1,
                                                     constant: 0)
        
        imageTrailingConstraint = NSLayoutConstraint(item: imageView,
                                                     attribute: .trailing,
                                                     relatedBy: .equal,
                                                     toItem: contentView,
                                                     attribute: .trailing,
                                                     multiplier: 1,
                                                     constant: 0)
    }
}
