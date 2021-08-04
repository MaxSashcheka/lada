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
    var strokeColor: CGColor!
    var drawStories: Bool!
    
    let textLabel = RSTextLabel(insets: UIEdgeInsets(top: 30, left: 30, bottom: 10, right: 40), textAlignment: .left, numberOfLines: 0)
    var textLabelHeightConstraint: NSLayoutConstraint!
    
    let collectionView: UICollectionView = {
        let flowLayout                = UICollectionViewFlowLayout()
        flowLayout.sectionInset       = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        flowLayout.itemSize           = CGSize(width: 75, height: 75)
        flowLayout.minimumLineSpacing = 100
        flowLayout.scrollDirection    = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.register(RSStoryPathCell.self, forCellWithReuseIdentifier: RSStoryPathCell.reuseID)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupBasicUI(with: story)
        textLabel.text = story.text
        
        layoutUI()
        loadPersistedData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let width = view.safeAreaLayoutGuide.layoutFrame.width
        textLabelHeightConstraint.constant = heightForView(text: story.text, width: width - 40)
    }
    
    
    // MARK: Configurations
    private func loadPersistedData() {
        let colorIndex = Int(UserDefaults.standard.string(forKey: "selectedColorIndex") ?? "6") ?? 6 //🙄
        strokeColor = UIColor(hexString: RSColorsTVC.sampleColors()[colorIndex]).cgColor
        
        if UserDefaults.standard.object(forKey: "drawStories") == nil {
            UserDefaults.standard.set(true, forKey: "drawStories")
            UserDefaults.standard.synchronize()
        }
        
        drawStories = UserDefaults.standard.bool(forKey: "drawStories")
    }
    
    
    // MARK: Layout
    private func layoutUI() {
        textLabelHeightConstraint = NSLayoutConstraint(item: textLabel, attribute: .height, relatedBy: .equal,
                                                     toItem: nil, attribute: .notAnAttribute, multiplier: 1,
                                                     constant: 0)
        
        contentView.addSubviews(collectionView, textLabel)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: separationLine.bottomAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -50),
            collectionView.heightAnchor.constraint(equalToConstant: 100),

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


// MARK: - Collection View Delegate and Data Source
extension RSStoryVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: RSStoryPathCell.reuseID, for: indexPath)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        story.paths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! RSStoryPathCell
        cell.removeShapeLayer()
        cell.set(with: strokeColor, and: story.paths[indexPath.row], animated: drawStories)
    }
}
