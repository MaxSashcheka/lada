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
    
    let dismissButtton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    private func layoutUI() {
        view.addSubview(dismissButtton)
        NSLayoutConstraint.activate([
            dismissButtton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dismissButtton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            dismissButtton.heightAnchor.constraint(equalToConstant: 40),
            dismissButtton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
