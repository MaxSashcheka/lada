//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSDetailedImageVC: UIViewController, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    
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
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    @objc func toggleInterfaceAppearance() {
        self.dismissButtton.isEnabled.toggle()
        UIView.animate(withDuration: 0.15) { [weak self] in
            guard let self = self else { return }
            self.dismissButtton.alpha = self.dismissButtton.isEnabled ? 1 : 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleInterfaceAppearance))
        view.addGestureRecognizer(tap)
        
        updateMinimumZoomScale()
        
        view.addSubviews(scrollView, dismissButtton)
        scrollView.pinToSafeAreaEdges(of: view)
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        scrollView.maximumZoomScale = 4
        scrollView.contentSize = imageView.bounds.size

        NSLayoutConstraint.activate([
            dismissButtton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dismissButtton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            dismissButtton.heightAnchor.constraint(equalToConstant: 40),
            dismissButtton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func updateMinimumZoomScale() {
        let widthScale = view.safeAreaLayoutGuide.layoutFrame.width / imageView.image!.size.width
        let heightScale = view.safeAreaLayoutGuide.layoutFrame.height / imageView.image!.size.height
        let scale = min(widthScale,heightScale)
        scrollView.minimumZoomScale = scale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinimumZoomScale()
        scrollView.zoomScale = scrollView.minimumZoomScale
    }
}
