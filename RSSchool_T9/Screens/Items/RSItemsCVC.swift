//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSItemsCVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        layoutUI()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as! RSStoryCell
        cell.imageView.image = UIImage(named: "story-1")
        cell.titleLabel.text = "Man’s best friend"
        cell.typeLabel.text  = "Story"
        return cell
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }

}
