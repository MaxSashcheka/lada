//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGalleryVC: RSContentVC {
    
    var gallery: Gallery!
    var contentHeightConstraint: NSLayoutConstraint!
    
    let imagesStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 20
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasicUI(with: gallery)
        loadImagesToViews()
        layoutUI()
    }
    
    
    // MARK: - Customization and layout
    private func loadImagesToViews() {
        for image in gallery.images {
            let iv = GalleryImageView(image: image)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openImageVC))
            iv.addGestureRecognizer(tapGesture)
            imagesStackView.addArrangedSubview(iv)
        }
    }
    
    @objc private func openImageVC(_ sender: UITapGestureRecognizer) {
        let imageVC = RSDetailedImageVC()
        imageVC.imageView.image = (sender.view as! GalleryImageView).imageView.image
        imageVC.modalPresentationStyle = .fullScreen
        self.present(imageVC, animated: true)
    }

    private func layoutUI() {
        contentHeightConstraint = NSLayoutConstraint(item: contentView,
                                                     attribute: .height,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1,
                                                     constant: 0)
        
        contentView.addSubview(imagesStackView)
        NSLayoutConstraint.activate([
            contentHeightConstraint,
            imagesStackView.topAnchor.constraint(equalTo: separationLine.bottomAnchor, constant: 40),
            imagesStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imagesStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(view.safeAreaLayoutGuide.layoutFrame.width)
        contentHeightConstraint.constant = CGFloat(gallery.images.count + 1) * ((view.safeAreaLayoutGuide.layoutFrame.width - 40) * 1.337 + 20) + 190
    }
    
}
