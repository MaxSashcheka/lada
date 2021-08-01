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
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        FillingData.data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as! RSStoryCell
        
        var content: ContentRepresentable
        switch FillingData.data[indexPath.row] {
        case .story(let story):     content = story
        case .gallery(let gallery): content = gallery
        }
        
        cell.imageView.image = content.coverImage
        cell.titleLabel.text = content.title
        cell.typeLabel.text  = content.type
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch FillingData.data[indexPath.row] {
        //CODE DUPLICATION
        case .story(let story):
            let storyVC = RSStoryVC()
            storyVC.configure(with: story)
            storyVC.modalPresentationStyle = .fullScreen
            self.present(storyVC, animated: true)
        case .gallery(let gallery):
            let galleryVC = RSGalleryVC()
            galleryVC.configure(with: gallery)
            galleryVC.modalPresentationStyle = .fullScreen
            self.present(galleryVC, animated: true)
        }
    }

}
