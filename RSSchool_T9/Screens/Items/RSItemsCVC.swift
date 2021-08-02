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

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    
    // MARK: - Customization
    private func configureCollectionView() {
        view.backgroundColor           = .white
        collectionView.backgroundColor = .white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    // MARK: - Delegate methods
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
        case .story(let story):
            let storyVC = RSStoryVC()
            storyVC.story = story
            storyVC.modalPresentationStyle = .fullScreen
            self.present(storyVC, animated: true)
        case .gallery(let gallery):
            let galleryVC = RSGalleryVC()
            galleryVC.gallery = gallery
            galleryVC.modalPresentationStyle = .fullScreen
            self.present(galleryVC, animated: true)
        }
    }

}

// MARK: - Adjusting cllection flow
extension RSItemsCVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
            - sectionInset.left
            - sectionInset.right
            - collectionView.contentInset.left
            - collectionView.contentInset.right

        let minimumItemSpacing: CGFloat = 16
        let aspectRatio: CGFloat        = 1.223
        let availableSpace              = width - minimumItemSpacing
        let itemWidth                   = availableSpace / 2

        return CGSize(width: itemWidth, height: itemWidth * aspectRatio)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }

}
