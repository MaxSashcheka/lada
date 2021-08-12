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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RSItemCell.reuseID, for: indexPath) as! RSItemCell
        
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
        let sectionWidthInset: CGFloat
        let minimumItemSpacing: CGFloat
        
        if UIScreen.isPortrait {
            sectionWidthInset = 20
            minimumItemSpacing = 16
        } else {
            sectionWidthInset = 80
            minimumItemSpacing = 64
        }

        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width - sectionWidthInset * 2
        let availableSpace       = width - minimumItemSpacing
        let itemWidth            = availableSpace / 2
        let aspectRatio: CGFloat = 1.223
        return CGSize(width: itemWidth, height: itemWidth * aspectRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIScreen.isPortrait
            ? UIEdgeInsets(top: 40, left: 20, bottom: 40, right: 20)
            : UIEdgeInsets(top: 40, left: 80, bottom: 40, right: 80)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }

}
