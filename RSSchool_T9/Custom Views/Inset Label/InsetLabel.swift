//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class InsetLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 8, left: 30, bottom: 3, right: 30)))
    }
}
