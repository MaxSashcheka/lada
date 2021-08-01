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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasicUI(with: story)
    }

}
