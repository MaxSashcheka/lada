//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class InsetLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 8, left: 30, bottom: 3, right: 30)))
    }
}

class RSContentVC: UIViewController {
    
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
        img.contentMode        = .scaleAspectFit
        img.clipsToBounds      = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let typeContainer: UIView = {
        let cont = UIView()
        cont.layer.cornerRadius    = 8
        cont.layer.borderWidth     = 1
        cont.layer.borderColor     = UIColor.white.cgColor
        cont.layer.backgroundColor = UIColor.black.cgColor
        cont.translatesAutoresizingMaskIntoConstraints = false
        return cont
    }()
    
    let typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor     = UIColor.white
        lbl.font          = UIFont(name: "Rockwell-Regular", size: 24)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let separationLine: UILabel = {
        let lbl = UILabel()
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        imageView.image = UIImage(named: "story-1") //tmp
        setTypeLabelText(to: "Story")
    }
    
    private func layoutUI() {
        view.addSubview(dismissButtton)
        view.addSubview(imageView)
        view.addSubview(typeContainer)
        typeContainer.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            dismissButtton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dismissButtton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            dismissButtton.heightAnchor.constraint(equalToConstant: 40),
            dismissButtton.widthAnchor.constraint(equalToConstant: 40),
            
            imageView.topAnchor.constraint(equalTo: dismissButtton.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.337),
            
            typeContainer.centerYAnchor.constraint(equalTo: imageView.bottomAnchor),
            typeContainer.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            typeContainer.heightAnchor.constraint(equalToConstant: 40),
            
            typeLabel.centerXAnchor.constraint(equalTo: typeContainer.centerXAnchor),
            typeLabel.topAnchor.constraint(equalTo: typeContainer.topAnchor, constant: 8),
            typeLabel.bottomAnchor.constraint(equalTo: typeContainer.bottomAnchor, constant: -3),
        ])
    }
    
    private func setTypeLabelText(to text: String) {
        typeLabel.text = text
        typeLabel.sizeToFit()
        typeContainer.widthAnchor.constraint(equalToConstant: typeLabel.bounds.width + 60).isActive = true
        view.setNeedsLayout()
    }
    
}
