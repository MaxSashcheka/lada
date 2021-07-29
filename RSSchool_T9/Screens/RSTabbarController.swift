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
    
    private func configuredRSItemsVC() -> RSItemsVC {
        let itemsVC = RSItemsVC()
        itemsVC.tabBarItem = UITabBarItem(title: "Items", image: UIImage(systemName: "person"), tag: 0)
        return itemsVC
    }
    
    private func configuredRSSettingsVC() -> RSSettingsTVC {
        let settingsVC = RSSettingsTVC()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "star"), tag: 1)
        return settingsVC
    }

}
