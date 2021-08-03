//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [configuredRSItemsVC(), configuredRSSettingsVC()]
    }
    
    private func configuredRSSettingsVC() -> UINavigationController {
        let settingsVC = RSSettingsTVC(style: .insetGrouped)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        settingsVC.title = "Settings"
        return UINavigationController(rootViewController: settingsVC)
    }
    
    private func configuredRSItemsVC() -> RSItemsCVC {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 30
        let itemsVC = RSItemsCVC(collectionViewLayout: flowLayout)
        itemsVC.tabBarItem = UITabBarItem(title: "Items", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        itemsVC.collectionView.register(RSItemCell.self, forCellWithReuseIdentifier: RSItemCell.reuseID)
        return itemsVC
    }

}
