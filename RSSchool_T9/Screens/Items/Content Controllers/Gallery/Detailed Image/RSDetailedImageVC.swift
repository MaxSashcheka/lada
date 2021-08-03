//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSDetailedImageVC: UIViewController {
    
    let scrollView     = UIScrollView()
    let dismissButtton = RSDismissButton()

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addTapGesture()
        layoutUI()
        updateMinimumZoomScale()
        dismissButtton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    }
    
    @objc private func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateMinimumZoomScale()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let widthScale = view.safeAreaLayoutGuide.layoutFrame.width / imageView.image!.size.width
        let heightScale = view.safeAreaLayoutGuide.layoutFrame.height / imageView.image!.size.height
        let scale = min(widthScale, heightScale)
        
        if UIScreen.isPortrait {
            let actualImageHeight = (imageView.image?.size.height)! * scale
            scrollView.contentInset = UIEdgeInsets(top: view.frame.size.height / 2 - actualImageHeight / 2 - 40, left: 0, bottom: 0, right: 0)
        } else {
            let actualImageWidth = (imageView.image?.size.width)! * scale
            scrollView.contentInset = UIEdgeInsets(top: 0, left: view.frame.size.width / 2 - actualImageWidth / 2 - 40, bottom: 0, right: 0)
        }
    }
    
    
    // MARK: - Configurations
    private func updateMinimumZoomScale() {
        let widthScale = view.safeAreaLayoutGuide.layoutFrame.width / imageView.image!.size.width
        let heightScale = view.safeAreaLayoutGuide.layoutFrame.height / imageView.image!.size.height
        let scale = min(widthScale,heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scrollView.minimumZoomScale
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleInterfaceAppearance))
        view.addGestureRecognizer(tap)
    }
    
    @objc func toggleInterfaceAppearance() {
        dismissButtton.isHidden.toggle()
    }
    
    
    // MARK: - Layout
    private func layoutUI() {
        view.addSubviews(scrollView, dismissButtton)
        scrollView.pinToSafeAreaEdges(of: view)
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        scrollView.maximumZoomScale = 3
        scrollView.contentSize = imageView.bounds.size

        NSLayoutConstraint.activate([
            dismissButtton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dismissButtton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            dismissButtton.heightAnchor.constraint(equalToConstant: 40),
            dismissButtton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}


extension RSDetailedImageVC: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let offsetX = max((scrollView.bounds.width - scrollView.contentSize.width) * 0.5, 0)
        let offsetY = max((scrollView.bounds.height - scrollView.contentSize.height) * 0.5, 0)
        scrollView.contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: 0, right: 0)
    }
}
