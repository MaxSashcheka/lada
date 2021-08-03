//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSStoryVC: RSContentVC {
    
    var story: Story!
    
    let textLabel = RSTextLabel(insets: UIEdgeInsets(top: 30, left: 30, bottom: 10, right: 40), textAlignment: .left, numberOfLines: 0)
    var textLabelHeightConstraint: NSLayoutConstraint!
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasicUI(with: story)
        textLabel.text = story.text
        
        layoutUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        textLabelHeightConstraint.constant = heightForView(text: story.text, width: view.safeAreaLayoutGuide.layoutFrame.width - 40)
        contentHeightConstraint.constant   = textLabelHeightConstraint.constant + (view.safeAreaLayoutGuide.layoutFrame.width - 40) * 1.337 + 230
    }
    
    
    // MARK: UI Layout
    private func layoutUI() {
        textLabelHeightConstraint = NSLayoutConstraint(item: textLabel,
                                                     attribute: .height,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1,
                                                     constant: 0)
        
        contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            textLabelHeightConstraint,
        ])
    }
    
    private func heightForView(text:String, width:CGFloat) -> CGFloat{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width - 70, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.font          = UIFont(name: "Rockwell-Regular", size: 24)
        label.textAlignment = .left
        label.text          = text
        label.sizeToFit()
        return label.frame.height + 40
    }
}
